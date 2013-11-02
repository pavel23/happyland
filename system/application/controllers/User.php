<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * Description of User
 *
 * @author Pavel
 */
class User extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->database();
        $this->load->model('UserDao');
        $this->load->library(array('form_validation', 'session'));
        $this->load->helper(array('form', 'url'));
        $this->layout->isLogin = false;
        $this->layout->title = "Admin Happyland - Usuarios";
    }

    public function index() {
        $data['dbr_users'] = $this->UserDao->getAllUsers();
        $this->layout->view('User/userList', $data);
    }

    public function maintenanceUser($userid = null) {

        $this->load->model('profile_dao', 'ProfileDao');
        $this->load->model('SubsidiaryDao');
        $data['dbr_user'] = array();
        $data['is_new'] = true;
        if (isset($userid) && $userid) {
            $data['dbr_user'] = $this->UserDao->getUserById($userid);
            $data['is_new'] = false;
        }

        $dbr_profiles = $this->ProfileDao->getAllProfiles();

        $a_profiles = array();
        foreach ($dbr_profiles as $dbr_profile) {
            $a_profiles[$dbr_profile->id] = $dbr_profile->name;
        }

        $dbr_subsidiaries = $this->SubsidiaryDao->getAllSubsidiaries();

        $a_subsidiaries = array();
        foreach ($dbr_subsidiaries as $dbr_subsidiary) {
            $a_subsidiaries[$dbr_subsidiary->id] = $dbr_subsidiary->name;
        }

        $data['dbr_profiles'] = $a_profiles;
        $data['dbr_subsidiaries'] = $a_subsidiaries;

//        if ($this->input->post()) {
//            $this->UserDao->saveUser();
//        }


        $this->layout->view('User/maintenanceUser', $data);
    }

    public function SaveUser() {

        $user_credentials = $this->input->post('formuser');
        $this->form_validation->set_rules('formuser[dni]', 'DNI', 'required|trim|min_length[8]|max_length[8]|xss_clean');
        $this->form_validation->set_rules('formuser[last_name]', 'Apell. Paterno', 'required|trim|min_length[3]|xss_clean');
        $this->form_validation->set_rules('formuser[second_last_name]', 'Apell. Materno', 'required|trim|min_length[3]|xss_clean');
        $this->form_validation->set_rules('formuser[first_name]', 'Nombres', 'required|trim|min_length[3]|xss_clean');
        $this->form_validation->set_rules('formuser[email]', 'Email', 'trim|valid_email|xss_clean');

        if ($user_credentials['opt_perfil'] == 'F') {
            $this->form_validation->set_rules('formuser[start_date]', 'Fecha Desde', 'required|trim|min_length[10]|xss_clean');
            $this->form_validation->set_rules('formuser[finish_date]', 'Fecha Hasta', 'required|trim|min_length[10]|xss_clean');
        }

        $this->form_validation->set_message('required', 'El %s es requerido');
        $this->form_validation->set_message('min_length', 'El %s debe tener al menos %s carácteres');
        $this->form_validation->set_message('max_length', 'El %s debe tener al menos %s carácteres');
        $this->form_validation->set_message('valid_email', 'El %s es incorrecto');
        $user_id = array_key_exists('user_id', $user_credentials) ? $user_credentials['user_id'] : null;

        if ($this->form_validation->run() == FALSE) {
            $this->form_validation->set_error_delimiters('', '');
            $this->maintenanceUser($user_id);           
        }else{
             $dbr_user = $this->UserDao->getUserById($userid);
        }
    }

}

?>
