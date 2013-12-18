<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Reports extends ValidateAccess {
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
        $this->layout->assets(base_url() . 'assets/css/lib/daterangepicker-bs3.css');
        $this->layout->assets(base_url() . 'assets/js/lib/moment.js');
        $this->layout->assets(base_url() . 'assets/js/lib/bootstrap-datepicker.js');
        $this->layout->assets(base_url() . 'assets/js/lib/daterangepicker.js');
        $this->layout->assets(base_url() . 'assets/js/lib/daterangepicker.es.js');
        $this->layout->assets(base_url() . 'assets/js/happy/report.js');
            
        $a_daily_sales_accumulate   = array();
        $a_daily_sales_by_day       = array();
        $month_selected             = '11';
        $date_selected              = '15/11/2013';
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

        $this->layout->view('Report/IndexReport', $data);
    }
    public function getReportByRange($start_date, $finish_date) {
        
    }
}