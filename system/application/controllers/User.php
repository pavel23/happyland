<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * Description of User
 *
 * @author Pavel
 */
class User extends My_Controller {

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

        $this->load->model('ProfileDao');
        $this->load->model('SubsidiaryDao');        
        $this->layout->assets(base_url() . 'assets/css/lib/datepicker.css');
        $this->layout->assets(base_url() . 'assets/js/lib/bootstrap-datepicker.js');
        $this->layout->assets(base_url() . 'assets/js/lib/bootstrap-datepicker.es.js');
        $this->layout->assets(base_url() . 'assets/js/user/maintenanceUser.js');
        
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

        if ($this->input->post()) {
            $this->saveUser();
        }

        $this->layout->view('User/maintenanceUser', $data);
    }

    private function SaveUser() {
        $user_credentials = $this->input->post('formuser');
        $this->form_validation->set_rules('formuser[num_doc]', 'DNI', 'required|trim|min_length[8]|max_length[8]|xss_clean');
        $this->form_validation->set_rules('formuser[last_name]', 'Apell. Paterno', 'required|trim|min_length[3]|xss_clean');
        $this->form_validation->set_rules('formuser[second_last_name]', 'Apell. Materno', 'required|trim|min_length[3]|xss_clean');
        $this->form_validation->set_rules('formuser[first_name]', 'Nombres', 'required|trim|min_length[3]|xss_clean');
        // $this->form_validation->set_rules('formuser[email]', 'Email', 'valid_email|xss_clean');

        if ($user_credentials['opt_perfil'] == 'F') {
            $this->form_validation->set_rules('formuser[start_date]', 'Fecha Desde', 'required|trim|min_length[10]|xss_clean');
            $this->form_validation->set_rules('formuser[expiration_date]', 'Fecha Hasta', 'required|trim|min_length[10]|xss_clean');
        }

        $this->form_validation->set_message('required', 'El %s es requerido');
        $this->form_validation->set_message('min_length', 'El %s debe tener al menos %s carácteres');
        $this->form_validation->set_message('max_length', 'El %s debe tener al menos %s carácteres');
        //$this->form_validation->set_message('valid_email', 'El %s es incorrecto');
        $this->form_validation->set_error_delimiters('', '');
        $user_id = array_key_exists('user_id', $user_credentials) ? $user_credentials['user_id'] : null;

        if ($this->form_validation->run()) {
            $dbr_user = $this->UserDao->getUserById($user_id);
            $user_credentials = $this->input->post('formuser');
            $user_credentials['full_name'] = implode(' ', array($user_credentials['first_name'], $user_credentials['last_name'], $user_credentials['second_last_name']));
            $user_credentials['start_date'] = $user_credentials['opt_perfil'] == 'F' ? Utils::cambiaf_a_mysql($user_credentials['start_date']) : null;
            $user_credentials['expiration_date'] = $user_credentials['opt_perfil'] == 'F' ? Utils::cambiaf_a_mysql($user_credentials['expiration_date']) : null;
            unset($user_credentials['opt_perfil']);
            unset($user_credentials['user_id']);

            $this->UserDao->saveUser($user_credentials, $dbr_user ? $dbr_user->id : null);
            $this->session->set_flashdata('message', 'Se guardo el usuario satisfactorimente');
            redirect('User/index');
        }
    }

}

?>
