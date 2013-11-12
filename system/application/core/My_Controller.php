<?php


/**
 * Description of My_Controller
 *
 * @author Pavel
 */
class My_Controller extends CI_Controller {

    function __construct() {
        parent::__construct();

        $this->load->helper(array('form', 'url'));
        $this->load->library('session');

        if (!$this->session->userdata('loggedin')) {
            redirect('Login/index');
        }
    }

}

?>
