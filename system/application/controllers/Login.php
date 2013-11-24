<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Login extends CI_Controller {

    private $login;

    public function __construct() {
        parent::__construct();
        $this->load->database();
        $this->load->library(array('form_validation', 'session'));
        $this->load->helper(array('form', 'url'));
        $this->load->model('LoginDao', 'LoginDao');
        $this->load->model('ModuleProfileAccessDao');
        $this->layout->isLogin = true;
        $this->layout->title = "Admin Happyland - Login";
    }

    public function index($is_login = true) {
        $this->layout->assets(base_url() . 'assets/js/user/login.js');
        $data['token'] = $this->token();
        $data['is_login'] = $is_login;
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
                $password = sha1($user_credentials['password']);
                $dbr_user = $this->LoginDao->loginUser($username);

                if (!$dbr_user) {
                    $this->session->set_flashdata('message', 'Usuario no registrado');
                    redirect('Login/index');
                }
                if ($password == $dbr_user->password) {
                    $this->login = $dbr_user;
                    $this->set_session();
                    if($dbr_user->is_first_session == 1){
                      redirect('User/changePassword');  
                    }
                    redirect('Dashboard/index');
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

    public function verifyUser() {
        $user_dni = $this->input->post('user_dni');
        $this->load->model('LoginDao');
        $dbr_user = $this->LoginDao->loginUser($user_dni);

        $response['success'] = 0;
        if ($dbr_user) {
            if (!$dbr_user->secret_question) {
                $response['success'] = 0;
                $response['message'] = 'No Tiene Registrado ninguna Pregunta secreta';
            } else {
                $response['success'] = 1;
                $response['secret_question'] = $dbr_user->secret_question;
            }
        } else {
            $response['message'] = 'DNI no se encuentra registrado';
        }

        echo json_encode($response);
    }

    public function recovering() {
        $user_credentials = $this->input->post('form_recover');

        $this->form_validation->set_rules('form_recover[dni]', 'DNI', 'required|trim|min_length[8]|max_length[8]|xss_clean');
        $this->form_validation->set_rules('form_recover[new_password]', 'Contraseña', 'required|trim|min_length[6]|max_length[150]|xss_clean');
        $this->form_validation->set_rules('form_recover[repeat_new_password]', 'Repetir Contraseña', 'required|trim|min_length[6]|max_length[150]|xss_clean');
        $this->form_validation->set_rules('form_recover[secret_answer]', 'Respuesta Secreta', 'required|trim|xss_clean');

        //lanzamos mensajes de error si es que los hay
        $this->form_validation->set_message('required', 'El %s es requerido');
        $this->form_validation->set_message('min_length', 'El %s debe tener al menos %s carácteres');
        $this->form_validation->set_message('max_length', 'El %s debe tener al menos %s carácteres');
        $this->form_validation->set_error_delimiters('<span class="has-error">', '</span>');

        if ($this->form_validation->run() == FALSE) {
            $this->index(false);
        } else {
            $username = $user_credentials['dni'];
            $new_password = sha1($user_credentials['new_password']);
            $repeat_new_password = sha1($user_credentials['repeat_new_password']);
            $secret_answer = $user_credentials['secret_answer'];
            
            $dbr_user = $this->LoginDao->loginUser($username);

            if (!$dbr_user) {
                $this->session->set_flashdata('message_recovering', 'Usuario no registrado');
                redirect('Login/index');
            }

            if (!$dbr_user->secret_question) {
                $this->session->set_flashdata('message_recovering', 'No tiene registrado ninguna pregunta secreta');
                redirect('Login/index');
            }
            
            if ($secret_answer != $dbr_user->secret_answer) {
                $this->session->set_flashdata('message_recovering', 'La respuesta secreta es incorrecta');
                redirect('Login/index');
            }

            if ($new_password != $repeat_new_password) {
                $this->session->set_flashdata('message_recovering', 'Las contraseñas no coinciden');
                redirect('Login/index');
            }

            $this->load->model('UserDao');
            $data['password'] = $new_password;
            $this->UserDao->saveUser($data, $dbr_user->id);
            $this->session->set_flashdata('message_success', 'Se actualizo su contraseña satisfactoriamente');
            redirect('Login/index');
        }
    }

    private function set_session() {
        $a_module_permission = $this->ModuleProfileAccessDao->getModulesByProfile($this->login->profile_id);
        $this->session->set_userdata('loggedin', array(
            'id' => $this->login->id,
            'subsidiaries' => $this->login->subsidiaries_id,
            'profile_id' => $this->login->profile_id,
            'num_doc' => $this->login->num_doc,
            'name' => $this->login->full_name,
            'isLoggedIn' => true,
            'menu_permission' => $this->encrypt->encode(json_encode($a_module_permission['menu_permission'])),
            'module_permission' => $this->encrypt->encode(json_encode($a_module_permission['module_permission']))
                )
        );
    }

    private function token() {
        $token = md5(uniqid(rand(), true));
        $this->session->set_userdata('token', $token);
        return $token;
    }

    public function logout() {
        $this->session->unset_userdata('loggedin');
        $this->session->sess_destroy();
        redirect('Login/index', 'refresh');
    }

}
