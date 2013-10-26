<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Login extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->helper(array('form', 'url'));
        $this->layout->isLogin = true;        
        $this->layout->title = "Admin Happyland - Login";
    }

    public function index() {

        $this->load->helper('url');
        $this->layout->view('Login/authentication');
        /* if( $this->session->userdata('isLoggedIn') ) {
          redirect('/main/show_main');
          } else {
          $this->show_login(false);
          } */
    }

}
