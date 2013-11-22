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
            $this->layout->assets(base_url() . 'assets/js/dist/jquery.jqplot.min.js');
            $this->layout->assets(base_url() . 'assets/js/dist/jqplot/jqplot.barRenderer.min.js');
            $this->layout->assets(base_url() . 'assets/js/dist/jqplot/jqplot.categoryAxisRenderer.min.js');
            $this->layout->assets(base_url() . 'assets/js/dist/jqplot/jqplot.highlighter.min.js');
            $this->layout->assets(base_url() . 'assets/js/dist/jqplot/jqplot.cursor.min.js');
            $this->layout->assets(base_url() . 'assets/js/dist/jqplot/jqplot.pointLabels.min.js');
            $this->layout->assets(base_url() . 'assets/js/dist/jqplot/jqplot.pieRenderer.min.js');
            $this->layout->assets(base_url() . 'assets/js/happy/chart.js');
            $this->layout->assets(base_url() . 'assets/css/dist/jquery.jqplot.min.css');
            $data['a_subsidiaries']         = $this->SubsidiaryDao->getDropdownSubsidiaries();
            $data['dbl_daily_sales_report'] = $this->ReportDao->getDailySalesReport();
            $this->layout->view('Dashboard/defaultPage', $data);
        } catch (Exception $e) {
            echo $e;
        }
    }
    
    public function DayliSalesBarChart() {
        $subsidiaries_id            = $this->input->post('subsidiaries_id');
        $dbl_daily_sales_report     = $this->ReportDao->getDailySalesReport(array($subsidiaries_id));
        $a_grant_total_calculate    = array();
        $a_grand_total_z_format     = array();
        $a_date_label               = array();
        $a_data_bar_chart           = array();
        
        /*foreach($dbl_daily_sales_report as $dbr_daily_sales_report) {
            $a_grant_total_calculate[]  = array($dbr_daily_sales_report->month_sale, $dbr_daily_sales_report->grand_total_calculated);
            $a_grand_total_z_format[]   = array($dbr_daily_sales_report->month_sale, $dbr_daily_sales_report->grand_total_z_format);
            //$a_date_label[]             = $dbr_daily_sales_report->month_sale;
        }*/
        
        $a_grant_total_calculate[]  = array('01','4000');
        $a_grant_total_calculate[]  = array('02','4500');
        $a_grant_total_calculate[]  = array('03','4700');
        $a_grant_total_calculate[]  = array('04','4200');
        $a_grant_total_calculate[]  = array('05','5000');
        $a_grant_total_calculate[]  = array('06','4900');
        $a_grant_total_calculate[]  = array('07','3500');
        $a_grant_total_calculate[]  = array('08','8750');
        $a_grant_total_calculate[]  = array('09','7000');
        $a_grant_total_calculate[]  = array('10','4000');
        $a_grant_total_calculate[]  = array('11','4500');
        $a_grant_total_calculate[]  = array('12','4850');
        
        $a_grand_total_z_format[]  = array('01','3000');
        $a_grand_total_z_format[]  = array('02','4000');
        $a_grand_total_z_format[]  = array('03','4500');
        $a_grand_total_z_format[]  = array('04','4500');
        $a_grand_total_z_format[]  = array('05','5500');
        $a_grand_total_z_format[]  = array('06','5000');
        $a_grand_total_z_format[]  = array('07','3000');
        $a_grand_total_z_format[]  = array('08','8500');
        $a_grand_total_z_format[]  = array('09','6500');
        $a_grand_total_z_format[]  = array('10','4500');
        $a_grand_total_z_format[]  = array('11','4500');
        $a_grand_total_z_format[]  = array('12','4800');
        
        $a_data_bar_chart['data_bar_chart'] = array($a_grant_total_calculate, $a_grand_total_z_format);
        //$a_data_bar_chart['data_labels']    = $a_date_label;
        header("Content-type: application/json");
        echo json_encode($a_data_bar_chart);
    }
}
