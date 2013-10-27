<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * Description of diary_sales_controller
 *
 * @author jroque
 */
class Daily_sales_controller extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->layout->isLogin = false;
        $this->load->helper('url');
    }

    public function index() {
        try {

            $this->load->database();
            $this->load->model('Profile_dao', 'ProfileDAO');
            $data['profile_data'] = $this->ProfileDAO->get_all_profiles();
            $this->load->view('common/header');
            $this->load->view('daily_sales/list_template', $data);
            $this->load->view('common/footer');
        } catch (Exception $e) {
            echo $e;
        }
    }

    public function maintenanceForm() {
        $this->layout->assets(base_url() . 'assets/css/dist/jquery.handsontable.full.css', 'footer');
        $this->layout->assets(base_url() . 'assets/js/dist/jquery.handsontable.full.js', 'footer');
        $this->layout->assets(base_url() . 'assets/js/happy/daily.sales.js', 'footer');
        $this->layout->view('daily_sales/maintenance_template');
    }

    public function processForm() {
        try {
            /* foreach($this->input->post() as $row_daily_sales) {
              $row_daily_sales[0]
              } */

            echo '<pre>';
            print_r($this->input->post()); //'data', TRUE));
            print_r($this->input->request_headers());
            echo '</pre>';
        } catch (Exception $e) {
            echo $e;
        }
    }

    public function getJSONOperators() {
        try {
            $this->load->database();
            $this->load->model('User_dao', 'UserDAO');
            $data['opeartor_data'] = $this->UserDAO->get_operator_users();
            $array_operator = array();
            foreach ($data['opeartor_data'] as $operator) {
                $full_name = trim($operator['full_name']);
                if (strlen($full_name) == 0) {
                    continue;
                }
                $this->UserDAO->get_user_id_by_name($full_name);
                $array_operator[]   = $operator['full_name'];
            }
            header("Content-type: application/json");
            echo json_encode($array_operator);
        } catch (Exception $e) {
            echo $e;
        }
    }

}
