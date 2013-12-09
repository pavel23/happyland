<?php
/**
 * Description of budget_dao
 *
 * @author jroque
 */
class BudgetDao extends CI_Model {

    public function getAllBudgets() {
        $this->db->select('sbs.id, sbs.name, YEAR(CURRENT_DATE())-1 as last_year, SUM(sbg_last.budget_amount) AS budget_last_year, YEAR(CURRENT_DATE()) AS current_year, SUM(sbg_current.budget_amount) AS budget_current_year');
        $this->db->from('hpl_subsidiaries sbs');
        $this->db->join('hpl_subsidiaries_budget sbg_last', 'sbs.id=sbg_last.subsidiaries_id AND YEAR(sbg_last.date)=' . (date('Y')-1), 'left');
        $this->db->join('hpl_subsidiaries_budget sbg_current', 'sbs.id=sbg_current.subsidiaries_id AND YEAR(sbg_current.date)=' . date('Y'), 'left');
        $this->db->where('sbs.is_princ_office', 0);
        $this->db->where('sbs.status', Status::STATUS_ACTIVO);
        $this->db->where('sbs.is_deleted', 0);
        $this->db->group_by('sbs.id ASC');
        $query = $this->db->get();
        return $query->result();
    }
    
    public function getDailyBudget($subsidiary_id=null, $month=null) {
        $this->db->select('sbb.id, sbb.date, sbb.budget_amount, sbb.budget_amount_assigned, dls.grand_total_z_format');
        $this->db->from('hpl_subsidiaries_budget sbb');
        $this->db->join('hpl_daily_sales dls', 'sbb.date=dls.date_sale AND dls.subsidiaries_id='.$subsidiary_id, 'left');
        $this->db->where('sbb.subsidiaries_id', $subsidiary_id); 
        $this->db->where('MONTH(sbb.date)', $month); 
        $this->db->where('YEAR(sbb.date)=YEAR(CURRENT_DATE())');
        $this->db->order_by('sbb.date ASC');
        //$this->db->group_by('sbb.subsidiaries_id');
        //$this->db->group_by('YEAR(sbb.date)');
        $query = $this->db->get();
        return $query->result();
    }
    
    public function getBudgetByIds($a_budget_id=array(), $subsidiary_id=null) {
        if(count($a_budget_id)==0 && !$subsidiary_id) {
            return false;
        }
        $this->db->select('sbb.id, sbb.date');
        $this->db->from('hpl_subsidiaries_budget sbb');
        $this->db->where_in('sbb.subsidiaries_id', $subsidiary_id);
        $this->db->where_in('sbb.id', $a_budget_id);
        $query = $this->db->get();
        return $query->result();
    }
    
    public function update_budget_batch($data_budget=array()) {
        if(count($data_budget)>0) {
            $this->db->update_batch('hpl_subsidiaries_budget', $data_budget, 'id'); 
        }
    }
    
    public function insert_budget_batch($data_budget=array()) {
        if(count($data_budget)>0) {
            $this->db->insert_batch('hpl_subsidiaries_budget', $data_budget); 
            echo $this->db->last_query();
        }
    }
}
