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
        $this->load->database();
        $this->load->model('Profile_dao', 'ProfileDAO');
        $data['profile_data'] = $this->ProfileDAO->getAllProfiles();
        $this->layout->assets(base_url() . 'assets/css/daily_sales.css');
        $this->layout->view('daily_sales/list_template', $data);
    }

    public function maintenanceForm() {
        $this->layout->assets(base_url() . 'assets/css/dist/jquery.handsontable.full.css');
        $this->layout->assets(base_url() . 'assets/js/dist/jquery.handsontable.full.js');
        $this->layout->assets(base_url() . 'assets/js/happy/daily.sales.js', 'footer');
        $this->layout->view('daily_sales/maintenance_template');
    }

    public function processForm() {
        try {
            /* foreach($this->input->post() as $row_daily_sales) {
              $row_daily_sales[0]
              } */
            /*echo '<pre>';
            print_r($this->input->post()); //'data', TRUE));
            print_r($this->input->request_headers());
            echo '</pre>';*/
            
            $data = array(
                            array(
                               'title' => 'My title' ,
                               'name' => 'My Name' ,
                               'date' => 'My date'
                            ),
                            array(
                               'title' => 'Another title' ,
                               'name' => 'Another Name' ,
                               'date' => 'Another date'
                            )
                         );


            $response['status'] = 0;
            $response['id']     = date('s');
            header("Content-type: application/json");
            echo json_encode($response);
        } catch (Exception $e) {
            echo $e;
        }
    }

    public function getJSONOperators() {
        try {
            $this->load->database();
            $this->load->model('UserDao', 'UserDAO');
            $array_operators = $this->UserDAO->getOperatorUsers();

            $array_operator_names = array();
            $array_operator_names['ids'] = $array_operators;
            foreach ($array_operators as $operator) {
                $full_name = trim($operator['full_name']);
                if (strlen($full_name) == 0) {
                    continue;
                }
                $this->UserDAO->get_user_id_by_name($full_name);
                $array_operator_names['full_names'][] = $operator['full_name'];
            }
            header("Content-type: application/json");
            echo json_encode($array_operator_names);
        } catch (Exception $e) {
            echo $e;
        }
    }
    
    public function getJSONDailySaleOthers() {
        try {
            $this->load->database();
            $this->load->model('DailySaleDao', 'DailySaleDao');
            $array_daily_sale_others = $this->DailySaleDao->getDailySaleOthers();

            /*$array_operator_names = array();
            $array_operator_names['ids'] = $array_operators;
            foreach ($array_operators as $operator) {
                $full_name = trim($operator['full_name']);
                if (strlen($full_name) == 0) {
                    continue;
                }
                $this->UserDAO->get_user_id_by_name($full_name);
                $array_operator_names['full_names'][] = $operator['full_name'];
            }*/
            header("Content-type: application/json");
            echo json_encode($array_daily_sale_others);
        } catch (Exception $e) {
            echo $e;
        }
    }

}
