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

        $data['dbr_user'] = array();
        $data['is_new'] = true;
        if (isset($userid) && $userid) {
            $data['dbr_user'] = $this->UserDao->getUserById($userid);
            $data['is_new'] = false;
        }

        $this->layout->view('User/maintenanceUser', $data);
    }

}

?>
