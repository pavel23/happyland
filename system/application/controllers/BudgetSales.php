<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * Description of diary_sales_controller
 *
 * @author jroque
 */
class BudgetSales extends ValidateAccess {

    function __construct() {
        parent::__construct();
        $this->load->database();
        $this->loggedin = $this->session->userdata('loggedin');
        $this->layout->isLogin = false;
        $this->load->library(array('session'));
        $this->load->model('ProfileDao');
        $this->load->model('SubsidiaryDao');
        $this->load->model('BudgetDao');
        $this->load->helper('url');
    }

    public function listBudget() {
        //$this->validateAccessByModule();
        $this->layout->assets(base_url() . 'assets/js/lib/jquery.dataTables.js');
        $this->layout->assets(base_url() . 'assets/js/happy/pipeline_table.js');
        $this->layout->assets(base_url() . 'assets/js/happy/budget.table.list.js');
        $this->layout->assets(base_url() . 'assets/css/data-table.css');
        $this->layout->view('Budget/listBudget');
    }

    public function getDataTableList() {
        $dbl_budget             = $this->BudgetDao->getAllBudgets();
        $a_budget_list          = array();
        foreach($dbl_budget as $budget_subsidiaries) {
                $a_budget_list['aaData'][]  = array(
                                                    'id' => $budget_subsidiaries->id,
                                                    'name' => $budget_subsidiaries->name,
                                                    'budget_current_year' => 'S/. '.number_format($budget_subsidiaries->budget_current_year, 2),
                                                    'budget_last_year' => 'S/. '.number_format($budget_subsidiaries->budget_last_year, 2),
                                                    'btn_edit' => anchor(site_url('BudgetSales/maintenanceBudget/'.$budget_subsidiaries->id), '<i class="icon-edit icon-white"></i><span><strong>Editar</strong></span>', array('class' => 'btn btn-primary btn-xs'))
                                                );
        }
        $this->output
             ->set_content_type('application/json')
             ->set_output(json_encode($a_budget_list));
    }

    public function maintenanceBudget($subsidiary_id = null) {
        $dbr_subsidiary = $this->SubsidiaryDao->getSubsidiaryById($subsidiary_id);
        if($dbr_subsidiary){
            $this->layout->assets('//cdnjs.cloudflare.com/ajax/libs/numeral.js/1.4.5/numeral.min.js');
            $this->layout->assets(base_url() . 'assets/js/dist/jquery.handsontable.full.js');
            $this->layout->assets(base_url() . 'assets/js/happy/budget.sales.js');
            $this->layout->assets(base_url() . 'assets/css/dist/jquery.handsontable.full.css');

            $a_data_budget['budget_headers'][] = 'Fecha';
            $a_data_budget['budget_headers'][] = 'Ppto ' . date('Y') . ' Int.';
            $a_data_budget['budget_headers'][] = 'Ppto ' . date('Y') . ' Chile';
            $a_data_budget['budget_headers'][] = 'Venta Real ' . date('Y');
            $a_data_budget['budget_headers'][] = 'Venta Asig ' . (date('Y') - 1);
            $a_data_budget['budget_headers'][] = '% cr/Ppto';
            $a_data_budget['budget_headers'][] = '% cr/ ' . (date('Y') - 1);
            $a_data_budget['budget_headers'][] = 'Ppto Acum';
            $a_data_budget['budget_headers'][] = 'Venta Real Acum';
            $a_data_budget['budget_headers'][] = 'Venta Asig ' . (date('Y')-1) . ' Acum';
            $a_data_budget['budget_headers'][] = '% cr / Ppto Acum';
            $a_data_budget['budget_headers'][] = '% cr / Vta Asig ' . (date('Y') -1) . ' Acum';

            $data_template['subsidiary_id']     = $dbr_subsidiary->id;
            $data_template['subsidiary_name']   = $dbr_subsidiary->name;
            $data_template['a_data_budget']     = $a_data_budget;
        } else{
            $data_template['subsidiary_id']     = '';
            $data_template['subsidiary_name']   = '';
            $data_template['a_data_budget']     = '';
        }
        $this->layout->view('Budget/maintenanceBudget', $data_template);
    }

    public function getDataBudgetJson($subsidiary_id=null) {
        $month                      = $this->input->post('month');
        $daily_budget               = $this->BudgetDao->getDailyBudget($subsidiary_id, $month);
        $a_daily_budget_id          = array();
        $a_daily_budget             = array();
        $a_real_sale_amount         = array();
        $a_budget_amount            = array();
        $a_budget_amount_ext        = array();
        $a_budget_amount_assigned   = array();
        $a_total_z_amount           = array();
        $a_last_toal_z_amount       = array();
        $a_ppto_accumulated         = array();
        $a_budget_assig_accumulated = array();
        $a_total_z_accumulated      = array();
        $ppto_accumulated           = 0;
        $budget_amount_accumulated  = 0;
        $total_z_accumulated        = 0;

        foreach ($daily_budget as $budget) {
            $budget_date = Utils::getFormattedDate($budget->date,'%d-%m-%Y');
            $a_daily_budget_id[$budget_date]        = $budget->id;
            $a_budget_amount[$budget_date]          = $budget->budget_amount;
            $a_budget_amount_ext[$budget_date]      = $budget->budget_amount_ext;
            $a_budget_amount_assigned[$budget_date] = $budget->budget_amount_assigned;
            $a_total_z_amount[$budget_date]         = $budget->grand_total_z_format;
            
            $ppto_accumulated += $budget->budget_amount;
            $budget_amount_accumulated += $budget->budget_amount_assigned;
            $total_z_accumulated += $budget->grand_total_z_format;

            $a_ppto_accumulated[$budget_date] = $ppto_accumulated;
            $a_total_z_accumulated[$budget_date] = $total_z_accumulated;
            $a_budget_assig_accumulated[$budget_date] = $budget_amount_accumulated;
        }

        $index=0;
        $a_data_budget['subsidiary_id'] = $subsidiary_id;
        for($day=1; $day <= date('t', mktime(0, 0, 0, $month)); $day++) {
            $current_date               = str_pad($day,2,0,STR_PAD_LEFT) . '-' . str_pad($month,2,0,STR_PAD_LEFT) .'-' . date('Y');
            $current_date_text          = Utils::getFormattedDate($current_date, '%l') . ', '. Utils::getFormattedDate($current_date, '%d' . ' de ' . Utils::getFormattedDate($current_date, '%F')) . ' de ' . date('Y');
            $current_ppto               = array_key_exists($current_date, $a_budget_amount) ? $a_budget_amount[$current_date] : 0;
            $current_ppto_ext           = array_key_exists($current_date, $a_budget_amount_ext) ? $a_budget_amount_ext[$current_date] : 0;
            $total_z_amount             = array_key_exists($current_date, $a_total_z_amount) ? $a_total_z_amount[$current_date] : 0;
            $last_real_assig            = array_key_exists($current_date, $a_budget_amount_assigned) ? $a_budget_amount_assigned[$current_date] : 0;
            $total_z_accumulated        = array_key_exists($current_date, $a_total_z_accumulated) ? $a_total_z_accumulated[$current_date] : 0;
            $budget_assig_accumulated   = array_key_exists($current_date, $a_budget_assig_accumulated) ? $a_budget_assig_accumulated[$current_date] : 0;
            $ppto_accumulated           = array_key_exists($current_date, $a_ppto_accumulated) ? $a_ppto_accumulated[$current_date] : 0;

            $current_percent_cr_ppto    = ($current_ppto > 0 ? (($total_z_amount/$current_ppto) - 1)*100 : 0);
            $last_percent_cr            = ($last_real_assig ? (($total_z_amount/$last_real_assig) - 1)*100 : 0);
            $cr_ppto_acumulated         = ($ppto_accumulated > 0 ? (($total_z_accumulated/$ppto_accumulated)-1)*100 : 0);
            $cr_sale_accumulated        = ($budget_assig_accumulated > 0 ? (($total_z_accumulated/$budget_assig_accumulated)-1)*100 : 0);

            $a_data_budget['budget_data'][$index]['id' ] = (array_key_exists($current_date, $a_daily_budget_id) ? $a_daily_budget_id[$current_date] : null);
            $a_data_budget['budget_data'][$index]['date' ] = $current_date;
            $a_data_budget['budget_data'][$index]['date_text' ] = $current_date_text;
            $a_data_budget['budget_data'][$index]['current_ppto'] = $current_ppto;
            $a_data_budget['budget_data'][$index]['current_ppto_ext'] = $current_ppto_ext;
            $a_data_budget['budget_data'][$index]['last_real_sale_assig'] = $last_real_assig;
            $a_data_budget['budget_data'][$index]['current_real_sale'] = $total_z_amount;
            $a_data_budget['budget_data'][$index]['current_percent_cr_ppto'] = number_format($current_percent_cr_ppto, 2) . '%';
            $a_data_budget['budget_data'][$index]['last_percent_cr'] = number_format($last_percent_cr, 2) . '%';;
            $a_data_budget['budget_data'][$index]['current_ppto_accumulated'] = number_format($ppto_accumulated, 2);
            $a_data_budget['budget_data'][$index]['current_real_sale_accumulated'] = number_format($total_z_accumulated, 2);
            $a_data_budget['budget_data'][$index]['last_real_sale_accumulated'] = number_format($budget_assig_accumulated, 2);
            $a_data_budget['budget_data'][$index]['current_cr_ppto_accumulated'] = number_format($cr_ppto_acumulated) . '%';
            $a_data_budget['budget_data'][$index]['last_cr_sale_accumulated'] = number_format($cr_sale_accumulated) . '%';;
            $index++;
        }
        $this->output
             ->set_content_type('application/json')
             ->set_output(json_encode($a_data_budget));
    }

    public function saveDataBudget($subsidiary_id) {
        $a_data_budget       = $this->input->post('data_for_process');
        $a_new_budgets_date  = array();
        $a_current_ppto      = array();
        $a_current_ppto_ext  = array();
        $a_current_real_sale = array();
        $a_data_budget_id    = array();

        foreach($a_data_budget as $data_budget) {
            $a_data_budget_id[] = $data_budget['id'];
            $budget_date      = Utils::getFormattedDate($data_budget['date'], '%Y-%m-%d');
            if(!$data_budget['id']){
                $a_new_budgets_date[] = $budget_date;
            }
            $a_current_ppto[$budget_date]           = $data_budget['current_ppto'];
            $a_current_ppto_ext[$budget_date]       = $data_budget['current_ppto_ext'];
            $a_last_real_sale_assig[$budget_date]   = $data_budget['last_real_sale_assig'];            
        }
        if(count($a_data_budget_id)>0) {
            $dbl_budget_ids = $this->BudgetDao->getBudgetByIds($a_data_budget_id, $subsidiary_id);
        }
        if($dbl_budget_ids){
            $data_update_batch = array();
            $index=0;
            foreach($dbl_budget_ids as $dbr_budget_by_date) {
                $budget_date                = Utils::getFormattedDate($dbr_budget_by_date->date, '%Y-%m-%d');
                $data_update_batch[$index]['id']  = $dbr_budget_by_date->id;
                $data_update_batch[$index]['budget_amount']             = $a_current_ppto[$budget_date];
                $data_update_batch[$index]['budget_amount_ext']         = $a_current_ppto_ext[$budget_date];
                $data_update_batch[$index]['budget_amount_assigned']    = $a_last_real_sale_assig[$budget_date];
                $index++;
            }
            $this->BudgetDao->update_budget_batch($data_update_batch);
            unset($data_update_batch);
        }
        if(count($a_new_budgets_date)>0) {
            $data_insert_batch  = array();
            $index=0;
            foreach($a_new_budgets_date as $new_budgets_date) {
                $data_insert_batch[$index]['date']                      = $new_budgets_date;
                $data_insert_batch[$index]['subsidiaries_id']           = $subsidiary_id;
                $data_insert_batch[$index]['budget_amount']             = $a_current_ppto[$new_budgets_date];
                $data_insert_batch[$index]['budget_amount_ext']         = $a_current_ppto_ext[$new_budgets_date];
                $data_insert_batch[$index]['budget_amount_assigned']    = $a_last_real_sale_assig[$new_budgets_date];
                $index++;
            }
            $this->BudgetDao->insert_budget_batch($data_insert_batch);
            unset($data_insert_batch);
        }
    }
}
