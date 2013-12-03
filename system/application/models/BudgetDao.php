<?php
/**
 * Description of budget_dao
 *
 * @author jroque
 */
class BudgetDao extends CI_Model {

    public function getAllBudgets() {
        $this->db->select('MONTH(bdg.date) as budget_month, SUM(bdg.budget_amount) AS budget_amount_monthly, sbs.name AS subsidiaries_name');
        $this->db->from('hpl_subsidiaries sbs');
        $this->db->join('hpl_subsidiaries_budget bdg', 'bdg.subsidiaries_id=sbs.id');
        $this->db->where('sbs.is_princ_office', 0);
        $this->db->where('sbs.status', Status::STATUS_ACTIVO);
        $this->db->where('sbs.is_deleted', 0);
        $this->db->group_by('MONTH(bdg.date) ASC');
        $this->db->order_by('bdg.subsidiaries_id', 'ASC');
        $this->db->order_by('MONTH(bdg.date)', 'ASC');
        $query = $this->db->get();
        return $query->result();
    }

}
