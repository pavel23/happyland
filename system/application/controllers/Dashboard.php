<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Dashboard extends ValidateAccess {
    public function __construct() {
        parent::__construct();
        $this->load->database();
        $this->load->model('ReportDao');
        $this->load->library(array('form_validation', 'session'));
        $this->load->helper(array('form', 'url'));
        $this->layout->isLogin = false;
        $this->layout->title = "Admin Happyland - Perfiles";
    }
    
    public function index() {
        try {
            $this->layout->assets(base_url() . 'assets/js/dist/jquery.jqplot.min.js');
            $this->layout->assets(base_url() . 'assets/js/dist/jqplot/jqplot.barRenderer.min.js');
            $this->layout->assets(base_url() . 'assets/js/dist/jqplot/jqplot.categoryAxisRenderer.min.js');
            $this->layout->assets(base_url() . 'assets/js/dist/jqplot/jqplot.highlighter.min.js');
            $this->layout->assets(base_url() . 'assets/js/dist/jqplot/jqplot.cursor.min.js');
            $this->layout->assets(base_url() . 'assets/js/dist/jqplot/jqplot.pointLabels.min.js');
            $this->layout->assets(base_url() . 'assets/js/dist/jqplot/jqplot.pieRenderer.min.js');

            $this->layout->assets(base_url() . 'assets/js/happy/chart.js');
            $this->layout->assets(base_url() . 'assets/css/dist/jquery.jqplot.min.css');

            $data['dbl_daily_sales_report'] = $this->ReportDao->getDailySalesReport();
            $this->layout->view('Dashboard/defaultPage', $data);
        } catch (Exception $e) {
            echo $e;
        }
    }
    
    public function DayliSalesBarChart() {
        $dbl_daily_sales_report     = $this->ReportDao->getDailySalesReport();
        $a_grant_total_calculate    = array();
        $a_grand_total_z_format     = array();
        $a_data_bar_chart           = array();
        
        foreach($dbl_daily_sales_report as $dbr_daily_sales_report) {
            $a_grant_total_calculate[]  = ($dbr_daily_sales_report->grand_total_calculated);
            $a_grand_total_z_format[]   = ($dbr_daily_sales_report->grand_total_z_format);
        }
        $a_data_bar_chart   = array($a_grant_total_calculate, $a_grand_total_z_format);
        header("Content-type: application/json");
        echo json_encode($a_data_bar_chart);
    }
}
