<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Login extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->database();
        $this->load->model('LoginDao');
        $this->load->library(array('form_validation', 'session'));
        $this->load->helper(array('form', 'url'));
        $this->layout->isLogin = true;
        $this->layout->title = "Admin Happyland - Login";
    }

    public function index() {

        $this->load->helper('url');
        $data['token'] = $this->token();
        $this->layout->view('Login/authentication', $data);
    }

    public function authentication() {
        $user_credentials = $this->input->post('formLogin');

        if ($user_credentials['token'] && $user_credentials['token'] == $this->session->userdata('token')) {

            $this->form_validation->set_rules('formLogin[dni]', 'DNI', 'required|trim|min_length[8]|max_length[8]|xss_clean');
            $this->form_validation->set_rules('formLogin[password]', 'Contraseña', 'required|trim|min_length[6]|max_length[150]|xss_clean');

            //lanzamos mensajes de error si es que los hay
            $this->form_validation->set_message('required', 'El %s es requerido');
            $this->form_validation->set_message('min_length', 'El %s debe tener al menos %s carácteres');
            $this->form_validation->set_message('max_length', 'El %s debe tener al menos %s carácteres');

            $this->form_validation->set_error_delimiters('<span class="has-error">', '</span>');

            if ($this->form_validation->run() == FALSE) {
                $this->index();
            } else {

                $username = $user_credentials['dni'];
                $password = md5($user_credentials['password']);

                $dbr_user = $this->LoginDao->loginUser($username);

                if (!$dbr_user) {
                    $this->session->set_flashdata('message', 'DNI Invalido');
                    redirect('Login/index');
                }

                if ($password == $dbr_user->password) {
                    redirect('profile_controller/index');
                } else {
                    $this->session->set_flashdata('message', 'Contraseña Invalido');
                    redirect('Login/index');
                }

            }
        } else {
            $this->session->set_flashdata('message', 'Token Invalido');
            redirect('Login/index');
        }
    }

    private function token() {
        $token = md5(uniqid(rand(), true));
        $this->session->set_userdata('token', $token);
        return $token;
    }

}
