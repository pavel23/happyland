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

    public function profile_maintenance($profileid = null) {
        
        $data['dbr_profile'] = array();
        $data['is_new'] = true;
        if (isset($profileid) && $profileid) {
            $data['dbr_profile'] = $this->ProfileDao->getProfileById($profileid);
            $data['is_new'] = false;
        }
        $data['a_status'] = $this->StatusDao->getProfileStatus();
        $this->layout->assets(base_url() . 'assets/css/lib/chosen.min.css');
        $this->layout->view('Profile/maintenanceProfile', $data);
         
    }

    public function profile_delete($params = array()) {
        //$this->load->helper('url');
        redirect('', 'refresh');
    }

    public function export_excel() {
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
