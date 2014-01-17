<?php

/**
 * Description of profiles_dao
 *
 * @author jroque
 */
class ReportDao extends CI_Model {

    public function getDailySalesReport($a_subsidiaries_id=array()) {
        $a_subsidiaries_id  = (is_array($a_subsidiaries_id) && count($a_subsidiaries_id)>0 ? $a_subsidiaries_id : null);
        if(count($a_subsidiaries_id)>0) {
            $this->db->where_in('dsl.subsidiaries_id', $a_subsidiaries_id);
        }

        $this->db->select('sbs.name, sbs.area_m2, dsl.subsidiaries_id, dsl.total_master_card, dsl.total_visa_card, dsl.total_web_payment, SUM(dsl.grand_total_z_format) as grand_total_z_format, SUM(dsl.grand_total_calculated) as grand_total_calculated, dsl.date_sale, MONTH(dsl.date_sale) as month_sale');
        $this->db->from('hpl_daily_sales dsl');
        $this->db->join('hpl_subsidiaries sbs', 'dsl.subsidiaries_id=sbs.id', 'inner');
        $this->db->group_by('sbs.id, MONTH(dsl.date_sale)');
        $this->db->order_by('dsl.date_sale', 'ASC');
        $query = $this->db->get();
        return $query->result();
    }
    
    public function getDailySalesVsBudget($a_subsidiaries_id=array(), $n_year=null) {
        $n_year = 2013;//($n_year ? $n_year : date('Y'));
        $a_subsidiaries_id  = (is_array($a_subsidiaries_id) && count($a_subsidiaries_id)>0 ? $a_subsidiaries_id : null);

        $query  = 'SELECT MONTH(sbb.date) AS month_budget, ';
        $query .= 'SUM(sbb.budget_amount) AS budget_amount, ';
        $query .= 'SUM(sbb.budget_amount_ext) AS budget_amount_ext, ';
        $query .= '(SELECT SUM(dsl.grand_total_z_format) FROM hpl_daily_sales dsl WHERE dsl.subsidiaries_id=sbb.subsidiaries_id AND YEAR(dsl.date_sale)=YEAR(sbb.date) AND MONTH(dsl.date_sale)=MONTH(sbb.date)) AS daily_sale_avg ';
        $query .= 'FROM hpl_subsidiaries_budget sbb ';
        $query .= 'WHERE YEAR(sbb.date)= ' . $n_year . ' ';
        if(count($a_subsidiaries_id)>0) {
            $query .= 'AND sbb.subsidiaries_id IN(' . implode(',', $a_subsidiaries_id) . ') ';
        }
        $query .= 'GROUP BY sbb.subsidiaries_id, YEAR(sbb.date), MONTH(sbb.date)';
        return $this->db->query($query)->result();
    }

    public function getDailySaleAccumulate($month=null){
        $this->db->select('sbs.id AS subsidiaries_id, sbs.name AS subsidiary_name, sbs.parent_id, dls.id AS daily_sale_id, dls.date_sale, SUM(dls.grand_total_z_format) AS grand_total_z_format, SUM(sbb.budget_amount) AS budget_amount, SUM(sbb.budget_amount_assigned) AS budget_amount_assigned');
        $this->db->from('hpl_subsidiaries sbs ');
        $this->db->join('hpl_daily_sales dls', 'sbs.id=dls.subsidiaries_id', 'left');
        $this->db->join('hpl_subsidiaries_budget sbb', 'dls.subsidiaries_id=sbb.subsidiaries_id AND dls.date_sale=sbb.date', 'left');
        $this->db->where('sbs.is_princ_office', 0);
        $this->db->where('sbs.parent_id > 0');
        if($month){
            $this->db->where('MONTH(dls.date_sale)', $month);
        }
        $this->db->group_by('dls.subsidiaries_id ASC');
        $this->db->group_by('YEAR(dls.date_sale) ASC');
        $this->db->group_by('MONTH(dls.date_sale) ASC');
        $query = $this->db->get();
        return $query->result();
    }
    public function getDailySaleByDay($date=null){
        $this->db->select('sbs.id AS subsidiaries_id, sbs.name AS subsidiary_name, sbs.parent_id, dls.id AS daily_sale_id, dls.date_sale, dls.grand_total_z_format, sbb.budget_amount, sbb.budget_amount_assigned');
        $this->db->from('hpl_subsidiaries sbs ');
        $this->db->join('hpl_daily_sales dls', 'sbs.id=dls.subsidiaries_id', 'left');
        $this->db->join('hpl_subsidiaries_budget sbb', 'dls.subsidiaries_id=sbb.subsidiaries_id AND dls.date_sale=sbb.date', 'left');
        $this->db->where('sbs.is_princ_office', 0);
        $this->db->where('sbs.parent_id > 0');
        if($date){
            $this->db->where('dls.date_sale', $date);
        }
        $this->db->group_by('dls.subsidiaries_id ASC');
        $this->db->group_by('YEAR(dls.date_sale) ASC');
        $this->db->group_by('MONTH(dls.date_sale) ASC');
        $query = $this->db->get();
        return $query->result();
    }
    
    public function getDailySalesPptoByZonal($n_year=null, $subsidiaries_id=null) {
        $n_year = ($n_year ? $n_year : date('Y'));
        $this->db->select('sbb.id, sbb.date, sbs2.name AS zona_name, sbs.name AS subsidiary_name, sbs.parent_id, SUM(sbb.budget_amount) AS budget_amount_sum, SUM(sbb.budget_amount_assigned) AS budget_amount_assigned_sum, SUM(sbb.budget_amount_ext) AS budget_amount_ext_sum, SUM(dls.grand_total_z_format) AS grand_total_z_format_sum');
        $this->db->from('hpl_subsidiaries_budget sbb');
        $this->db->join('hpl_subsidiaries sbs', 'sbb.subsidiaries_id=sbs.id AND sbs.is_princ_office=0 AND sbs.status="'.Status::STATUS_ACTIVO.'" AND sbs.is_deleted=0', 'inner');
        $this->db->join('hpl_subsidiaries sbs2', 'sbs2.id=sbs.parent_id', 'inner');
        $this->db->join('hpl_daily_sales dls', 'dls.date_sale=sbb.date AND dls.subsidiaries_id=sbb.subsidiaries_id', 'inner');
        $this->db->where('sbs.is_princ_office', 0);
        $this->db->where('sbs.parent_id > 0');
        $this->db->group_by('sbs.parent_id ASC');
        $this->db->group_by('YEAR(sbb.date) ASC');
        $this->db->having('YEAR(sbb.date)=' . $n_year);
        $query = $this->db->get();
        return $query->result();
    }
    
    public function getDailySalesPercentByZonal($n_year=null, $subsidiaries_id=null) {
        $n_year = ($n_year ? $n_year : date('Y'));
        $this->db->select('sbs.id, sbs.parent_id, sbs2.name, sbs.name AS subsidiaries_name , dls.date_sale, SUM(dls.grand_total_z_format) AS grand_total_z_format_sum');
        $this->db->from('hpl_daily_sales dls');
        $this->db->join('hpl_subsidiaries sbs', 'sbs.id=dls.subsidiaries_id AND sbs.is_princ_office=0 AND sbs.status="'.Status::STATUS_ACTIVO.'" AND sbs.is_deleted=0', 'inner');
        $this->db->join('hpl_subsidiaries sbs2', 'sbs2.id=sbs.parent_id', 'inner');
        $this->db->where('sbs.is_princ_office', 0);
        $this->db->where('sbs.parent_id > 0');
        $this->db->group_by('YEAR(dls.date_sale) ASC');
        $this->db->group_by('sbs.parent_id ASC');
        $this->db->group_by('sbs.id ASC');
        $this->db->having('YEAR(dls.date_sale)=' . $n_year);
        $this->db->order_by('sbs2.id', 'ASC');
        $this->db->order_by('SUM(dls.grand_total_z_format)', 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    public function getDailySalesByZonal($n_year=null, $subsidiaries_id=null) {
        $n_year = ($n_year ? $n_year : date('Y'));
        $this->db->select('sbs.id, sbs.parent_id, sbs.name AS subsidiaries_name , dls.date_sale, SUM(dls.grand_total_z_format) AS grand_total_z_format_sum, SUM(sbb.budget_amount) AS budget_amount_sum, SUM(sbb.budget_amount_assigned) AS budget_amount_assigned_sum, SUM(sbb.budget_amount_ext) AS budget_amount_ext_sum');
        $this->db->from('hpl_daily_sales dls');
        $this->db->join('hpl_subsidiaries sbs', 'sbs.id=dls.subsidiaries_id AND sbs.is_princ_office=0 AND sbs.status="'.Status::STATUS_ACTIVO.'" AND sbs.is_deleted=0', 'inner');
        $this->db->join('hpl_subsidiaries_budget sbb', 'sbb.subsidiaries_id=sbs.id AND sbs.is_princ_office=0 AND sbs.status="'.Status::STATUS_ACTIVO.'" AND sbs.is_deleted=0', 'left');
        $this->db->where('sbs.is_princ_office', 0);
        $this->db->where('sbs.parent_id > 0');
        $this->db->group_by('YEAR(dls.date_sale) ASC');
        $this->db->group_by('sbs.id ASC');
        $this->db->having('YEAR(dls.date_sale)=' . $n_year);
        $this->db->order_by('sbs.parent_id', 'ASC');
        $this->db->order_by('SUM(dls.grand_total_z_format)', 'DESC');
        $query = $this->db->get();
        return $query->result();
    }
}