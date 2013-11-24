<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * Description of User
 *
 * @author Pavel
 */
class User extends ValidateAccess {

    public function __construct() {
        parent::__construct();
        $this->load->database();
        $this->load->model('UserDao');
        $this->load->library(array('form_validation', 'session', 'pagination'));
        $this->load->helper(array('form', 'url'));
        $this->layout->isLogin = false;
        $this->layout->title = "Admin Happyland - Usuarios";
    }

    public function index() {
        try {
            $this->validateAccessByModule();
            $this->layout->assets(base_url() . 'assets/js/lib/jquery.dataTables.js');
            $this->layout->assets(base_url() . 'assets/js/happy/pipeline_table.js');
            $this->layout->assets(base_url() . 'assets/js/happy/load.table.list.js');
            $this->layout->assets(base_url() . 'assets/js/happy/user.list.js');
            $this->layout->assets(base_url() . 'assets/css/data-table.css');
            $this->layout->view('User/userList');
        } catch (Exception $e) {
            echo $e;
        }
    }

    public function getDataTableList() {
        $dbl_user = $this->UserDao->getAllUsers();
        $a_user_list = array();
        foreach ($dbl_user as $dbr_user) {
            $a_user_list["aaData"][] = array(
                $dbr_user->id,
                $dbr_user->num_doc,
                $dbr_user->full_name,
                $dbr_user->subsidiarie_name,
                $dbr_user->profile_name,
                Status::getHTMLStatus($dbr_user->status),
                anchor(site_url('User/maintenanceUser/' . $dbr_user->id), '<i class="icon-edit icon-white"></i><span><strong>Editar</strong></span>', array('class' => 'btn btn-primary btn-xs'))
                . ' ' .
                anchor(site_url('User/deleteUser/' . $dbr_user->id), '<i class="icon-trash icon-white"></i><span><strong>Eliminar</strong></span>', array('class' => 'btn btn-primary btn-xs'))
            );
        }
        header("Content-type: application/json");
        echo json_encode($a_user_list);
    }

    public function maintenanceUser($userid = null) {
        $this->validateAccessByModule();
        $this->load->model('ProfileDao');
        $this->load->model('SubsidiaryDao');
        //$this->layout->assets(base_url() . 'assets/css/lib/validationEngine.jquery.css');
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
        $data['a_status'] = Status::getProfileStatus();
        $data['dbr_profiles'] = $a_profiles;
        $data['dbr_subsidiaries'] = $a_subsidiaries;

        if ($this->input->post()) {
            $this->saveUser();
        }

        $this->layout->view('User/maintenanceUser', $data);
    }

    private function saveUser() {
        $user_credentials = $this->input->post('formuser');
        $user_id = array_key_exists('user_id', $user_credentials) ? $user_credentials['user_id'] : null;
        $this->form_validation->set_rules('formuser[num_doc]', 'DNI', 'required|trim|min_length[8]|max_length[8]|xss_clean');
        $this->form_validation->set_rules('formuser[last_name]', 'Apell. Paterno', 'required|trim|min_length[3]|xss_clean');
        $this->form_validation->set_rules('formuser[second_last_name]', 'Apell. Materno', 'required|trim|min_length[3]|xss_clean');
        $this->form_validation->set_rules('formuser[first_name]', 'Nombres', 'required|trim|min_length[3]|xss_clean');

        //|matches[formuser[formuser_password_confirm]]
        if ($user_id) {
            $this->form_validation->set_rules('formuser[password]', 'Contraseña', 'trim');
            $this->form_validation->set_rules('formuser_password_confirm', 'Confirmar Contraseña', 'trim');
        } else {
            $this->form_validation->set_rules('formuser[password]', 'Contraseña', 'required|trim');
            $this->form_validation->set_rules('formuser_password_confirm', 'Confirmar Contraseña', 'required|trim');
        }

        if ($user_credentials['opt_perfil'] == 'F') {
            $this->form_validation->set_rules('formuser[start_date]', 'Fecha Desde', 'required|trim|min_length[10]|xss_clean');
            $this->form_validation->set_rules('formuser[expiration_date]', 'Fecha Hasta', 'required|trim|min_length[10]|xss_clean');
        }
        $this->form_validation->set_message('required', 'El %s es requerido');
        $this->form_validation->set_message('min_length', 'El %s debe tener al menos %s carácteres');
        $this->form_validation->set_message('max_length', 'El %s debe tener al menos %s carácteres');
        $this->form_validation->set_message('matches', 'Las contraseñas no coinciden');
        //$this->form_validation->set_error_delimiters('', '');
        $this->form_validation->set_error_delimiters('<span class="has-error">', '</span>');

        if ($this->form_validation->run()) {
            $dbr_user = $this->UserDao->getUserById($user_id);
            $user_credentials = $this->input->post('formuser');
            $user_credentials['full_name'] = implode(' ', array($user_credentials['first_name'], $user_credentials['last_name'], $user_credentials['second_last_name']));
            $user_credentials['start_date'] = $user_credentials['opt_perfil'] == 'F' ? Utils::cambiaf_a_mysql($user_credentials['start_date']) : null;
            $user_credentials['expiration_date'] = $user_credentials['opt_perfil'] == 'F' ? Utils::cambiaf_a_mysql($user_credentials['expiration_date']) : null;
            if (!$user_credentials['password']) {
                unset($user_credentials['password']);
            } else {
                $user_credentials['password'] = sha1($user_credentials['password']);
            }

            if (!$dbr_user) {
                $user_credentials['is_first_session'] = 1;
            }

            unset($user_credentials['opt_perfil']);
            unset($user_credentials['user_id']);
            unset($user_credentials['password_confirm']);

            $this->UserDao->saveUser($user_credentials, $dbr_user ? $dbr_user->id : null);
            $this->session->set_flashdata('message', 'Se guardo el usuario satisfactorimente');
            redirect('User/index');
        }
    }

    public function deleteUser($userid) {
        $dbr_user = $this->UserDao->getUserById($userid);
        $message = '';
        if ($dbr_user) {
            $this->UserDao->deleteUser($userid);
            $message = 'Se elimino el usuario <strong>' . $dbr_user->full_name . '</strong>';
        } else {
            $message = 'No se encontró el usuario ' . $userid;
        }
        $this->session->set_flashdata('message', $message);
        redirect('User/index');
    }

    public function changePassword() {
        $users_data = $this->session->userdata('loggedin');
        $dbr_user = $this->UserDao->getUserById($users_data['id']);

        if ($dbr_user->is_first_session == 0) {
            redirect('Dashboard/index');
        }

        if ($this->input->post()) {
            $this->generateNewPassword();
        }

        $this->layout->view('User/changePassword');
    }

    public function generateNewPassword() {
        $user_credentials = $this->input->post('formuser');
        $this->form_validation->set_rules('formuser[current_password]', 'Contraseña Actual', 'required|trim|min_length[6]|max_length[150]|xss_clean');
        $this->form_validation->set_rules('formuser[new_password]', 'Nueva Contraseña', 'required|trim|min_length[6]|max_length[150]|xss_clean');
        $this->form_validation->set_rules('formuser[repeat_new_password]', 'Repetir Nueva Contraseña', 'required|trim|min_length[6]|max_length[150]|xss_clean');
        $this->form_validation->set_rules('formuser[secret_question]', 'Pregunta Secreta', 'required|trim|min_length[5]|xss_clean');
        $this->form_validation->set_rules('formuser[secret_answer]', 'Respuesta Secreta', 'required|trim|min_length[3]|xss_clean');

        $this->form_validation->set_message('required', 'El %s es requerido');
        $this->form_validation->set_message('min_length', 'El %s debe tener al menos %s carácteres');
        $this->form_validation->set_message('max_length', 'El %s debe tener al menos %s carácteres');
        $this->form_validation->set_error_delimiters('<span class="has-error">', '</span>');

        if ($this->form_validation->run()) {
            $users_data = $this->session->userdata('loggedin');
            $current_password = sha1($user_credentials['current_password']);
            $new_password = sha1($user_credentials['new_password']);
            $repeat_new_password = sha1($user_credentials['repeat_new_password']);

            $dbr_user = $this->UserDao->getUserById($users_data['id']);

            if ($dbr_user->password != $current_password) {
                $this->session->set_flashdata('message', 'Contraseña es incorrecta');
                redirect('User/changePassword', 'refresh');
                return false;
            }

            if ($new_password != $repeat_new_password) {
                $this->session->set_flashdata('message', 'Las Contraseñas son distintas');
                redirect('User/changePassword', 'refresh');
                return false;
            }

            $data['password'] = $new_password;
            $data['secret_question'] = $user_credentials['secret_question'];
            $data['secret_answer'] = $user_credentials['secret_answer'];
            $data['is_first_session'] = 0;

            $this->UserDao->saveUser($data, $users_data['id']);
            $this->session->set_flashdata('message', 'Se guardo el usuario satisfactorimente');
            redirect('Dashboard/index');
        }
    }

}

?>
