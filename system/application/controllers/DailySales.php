<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * Description of diary_sales_controller
 *
 * @author jroque
 */
class DailySales extends My_Controller {

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
        $this->layout->assets(base_url() . 'assets/css/daily_sales.css');
        $this->layout->assets(base_url() . 'assets/css/lib/fullcalendar.css');
        $this->layout->assets('//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js');
        $this->layout->assets(base_url() . 'assets/js/lib/fullcalendar.min.js');
        $this->layout->assets(base_url() . 'assets/js/daily_sale/list_daily_sales.js');
        $this->layout->view('daily_sales/list_template');
    }

    public function getDailySaleCalendar() {
        $daily_sale_credentials = $this->input->get();
        $dblDailyDao = $this->DailySaleDao->getDailySaleCalendar($daily_sale_credentials['start'], $daily_sale_credentials['end']);
        $timestamp = strtotime(Date('Y-m-d'));

        $jsonArray[] = array('title' => "Agregar Venta \n Estado: Abierto", 'start' => Date('Y-m-d', $timestamp), 'className' => 'label label-important', 'url' => site_url('DailySales/maintenanceForm/'));
        
        foreach ($dblDailyDao as $dbrDailyDao) {

            $jsonArray[] = array(
                'title' => "Venta del Día \n S/ " . $dbrDailyDao->grand_total_calculated . "\n Estado: " . Status::$statuses[$dbrDailyDao->status],
                'start' => $dbrDailyDao->date_sale,
                'className' => 'label ' . ($dbrDailyDao->status == Status::STATUS_ABIERTO ? 'label-info' : 'label-success'),
                'url' => site_url('DailySales/maintenanceForm/' . $dbrDailyDao->id)
            );

            if ($timestamp == strtotime($dbrDailyDao->date_sale)) {
                unset($jsonArray[0]);
            }
        }

        $jsonArray = array_values($jsonArray);
        
        echo json_encode($jsonArray);
    }

    public function maintenanceForm($daily_sale_id = null) {
        $this->layout->assets(base_url() . 'assets/css/dist/jquery.handsontable.full.css');
        $this->layout->assets(base_url() . 'assets/js/lib/jquery.ajaxQueue.min.js');
        $this->layout->assets(base_url() . 'assets/js/dist/jquery.handsontable.full.js');
        $this->layout->assets(base_url() . 'assets/js/happy/daily.sales.js');
        $daily_sale_id = ($daily_sale_id ? (int) $daily_sale_id : 0);

        $dbl_daily_sales_detail = null;
        $dbl_daily_sales = null;
        if ($daily_sale_id > 0) {
            $dbl_daily_sales = $this->DailySaleDao->getDailySaleById($daily_sale_id);
            $dbl_daily_sales_detail = $this->DailySaleDao->getDailySaleDetailBySaleId($daily_sale_id);
        }

        if (!$dbl_daily_sales_detail) {
            $dbl_daily_sales_detail = $this->DailySaleDao->getDailyOtherSale();
        }

        $data_daily_sale = array();

        if ($daily_sale_id > 0) {
            $data_daily_sale = $dbl_daily_sales_detail;
        } else {
            foreach ($dbl_daily_sales_detail as $dbr_daily_sale) {
                $data_daily_sale[] = array(
                    'type_of_sales_id' => (int) $dbr_daily_sale->id,
                    'name' => ($dbr_daily_sale->is_other_sales == 1 ? $dbr_daily_sale->name : ''),
                    'is_other_sales' => (int) $dbr_daily_sale->is_other_sales,
                    'operator_id' => '',
                    'cash_number' => '',
                    'opening_cash' => '',
                    'closing_cash' => '',
                    'master_card_amount' => '',
                    'visa_amount' => '',
                    'retirement_amount_pen' => '',
                    'retirement_amount_dol' => '',
                    'total_calculated' => '',
                    'total_x_format' => '',
                    'difference_money' => '',
                    'difference_values' => '',
                    'num_transacctions' => '',
                    'hour_by_cash' => '');
            }
        }

        $data['is_readonly'] = 0;
        if ($dbl_daily_sales) {

            $data['dailySaleId'] = $dbl_daily_sales->id;
            $data['is_readonly'] = (int) ($dbl_daily_sales->status == Status::STATUS_ABIERTO ? 0 : 1);
        }

        $data_daily_sale[] = array(
            'status' => '',
            'name' => 'Totales del Día',
            'is_other_sales' => 2,
            'total_opening_cash' => 0,
            'total_closing_cash' => 0,
            'total_master_card' => 0,
            'total_visa_card' => 0,
            'total_retirement_pen' => 0,
            'total_retirementl_dol' => 0,
            'grand_total_calculated' => 0,
            'grand_total_z_format' => 0,
            'total_difference_money' => 0,
            'total_diferrence_values' => 0,
            'total_num_transactions' => 0,
            'total_hours_by_cash' => 0);

        $data['dailySale'] = $data_daily_sale;

        $this->layout->view('daily_sales/maintenance_template', $data);
    }

    public function processForm() {
        try {
            $daily_sale_credentials = $this->input->post();
            $data_daily_sale = array();
            $response = array();

            $daily_sale_id = ($daily_sale_credentials['daily_sale_id'] > 0 ? $daily_sale_credentials['daily_sale_id'] : null);
            $daily_sale_detail_id = ($daily_sale_credentials['daily_sale_detail_id'] > 0 ? $daily_sale_credentials['daily_sale_detail_id'] : null);
            $operator_id = isset($daily_sale_credentials['operator_id']) ? $daily_sale_credentials['operator_id'] : 0;
            $status = (isset($daily_sale_credentials['is_close']) && $daily_sale_credentials['is_close'] == 1) ? Status::STATUS_CERRADO : Status::STATUS_ABIERTO;

            $dbr_daily_sale = $this->DailySaleDao->getDailySaleById($daily_sale_id);

            $data_daily_sale['status'] = $status;
            if (count($dbr_daily_sale) == 0) {
                $data_daily_sale['subsidiaries_id'] = 10; // aqui va ir la subsidaria depednde del perfil del usuario
                $data_daily_sale['date_sale'] = date('Y/m/d');
                $response['daily_sale_id'] = $this->DailySaleDao->saveDailySale($data_daily_sale);
            } else {
                $response['daily_sale_id'] = $dbr_daily_sale->id;
            }

            if (count($dbr_daily_sale) > 0 && $status == Status::STATUS_CERRADO) {
                $daily_sale_credentials['data']['status'] = $status;
                unset($daily_sale_credentials['data']['is_other_sales']);
                unset($daily_sale_credentials['data']['name']);

                $response['daily_sale_id'] = $this->DailySaleDao->saveDailySale($daily_sale_credentials['data'], $dbr_daily_sale->id);
            }

            if ($response['daily_sale_id'] && $status == Status::STATUS_ABIERTO) {
                $daily_sale_credentials['data']['daily_sales_id'] = $response['daily_sale_id'];
                $daily_sale_credentials['data']['operator_id'] = $operator_id;
                unset($daily_sale_credentials['data']['is_other_sales']);
                unset($daily_sale_credentials['data']['name']);
                unset($daily_sale_credentials['data']['id']);
                $response['daily_sale_detail_id'] = $this->DailySaleDao->saveDailySaleDetail($daily_sale_credentials['data'], $daily_sale_detail_id);
            }

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
            $this->load->model('UserDao');
            $array_operators = $this->UserDao->getOperatorUsers();

            $array_operator_names = array();
            $array_operator_names['ids'] = $array_operators;
            foreach ($array_operators as $operator) {
                $full_name = trim($operator['full_name']);
                if (strlen($full_name) == 0) {
                    continue;
                }
                $this->UserDao->get_user_id_by_name($full_name);
                $array_operator_names['full_names'][] = $operator['full_name'];
            }
            header("Content-type: application/json");
            echo json_encode($array_operator_names);
        } catch (Exception $e) {
            echo $e;
        }
    }

    //public function close

    public function getJSONDailySaleOthers() {
        try {
            $this->load->database();
            $this->load->model('DailySaleDao');
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
