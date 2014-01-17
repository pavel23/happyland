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
            $this->layout->assets(base_url() . 'assets/lib/js/jquery.highcharts.js');
            $this->layout->assets(base_url() . 'assets/lib/js/jquery.highcharts-more.js');
            $this->layout->assets(base_url() . 'assets/happy/js/dash/chart.js');
            $this->layout->assets(base_url() . 'assets/lib/js/chosen.jquery.js');
            $this->layout->assets(base_url() . 'assets/lib/css/chosen.css');

            $data['a_subsidiaries'] = $this->SubsidiaryDao->getDropdownSubsidiaries();
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
            $a_data_chart['daily_sale_avg'][]   = floatval(number_format($dbr_daily_sales_report->daily_sale_avg, 2,'.',''));
            $a_data_chart['budget_amount'][]    = floatval(number_format($dbr_daily_sales_report->budget_amount, 2,'.',''));
            //$a_data_chart['budget_amount'][]    = floatval(number_format($dbr_daily_sales_report->budget_amount_ext, 2,'.',''));
            $a_data_chart['month_budget'][]     = Utils::getMonthsName($dbr_daily_sales_report->month_budget, TRUE);
        }
        $gauge_avg  = (array_sum($a_data_chart['daily_sale_avg'])/array_sum($a_data_chart['budget_amount']))*100;
        $a_data_chart['gauge_avg']  = floatval(number_format($gauge_avg, 2, '.', ''));

        $this->output
             ->set_content_type('application/json')
             ->set_output(json_encode($a_data_chart));
    }
    
    public function DirectoryDashboardIndex() {
        $data = array();
        $this->layout->view('Dashboard/directoryDashboard', $data);
    }
    
    public function ZonalDashboardIndex() {
        //$this->layout->assets(base_url() . 'assets/lib/js/chart-exporting.js');
        $this->layout->assets(base_url() . 'assets/lib/js/jquery.tablesorter.min.js');
        $this->layout->assets(base_url() . 'assets/lib/js/number_format.js');
        $this->layout->assets(base_url() . 'assets/lib/js/jquery.highcharts.js');
        $this->layout->assets(base_url() . 'assets/lib/js/jquery.highcharts-more.js');
        $this->layout->assets(base_url() . 'assets/happy/js/dash/chart.js');
        $this->layout->assets(base_url() . 'assets/happy/js/dash/dashboard-zonal.js');
        $this->layout->view('Dashboard/zonalDashboard');
    }
    
    public function getDataGaugeByZonal($n_year=null) {
        $n_year = 2013;//$n_year ? $n_year : date('Y');
        $dbl_daily_sales_ppto           = $this->ReportDao->getDailySalesPptoByZonal($n_year);
        $dbl_daily_sales_percent        = $this->ReportDao->getDailySalesPercentByZonal($n_year);
        $dbl_daily_sales_accumulated    = $this->ReportDao->getDailySalesByZonal($n_year);
        $a_gauge_zonal_date             = array(array('name' => '', 'ppto_avg' => 0), array('name' => '', 'ppto_avg' => 0), array('name' => '', 'ppto_avg' => 0));
        $a_table_accumulated            = array();
        $a_total_sale_zonal             = array();

        foreach($dbl_daily_sales_accumulated as $dbr_daily_sales_accumulated) {
            $a_table_accumulated[$dbr_daily_sales_accumulated->parent_id][$dbr_daily_sales_accumulated->id] = $dbr_daily_sales_accumulated;
            $a_total_sale_zonal[$dbr_daily_sales_accumulated->parent_id][$dbr_daily_sales_accumulated->id] = $dbr_daily_sales_accumulated->grand_total_z_format_sum;
        }
       
        $a_daily_sale_pie = array();
        foreach($dbl_daily_sales_percent as $key=>$dbr_zonal_daily_sales_accum) {
            $a_daily_sale_pie[$dbr_zonal_daily_sales_accum->parent_id][]  = array($dbr_zonal_daily_sales_accum->subsidiaries_name, floatval(number_format($dbr_zonal_daily_sales_accum->grand_total_z_format_sum, 2, '.', '')));
        }

        if(array_key_exists(0, $dbl_daily_sales_ppto)) {
            $a_gauge_zonal_date[0]['pie']           = $a_daily_sale_pie[$dbl_daily_sales_ppto[0]->parent_id];
            $a_gauge_zonal_date[0]['name']          = $dbl_daily_sales_ppto[0]->zona_name;
            $a_gauge_zonal_date[0]['ppto_avg']      = floatval(number_format(($dbl_daily_sales_ppto[0]->grand_total_z_format_sum/$dbl_daily_sales_ppto[0]->budget_amount_sum)*100, 2, '.', ''));
            $data['data_table']                     = $a_table_accumulated[$dbl_daily_sales_ppto[0]->parent_id];
            $data['total_z_sum']                    = array_sum($a_total_sale_zonal[$dbl_daily_sales_ppto[0]->parent_id]);
            $a_gauge_zonal_date[0]['table_zonal1']  = $this->load->view('Dashboard/zonalTableAccumulated', $data, true);
            unset($data);
        }
        if(array_key_exists(1, $dbl_daily_sales_ppto)) {
            $a_gauge_zonal_date[1]['pie']           = $a_daily_sale_pie[$dbl_daily_sales_ppto[1]->parent_id];
            $a_gauge_zonal_date[1]['name']          = $dbl_daily_sales_ppto[1]->zona_name;
            $a_gauge_zonal_date[1]['ppto_avg']      = floatval(number_format(($dbl_daily_sales_ppto[1]->grand_total_z_format_sum/$dbl_daily_sales_ppto[1]->budget_amount_sum)*100, 2, '.', ''));
            $data['data_table']                     = $a_table_accumulated[$dbl_daily_sales_ppto[1]->parent_id];
            $data['total_z_sum']                    = array_sum($a_total_sale_zonal[$dbl_daily_sales_ppto[1]->parent_id]);
            $a_gauge_zonal_date[1]['table_zonal2']  = $this->load->view('Dashboard/zonalTableAccumulated', $data, true);
            unset($data);
        }
        if(array_key_exists(2, $dbl_daily_sales_ppto)) {
            $a_gauge_zonal_date[2]['pie']           = $a_daily_sale_pie[$dbl_daily_sales_ppto[2]->parent_id];
            $a_gauge_zonal_date[2]['name']          = $dbl_daily_sales_ppto[2]->zona_name;
            $a_gauge_zonal_date[2]['ppto_avg']      = floatval(number_format(($dbl_daily_sales_ppto[2]->grand_total_z_format_sum/$dbl_daily_sales_ppto[2]->budget_amount_sum)*100, 2, '.', ''));
            $data['data_table']                     = $a_table_accumulated[$dbl_daily_sales_ppto[2]->parent_id];
            $data['total_z_sum']                    = array_sum($a_total_sale_zonal[$dbl_daily_sales_ppto[2]->parent_id]);
            $a_gauge_zonal_date[2]['table_zonal3']  = $this->load->view('Dashboard/zonalTableAccumulated', $data, true);
            unset($data);
        }
        $this->output
             ->set_content_type('application/json')
             ->set_output(json_encode($a_gauge_zonal_date));

    }
}
