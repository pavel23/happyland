<?php

/**
 * Description of SubsidiaryDao
 *
 * @author Pavel
 */
class SubsidiaryDao extends CI_Model {

    public function getAllSubsidiaries() {
        $this->db->where('status', Status::STATUS_ACTIVO);
        $this->db->where('parent_id IS NULL');
        $this->db->order_by('is_princ_office ASC');
        $this->db->order_by('name ASC');
        $query = $this->db->get('hpl_subsidiaries');

        return $query->result();
    }
    
    public function getLocalSubsidiaries() {
        $this->db->select('id, name, area_m2');
        $this->db->where('status', Status::STATUS_ACTIVO);
        $this->db->where('parent_id IS NULL');
        $this->db->where('is_princ_office',0);
        $query = $this->db->get('hpl_subsidiaries');
        return $query->result();
    }

    public function getDropdownSubsidiaries(){
        $dbl_local_subsidiaries = $this->getLocalSubsidiaries();
        $a_subsidiaries = array();
        foreach ($dbl_local_subsidiaries as $dbr_local_subsidiaries) {
            $a_subsidiaries[$dbr_local_subsidiaries->id]  = $dbr_local_subsidiaries->name;
        }
        return $a_subsidiaries;
    }
    
    public function getSubsidiaryById($subsidiary_id=null) {
        if(!$subsidiary_id) {
            return false;
        }
        $this->db->where('id', $subsidiary_id);
        $query = $this->db->get('hpl_subsidiaries');
        return ($query->num_rows() == 1 ? $query->row() : null);
    }
}

?>
