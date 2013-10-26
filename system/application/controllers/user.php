<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class User extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->layout->isLogin = true;
    }

    public function index() {
        
        $this->load->helper('url');
         $this->layout->view('user/login');
        /* if( $this->session->userdata('isLoggedIn') ) {
          redirect('/main/show_main');
          } else {
          $this->show_login(false);
          } */
    }

}
