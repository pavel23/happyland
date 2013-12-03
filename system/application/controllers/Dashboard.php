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

            $data['a_subsidiaries']         = $this->SubsidiaryDao->getDropdownSubsidiaries();
            $data['dbl_daily_sales_report'] = $this->ReportDao->getDailySalesReport();
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
            $a_data_chart['daily_sale_avg'][]   = floatval($dbr_daily_sales_report->daily_sale_avg);
            $a_data_chart['budget_amount'][]    = floatval($dbr_daily_sales_report->budget_amount);
            $a_data_chart['month_budget'][]     = Utils::getMonthsName($dbr_daily_sales_report->month_budget, TRUE);
        }
        header("Content-type: application/json");
        echo json_encode($a_data_chart);
    }
}
