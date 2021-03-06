<?php
error_reporting(E_ALL);
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Profile extends ValidateAccess {

    public function __construct() {
        parent::__construct();
        $this->load->database();
        //$this->db_backend = $this->load->database('game_system', TRUE);

        $this->load->model('ProfileDao');
        $this->load->model('ModuleDao');
        $this->load->model('ModuleProfileAccessDao');
        $this->load->library(array('form_validation', 'session'));
        $this->load->helper(array('form', 'url'));
        $this->layout->isLogin = false;
        $this->layout->title = "Admin Happyland - Perfiles";
    }
    
    public function index() {
        try {
            $this->validateAccessByModule();
            $this->layout->assets(base_url() . 'assets/lib/js/jquery.dataTables.js');
            $this->layout->assets(base_url() . 'assets/happy/js/pipeline_table.js');
            $this->layout->assets(base_url() . 'assets/happy/js/load.table.list.js');
            $this->layout->assets(base_url() . 'assets/happy/css/data-table.css');
            $this->layout->view('Profile/listProfile');
        } catch (Exception $e) {
            echo $e;
        }
    }

    public function getDataTableList() {
        $dbl_profile = $this->ProfileDao->getAllProfiles();
        $a_profile_list = array();
        foreach ($dbl_profile as $dbr_profile) {
            if($dbr_profile->sys_block){
                $delete_buttom  = '<div class="btn btn-primary btn-xs disabled" style="cursor:not-allowed"><i class="icon-trash icon-white disabled"></i><span><strong>Eliminar</strong></span></div>';
            } else {
                $delete_buttom  = anchor(site_url('Profile/deleteProfile/' . $dbr_profile->id), '<i class="icon-trash icon-white"></i><span><strong>Eliminar</strong></span>', array('class' => 'delete-action btn btn-primary btn-xs'));
            }
            $a_profile_list["aaData"][]  = array(
                                                    $dbr_profile->id, 
                                                    $dbr_profile->name, 
                                                    $dbr_profile->description, 
                                                    Status::getHTMLStatus($dbr_profile->status),
                                                    anchor(site_url('Profile/maintenanceProfile/' . $dbr_profile->id), '<i class="icon-edit icon-white"></i><span><strong>Editar</strong></span>', array('class' => 'btn btn-primary btn-xs'))
                                                    . ' ' .
                                                    $delete_buttom
                                                );
        }
        $this->output
             ->set_content_type('application/json')
             ->set_output(json_encode($a_profile_list));
    }

    public function maintenanceProfile($profile_id = null) {
        $this->validateAccessByModule();
        $data['dbr_profile'] = array();
        $data['is_new'] = true;
        if (isset($profile_id) && $profile_id) {
            $data['dbr_profile'] = $this->ProfileDao->getProfileById($profile_id); 
            $data['is_new'] = false;
        }
        $a_modules   = $this->ModuleDao->getDropdownModule($profile_id);
        $data['a_parent_modules']           = $a_modules['a_modules'];
        $data['a_parent_modules_selected']  = $a_modules['a_modules_selected'];
        $data['a_status']           = Status::getProfileStatus();

        if ($this->input->post()) {
            $this->saveProfile();
        }
        $this->layout->assets(base_url() . 'assets/lib/css/chosen.css');
        $this->layout->assets(base_url() . 'assets/lib/js/chosen.jquery.js');
        $this->layout->assets(base_url() . 'assets/happy/js/profile/profile.edit.js');
        $this->layout->assets(base_url() . 'assets/lib/js/bootbox.min.js');
        $this->layout->view('Profile/maintenanceProfile', $data);
    }
    
    private function saveProfile() {
        $profile_credentials = $this->input->post('formprofile');
        
        $this->form_validation->set_rules('formprofile[name]', 'Nombre', 'required|trim|min_length[3]|xss_clean');
        $this->form_validation->set_rules('formprofile[description]', 'Descripción', 'trim|min_length[3]|xss_clean');
        $this->form_validation->set_rules('formprofile[access_permition]', 'Accesos', 'required|trim|min_length[3]|xss_clean');
        $this->form_validation->set_rules('formprofile[status]', 'Estado', 'required|trim|mim_length[3]|max_length[3]|xss_clean');

        $this->form_validation->set_message('required', 'El %s es requerido');
        $this->form_validation->set_message('min_length', 'El %s debe tener al menos %s carácteres');
        $this->form_validation->set_message('max_length', 'El %s debe tener al menos %s carácteres');

        $this->form_validation->set_error_delimiters('', '');
        $profile_id = array_key_exists('profile_id', $profile_credentials) ? $profile_credentials['profile_id'] : null;

        if ($this->form_validation->run()) {
            $dbr_profile        = $this->ProfileDao->existProfileId($profile_id);
            $profile_id         = $dbr_profile ? $dbr_profile->id : null;
            $module_array_ids   = (array_key_exists('modules', $profile_credentials) ? $profile_credentials['modules'] : null);
            $access_permition   = $profile_credentials['access_permition'];
            unset($profile_credentials['modules']);
            unset($profile_credentials['profile_id']);
            $this->ProfileDao->saveProfile($profile_credentials, $profile_id);
            
            if($profile_id>0 && count($module_array_ids)>0) {
                foreach($module_array_ids as $module_id) {
                    $module_profile_access['module_id']     = $module_id;
                    $module_profile_access['profile_id']    = $profile_id;
                    $this->ModuleProfileAccessDao->saveModuleProfileAccess($module_profile_access, $module_id, $profile_id);
                    unset($module_profile_access);
                }
                if($access_permition === 'custom'){
                    $this->ModuleProfileAccessDao->deleteAccessModuleByProfile($profile_id, $module_array_ids);
                } else {
                    $this->ModuleProfileAccessDao->deleteAllAccessByProfile($profile_id);
                }    
            }
            $this->session->set_flashdata('message', 'Se guardo el perfil satisfactorimente');
            redirect('Profile/index');
        }
    }

    private static function getChildrenPermRecursive($a_parent_modules=array(), $a_children_modules=array()) {
        foreach($a_parent_modules as $module_id=>$module) {
            if(array_key_exists($module_id, $a_children_modules)) {
                $a_parent_modules[$module_id]['children'] = $a_children_modules[$module_id];
            }
        }
        return $a_parent_modules;
    }
    
    public function getModalPermission($profile_id=null) {
        $a_permission_filter    = $this->input->post('permission_filter');
        $a_parent_modules       = array();
        $a_children_modules     = array();
        $data['is_new'] = true;
        if (isset($profile_id) && $profile_id) {
            $data['is_new'] = false;
            $dbl_modules    = $this->ModuleDao->getParentModulesWithData($a_permission_filter, $profile_id);
        } else {
            $dbl_modules    = $this->ModuleDao->getParentModules($a_permission_filter);    
        }
        foreach($dbl_modules as $dbr_modules){
            if(!$dbr_modules->parent_id) {
                $a_parent_modules[$dbr_modules->id]['name']         = $dbr_modules->name;
                $a_parent_modules[$dbr_modules->id]['description']  = $dbr_modules->description;
                $a_parent_modules[$dbr_modules->id]['read']         = $profile_id ? $dbr_modules->read : 0;
                $a_parent_modules[$dbr_modules->id]['write']        = $profile_id ? $dbr_modules->write : 0;
                $a_parent_modules[$dbr_modules->id]['download']     = $profile_id ? $dbr_modules->download : 0;
            }
        }
        $dbl_children_modules   =   $this->ModuleDao->getChildModulesWithData($a_permission_filter, $profile_id);
        $index_submodule=0;
        foreach($dbl_children_modules as $dbr_children_modules) {
            $a_children_modules[$dbr_children_modules->parent_id][$index_submodule]['id']           = $dbr_children_modules->id;
            $a_children_modules[$dbr_children_modules->parent_id][$index_submodule]['name']         = $dbr_children_modules->name;
            $a_children_modules[$dbr_children_modules->parent_id][$index_submodule]['description']  = $dbr_children_modules->description;
            $a_children_modules[$dbr_children_modules->parent_id][$index_submodule]['read']         = $dbr_children_modules->read;
            $a_children_modules[$dbr_children_modules->parent_id][$index_submodule]['write']        = $dbr_children_modules->write;
            $a_children_modules[$dbr_children_modules->parent_id][$index_submodule]['download']     = $dbr_children_modules->download;
            $a_children_modules[$dbr_children_modules->parent_id][$index_submodule]['id']           = $dbr_children_modules->id;
            $index_submodule++;
        }
        $a_parent_modules   = self::getChildrenPermRecursive($a_parent_modules, $a_children_modules);
        $data['a_permission_modules']   = $a_parent_modules;
        $data['profile_id']              = $profile_id;
        
        //$this->layout->assets(base_url() . 'assets/js/happy/profile.modal.js');
        $this->load->view('Profile/modalPermission',$data);
    }
    
    public function saveModalPermission() {
        $response_method = array();
        try {    
            $profile_credentials        = array();
            $read_access_value = $write_access_value = $download_access_value = 0;
            $profile_id                 = $this->input->post('profile_id');
            $a_module_id                = $this->input->post('a_module_id') ? $this->input->post('a_module_id') : array();
            $read_access                = $this->input->post('read') ? $this->input->post('read') : array();
            $write_access               = $this->input->post('write') ? $this->input->post('write') : array();
            $download_access            = $this->input->post('download') ? $this->input->post('download') : array();

            $a_sub_module_id            = $this->input->post('a_sub_module_id') ? $this->input->post('a_sub_module_id') : array();
            $read_access_children       = $this->input->post('read_children') ? $this->input->post('read_children') : array();
            $write_access_children      = $this->input->post('write_children') ? $this->input->post('write_children'): array();
            $download_access_children   = $this->input->post('download_children') ? $this->input->post('download_children') : array();

            $a_module_id        = $this->ModuleDao->returnExistsModuleIds($a_module_id);
            $dbr_profile        = $this->ProfileDao->existProfileId($profile_id);
            $profile_id         = $dbr_profile->id;

            if(count($a_module_id)==0) {
                return false;
            }
            foreach($a_module_id as $a_module) {
                $module_id              = $a_module['id'];
                $read_access_value      = array_key_exists($module_id, $read_access) ? $read_access[$module_id] : 0;
                $write_access_value     = array_key_exists($module_id, $write_access) ? $write_access[$module_id] : 0;
                $download_access_value  = array_key_exists($module_id, $download_access) ? $download_access[$module_id] : 0;

                $profile_credentials['module_id']   = $module_id;
                $profile_credentials['profile_id']  = $profile_id;
                $profile_credentials['read']        = $read_access_value;
                $profile_credentials['write']       = $write_access_value;
                $profile_credentials['download']    = $download_access_value;
                $this->ModuleProfileAccessDao->saveModuleProfileAccess($profile_credentials, $module_id, $profile_id);
                unset($profile_credentials);

                if(count($a_sub_module_id)==0){
                    continue;
                }
                foreach($a_sub_module_id[$module_id] as $sub_module_id) {
                    $read_access_value     = (array_key_exists($module_id, $read_access_children) && array_key_exists($sub_module_id, $read_access_children[$module_id]) ? $read_access_children[$module_id][$sub_module_id] : 0);
                    $write_access_value    = (array_key_exists($module_id, $write_access_children) && array_key_exists($sub_module_id, $write_access_children[$module_id]) ? $write_access_children[$module_id][$sub_module_id] : 0);
                    $download_access_value = (array_key_exists($module_id, $download_access_children) && array_key_exists($sub_module_id, $download_access_children[$module_id]) ? $download_access_children[$module_id][$sub_module_id] : 0);

                    $profile_credentials['module_id']   = $sub_module_id;
                    $profile_credentials['profile_id']  = $profile_id;
                    $profile_credentials['read']        = $read_access_value;
                    $profile_credentials['write']       = $write_access_value;
                    $profile_credentials['download']    = $download_access_value;
                    $this->ModuleProfileAccessDao->saveModuleProfileAccess($profile_credentials, $sub_module_id, $profile_id);
                    unset($profile_credentials);
                    unset($a_sub_module_id[$sub_module_id]);
                }
            }
        } catch (Exception $e) {
            $response_method['success'] = 0;
            $response_method['message'] = $e->getMessage();
        }     
    }

    public function deleteProfile($profile_id) {
        $dbr_profile = $this->ProfileDao->existProfileId($profile_id);
        $message  = '';
        if($dbr_profile){
            $this->ProfileDao->deleteProfile($profile_id);
            $message = 'Se elimino el perfil <strong>' . $dbr_profile->name . '</strong>';
        } else {
            $message = 'No se encontró el perfil ' . $profile_id;
        }
        $this->session->set_flashdata('message', $message);
        redirect('Profile/index');
    }

    public function exportExcel() {
        // Load libreria
        $this->load->library('PHPExcel');
        // Propiedades del archivo excel
        $this->phpexcel->getProperties()
                ->setTitle("Esto es una prueba")
                ->setDescription("Descripcion del excel bla bla blaaa");
        // Setiar la solapa que queda actia al abrir el excel
        $this->phpexcel->setActiveSheetIndex(0);
        // Solapa excel para trabajar con PHP
        $sheet = $this->phpexcel->getActiveSheet();
        $sheet->setTitle("Titulo Demo Pestaña");
        $sheet->getColumnDimension('A')->setWidth(20);
        $sheet->setCellValue('A1', 'Nombre');
        $sheet->setCellValue('B1', 'Apellido');
        $sheet->setCellValue('C1', 'Edad');
        $sheet->setCellValue('A2', 'Pepe Luis');
        $sheet->setCellValue('B2', 'Golido');
        $sheet->setCellValue('C2', '23');
        $sheet->setCellValue('A2', 'Pepemez');
        $sheet->setCellValue('A3', 'Alejandro');
        $sheet->setCellValue('B3', 'Mandre');
        $sheet->setCellValue('C3', '31');
        // Salida
        header("Content-Type: application/vnd.ms-excel");
        $nombreArchivo = 'export_lisatdo_' . date('YmdHis');
        header("Content-Disposition: attachment; filename=\"$nombreArchivo.xls\"");
        header("Cache-Control: max-age=0");
        // Genera Excel
        $writer = PHPExcel_IOFactory::createWriter($this->phpexcel, "Excel5");
        // Escribir
        $writer->save('php://output');
        exit;
    }
}
