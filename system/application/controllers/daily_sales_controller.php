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
        $this->load->database();
        $this->layout->isLogin = false;
        $this->load->library(array('session'));
        $this->load->model('ProfileDao');
        $this->load->model('DailySaleDao');
        $this->load->helper('url');
    }

    public function index() {
        $this->load->database();
        $data['profile_data'] = $this->ProfileDao->getAllProfiles();
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
            $daily_sale_credentials = $this->input->post();
            $data_daily_sale = array();
            $data_daily_sale_detail = array();

            $daily_sale_id = ($daily_sale_credentials['daily_sale_id'] > 0 ? $daily_sale_credentials['daily_sale_id'] : null);
            $daily_sale_detail_id = ($daily_sale_credentials['daily_sale_detail_id'] > 0 ? $daily_sale_credentials['daily_sale_detail_id'] : null);


            $data_daily_sale['subsidiaries_id'] = 10;
            if (!$daily_sale_id) {
                $data_daily_sale['date_sale'] = date('Y/m/d');
            }

            $response['daily_sale_id'] = $this->DailySaleDao->saveDailySale($data_daily_sale, $daily_sale_id);

            if ($response['daily_sale_id']) {
                $data_update_daily_sale = ['type_of_sales_id', 'operator_id', 'cash_number', 'opening_cash', 'closing_cash', 'master_card_amount', 'visa_amount', 'retirement_amount_pen', 'retirement_amount_dol', 'total_calculated', 'total_x_format', 'difference_money', 'difference_values', 'num_transacctions', 'hour_by_cash'];

                foreach ($daily_sale_credentials['data'] as $key => $value) {
                    $data_daily_sale_detail[$data_update_daily_sale[$key]] = ($data_update_daily_sale[$key] == 'type_of_sales_id' ? 1 : $value);
                }

                $data_daily_sale_detail['daily_sales_id'] = $response['daily_sale_id'];


                $response['daily_sale_detail_id'] = $this->DailySaleDao->saveDailySaleDetail($data_daily_sale_detail, $daily_sale_detail_id);
            }


//            if ($daily_sale_credentials['daily_sale_detail_id']){
//                
//            }








            $response['status'] = 0;
            $response['id'] = date('s');
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

            /* $array_operator_names = array();
              $array_operator_names['ids'] = $array_operators;
              foreach ($array_operators as $operator) {
              $full_name = trim($operator['full_name']);
              if (strlen($full_name) == 0) {
              continue;
              }
              $this->UserDAO->get_user_id_by_name($full_name);
              $array_operator_names['full_names'][] = $operator['full_name'];
              } */
            header("Content-type: application/json");
            echo json_encode($array_daily_sale_others);
        } catch (Exception $e) {
            echo $e;
        }
    }

}
