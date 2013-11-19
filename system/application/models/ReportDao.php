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
            $this->db->where_in('mdl.id', $a_subsidiaries_id);
        }
        $this->db->select('sbs.name, sbs.area_m2, dsl.subsidiaries_id, dsl.total_master_card, dsl.total_visa_card, dsl.total_web_payment, dsl.grand_total_z_format, dsl.grand_total_calculated, dsl.date_sale');
        $this->db->from('hpl_daily_sales dsl');
        $this->db->join('hpl_subsidiaries sbs', 'dsl.subsidiaries_id=sbs.id', 'inner');
        $this->db->order_by('dsl.date_sale', 'ASC');
        $query = $this->db->get();
        return $query->result();
    }

}
