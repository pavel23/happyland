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
    
    public function getDailySalesVsBudget($a_subsidiaries_id=array(), $n_year=2013) {
        $a_subsidiaries_id  = (is_array($a_subsidiaries_id) && count($a_subsidiaries_id)>0 ? $a_subsidiaries_id : null);
        if(count($a_subsidiaries_id)>0) {
            $this->db->where_in('sbb.subsidiaries_id', $a_subsidiaries_id);
        }
        $query  = 'SELECT MONTH(sbb.date) AS month_budget, ';
        $query .= 'SUM(sbb.budget_amount) AS budget_amount, ';
        $query .= '(SELECT SUM(IFNULL(dsl.grand_total_z_format, dsl.grand_total_calculated)) FROM hpl_daily_sales dsl WHERE dsl.subsidiaries_id=sbb.subsidiaries_id AND YEAR(dsl.date_sale)=YEAR(sbb.date) AND MONTH(dsl.date_sale)=MONTH(sbb.date)) AS daily_sale_avg ';
        $query .= 'FROM hpl_subsidiaries_budget sbb ';
        if(count($a_subsidiaries_id)>0) {
            $query .= 'WHERE sbb.subsidiaries_id IN(' . implode(',', $a_subsidiaries_id) . ') ';
        }
        $query .= 'GROUP BY sbb.subsidiaries_id, YEAR(sbb.date), MONTH(sbb.date)';
        return $this->db->query($query)->result();
  /*      
        $this->db->select('MONTH (sbb.date) AS month_budget');
        $this->db->select('AVG(sbb.budget_amount) AS budget_amount');
        $this->db->select('(SELECT AVG(IFNULL(dsl.grand_total_z_format, dsl.grand_total_calculated)) FROM hpl_daily_sales dsl WHERE dsl.subsidiaries_id=sbb.subsidiaries_id AND MONTH(dsl.date_sale)=MONTH(sbb.date)) AS daily_sale_avg');
        $this->db->from('hpl_subsidiaries_budget sbb');
        $this->db->where('YEAR(sbb.date)', $n_year);
        $this->db->group_by('MONTH(sbb.date)');
        $this->db->order_by('sbb.date', 'ASC');
        $query = $this->db->get();
*/
        //echo $this->db->last_query(); 
        //return $query->result();
    }

}
