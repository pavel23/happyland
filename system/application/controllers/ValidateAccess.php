<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class ValidateAccess extends My_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->database();
        $this->layout->isLogin = false;
        $this->layout->title = "Admin Happyland - Perfiles";
    }
    
    public function validateAccessByModule() {
    try {
        $a_session              = $this->session->userdata('loggedin');
        $a_module_permission    = json_decode($this->encrypt->decode($a_session['module_permission']));
        $controller_name        = $this->router->fetch_class();
        $method_name            = $this->router->fetch_method();

        if(array_key_exists($controller_name, $a_module_permission)) {
            //throw new Exception('Acceso a Controller ' . $controller_name . ' permitido<br />');
            if(array_key_exists($method_name, $a_module_permission->$controller_name)) {
                $method_permission = $a_module_permission->$controller_name->$method_name;
                if(($method_permission->read + $method_permission->write + $method_permission->download) == 0) {
                    throw new Exception('Acceso a Metodo ' . $method_name . ' denegado');
                } else{
                    //throw new Exception('Acceso a Metodo ' . $method_name . ' permitido<br /> '. print_r($a_module_permission->$controller_name->$method_name));
                }
                
            } else {
                throw new Exception('Acceso a Metodo ' . $method_name . ' denegado');
            }

        } else {
            throw new Exception('Acceso a Controller ' . $controller_name . ' denegado');
        }
    } catch(Exception $e) {
            die($e->getMessage());
    }
  }
}
