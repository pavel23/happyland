<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Profile extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->database();
        $this->load->model('ProfileDao');
        $this->load->model('ModuleDao');
        $this->load->library(array('form_validation', 'session'));
        $this->load->helper(array('form', 'url'));
        $this->layout->isLogin = false;
        $this->layout->title = "Admin Happyland - Perfiles";
    }
    
    public function index() {
        try {
            //$this->load->helper('url');
            $data['profile_data'] = $this->ProfileDao->getAllProfiles();
            $this->layout->view('Profile/listProfile', $data);
            
        } catch (Exception $e) {
            echo $e;
        }
    }

    public function maintenanceProfile($profile_id = null) {
        $data['dbr_profile'] = array();
        $data['is_new'] = true;
        if (isset($profile_id) && $profile_id) {
            $data['dbr_profile'] = $this->ProfileDao->getProfileById($profile_id);
            $data['is_new'] = false;
        }
        $dbl_modules    = $this->ModuleDao->getParentModules();
        $a_parent_modules      = array();
        foreach($dbl_modules as $dbr_module) {
            $a_parent_modules[$dbr_module->id] = $dbr_module->name;
        }
        $data['a_parent_modules']   = $a_parent_modules;
        $data['a_status']           = Status::getProfileStatus();

        if ($this->input->post()) {
            $this->saveProfile();
        }
        
        $this->layout->assets(base_url() . 'assets/css/lib/chosen.css');
        $this->layout->assets(base_url() . 'assets/js/lib/chosen.jquery.js');
        $this->layout->assets(base_url() . 'assets/js/happy/profile.js');
        $this->layout->assets(base_url() . 'assets/js/lib/bootbox.min.js');
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
            $dbr_profile = $this->ProfileDao->existProfileId($profile_id);
            $profile_credentials = $this->input->post('formprofile');
            $profile_credentials['name'] = $profile_credentials['name'];
            $profile_credentials['description'] = $profile_credentials['description'] ? trim($profile_credentials['description']) : null;
            $profile_credentials['access_permition'] = $profile_credentials['access_permition'];
            $profile_credentials['status'] = $profile_credentials['status'];
            unset($profile_credentials['modules']);
            unset($profile_credentials['profile_id']);

            $this->ProfileDao->saveProfile($profile_credentials, ($dbr_profile ? $dbr_profile->id : null));
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
    
    public function getModalPermission($profile_id) {
        $data['is_new'] = true;
        if (isset($profile_id) && $profile_id) {
            $data['is_new'] = false;
        }

        $a_permission_filter    = $this->input->post('permission_filter');
        $dbl_modules            = $this->ModuleDao->getParentModules($a_permission_filter);
        $a_parent_modules       = array();
        $a_children_modules     = array();
        foreach($dbl_modules as $dbr_modules){
            if(!$dbr_modules->parent_id) {
                $a_parent_modules[$dbr_modules->id]['name'] = $dbr_modules->name;
            }
        }
        $dbl_children_modules   =   $this->ModuleDao->getChildModules($a_permission_filter);
        foreach($dbl_children_modules as $dbr_children_modules) {
            $a_children_modules[$dbr_children_modules->parent_id][] = array('id' => $dbr_children_modules->id, 'name' => $dbr_children_modules->name);
        }

        $a_parent_modules   = self::getChildrenPermRecursive($a_parent_modules, $a_children_modules);
        $data['a_permission_modules']   = $a_parent_modules;
        $data['profile_id']              = $profile_id;
        $this->load->view('Profile/modalPermission',$data);
    }
    
    public function saveModalPermission() {
        $this->load->model('ModuleProfileAccessDao');
        $a_module_id                = $this->input->post('a_module_id') ? $this->input->post('a_module_id') : array();
        $download_access            = $this->input->post('download') ? $this->input->post('download') : array();
        $total_access               = $this->input->post('total') ? $this->input->post('total') : array();
        $read_access                = $this->input->post('read') ? $this->input->post('read') : array();
        $write_access               = $this->input->post('write') ? $this->input->post('write') : array();
        
        $download_access_children   = $this->input->post('download_children') ? $this->input->post('download_children') : array();
        $total_access_children      = $this->input->post('total_children') ? $this->input->post('total_children') : array();
        $read_access_children       = $this->input->post('read_children') ? $this->input->post('read_children') : array();
        $write_access_children      = $this->input->post('write_children') ? $this->input->post('write_children'): array();

        $profile_id                 = $this->input->post('profile_id');
        $dbr_profile                = $this->ProfileDao->existProfileId($profile_id);
        $a_module_id                = $this->ModuleDao->returnExistsModuleIds($a_module_id);

        if(count($a_module_id)==0) {
            return false;
        }
        foreach($a_module_id as $a_module) {
            $module_id                  = $a_module['id'];
            $read_access_value          = array_key_exists($module_id, $read_access) ? $read_access[$module_id] : 0;
            $write_access_value         = array_key_exists($module_id, $write_access) ? $write_access[$module_id] : 0;
            $download_access_value      = array_key_exists($module_id, $download_access) ? $download_access[$module_id] : 0;
            $total_access_value         = array_key_exists($module_id, $total_access) ? $total_access[$module_id] : 0;

            $read_access_children_value      = array_key_exists($module_id, $read_access_children) ? $read_access_children[$module_id] : 0;
            $write_access_children_value     = array_key_exists($module_id, $write_access_children) ? $write_access_children[$module_id] : 0;
            $download_access_children_value  = array_key_exists($module_id, $download_access_children) ? $download_access_children[$module_id] : 0;
            $total_access_children_value     = array_key_exists($module_id, $total_access_children) ? $total_access_children[$module_id] : 0;

            $profile_credentials['module_id']       = $module_id;
            $profile_credentials['profile_id']      = $dbr_profile->id;
            $profile_credentials['read']            = $read_access_value;
            $profile_credentials['write']           = $write_access_value;
            $profile_credentials['download']        = $download_access_value;
            $profile_credentials['total_access']    = $total_access_value;
            $this->ModuleProfileAccessDao->saveModuleProfileAccess($profile_credentials, $module_id, $dbr_profile->id);
            unset($profile_credentials);
            
            if(count($write_access_children_value)>0){
                foreach($write_access_children_value as $write_access_children_val) {
                    echo $write_access_children_val;
                }
            }
            if(count($read_access_children_value)>0){
                foreach($read_access_children_value as $read_access_children_val) {
                    echo $read_access_children_val;
                }
            }
            if(count($download_access_children_value)>0){
                foreach($download_access_children_value as $download_access_children_val) {
                    echo $download_access_children_val;
                }
            }
            if(count($download_access_children_value)>0){
                foreach($download_access_children_value as $download_access_children_val) {
                    echo $download_access_children_val;
                }
            }
            /*
            
            */
        }
        /*
        $this->session->set_flashdata('message', 'Se guardo el perfil satisfactorimente');
        redirect('Profile/index');
        */        
    }

    public function deleteProfile($params = array()) {
        //$this->load->helper('url');
        redirect('', 'refresh');
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
