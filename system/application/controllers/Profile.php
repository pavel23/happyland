<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Profile extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->database();
        $this->load->model('ProfileDao');
        $this->load->model('StatusDao');
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

    public function maintenanceProfile($profileid = null) {
        
        $data['dbr_profile'] = array();
        $data['is_new'] = true;
        if (isset($profileid) && $profileid) {
            $data['dbr_profile'] = $this->ProfileDao->getProfileById($profileid);
            $data['is_new'] = false;
        }
        $this->load->model('ModuleDao');
        $dbl_modules    = $this->ModuleDao->getParentModules();
        $a_modules      = array();
        foreach($dbl_modules as $dbr_module) {
            $a_modules[$dbr_module->id] = $dbr_module->name;
        }
        $data['a_modules']   = $a_modules;
        $data['a_status']   = $this->StatusDao->getProfileStatus();

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
            $dbr_profile = $this->ProfileDao->getProfileById($profile_id);
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
