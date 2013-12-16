<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Dashboard extends ValidateAccess {
    public function __construct() {
        parent::__construct();
        $this->load->database();
        $this->load->model('SubsidiaryDao');
        $this->load->model('ReportDao');
        $this->load->library(array('form_validation', 'session'));
        $this->load->helper(array('form', 'url'));
        $this->layout->isLogin = false;
        $this->layout->title = "Admin Happyland - Perfiles";
    }
    
    public function index() {
        try {
            $this->layout->assets(base_url() . 'assets/js/dist/jquery.highcharts.js');
            $this->layout->assets(base_url() . 'assets/js/dist/jquery.highcharts-more.js');
            $this->layout->assets(base_url() . 'assets/js/happy/chart.js');
            $this->layout->assets(base_url() . 'assets/js/lib/chosen.jquery.js');
            $this->layout->assets(base_url() . 'assets/css/lib/chosen.css');
            
            /*
             * Esto se saca y se coloca en reportes
             */
            $this->layout->assets(base_url() . 'assets/css/lib/datepicker.css');
            $this->layout->assets(base_url() . 'assets/js/lib/bootstrap-datepicker.js');
            $this->layout->assets(base_url() . 'assets/js/lib/bootstrap-datepicker.es.js');
            
            $a_daily_sales_accumulate   = array();
            $a_daily_sales_by_day       = array();
            $month_selected             = '11';
            $date_selected              = '15/11/2013';
            $data['a_subsidiaries']             = $this->SubsidiaryDao->getDropdownSubsidiaries();
            $data['dbl_subsidiaries_parents']   = $this->SubsidiaryDao->getSubsidiarieParents();
            $dbl_daily_sales_accumulate         = $this->ReportDao->getDailySaleAccumulate($month_selected);
            $dbl_daily_sales_by_day             = $this->ReportDao->getDailySaleByDay(Utils::cambiaf_a_mysql($date_selected));

            foreach($dbl_daily_sales_accumulate as $dbr_daily_sales_accumulate) {
                $a_daily_sales_accumulate[$dbr_daily_sales_accumulate->parent_id][]   = $dbr_daily_sales_accumulate;
            }
            $data['a_daily_sales_accumulate'] = $a_daily_sales_accumulate;
             foreach($dbl_daily_sales_by_day as $dbr_daily_sales_by_day) {
                $a_daily_sales_by_day[$dbr_daily_sales_by_day->parent_id][]   = $dbr_daily_sales_by_day;
            }
            $data['a_daily_sales_by_day'] = $a_daily_sales_by_day;

            $data['month_selected']             = $month_selected;
            $data['date_selected']              = $date_selected;

            $this->layout->view('Dashboard/defaultPage', $data);
        } catch (Exception $e) {
            echo $e;
        }
    }
    
    public function DayliSalesBarChart() {
        $subsidiaries_id            = $this->input->post('subsidiaries_id');
        $dbl_daily_sales_report     = $this->ReportDao->getDailySalesVsBudget(array($subsidiaries_id));
        $a_data_chart               = array();
        
        foreach($dbl_daily_sales_report as $dbr_daily_sales_report) {
            $a_data_chart['daily_sale_avg'][]   = floatval(number_format($dbr_daily_sales_report->daily_sale_avg, 2));
            $a_data_chart['budget_amount'][]    = floatval(number_format($dbr_daily_sales_report->budget_amount, 2,'.', ','));
            $a_data_chart['month_budget'][]     = Utils::getMonthsName($dbr_daily_sales_report->month_budget, TRUE);
        }
        header("Content-type: application/json");
        echo json_encode($a_data_chart);
    }
}
