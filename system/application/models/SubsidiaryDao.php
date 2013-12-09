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

    public function getSubsidiaries() {
	$this->db->select('sbs1.id, sbs1.name AS parent_name, sbs2.id AS child_id, sbs2.name AS child_name, sbs2.parent_id');
        $this->db->from('hpl_subsidiaries sbs1');
        $this->db->join('hpl_subsidiaries sbs2', 'sbs1.id=sbs2.parent_id AND sbs1.parent_id IS NULL AND sbs2.parent_id >0', 'inner');
        $this->db->where('sbs1.status', Status::STATUS_ACTIVO);
        $this->db->where('sbs2.status', Status::STATUS_ACTIVO);
        $this->db->where('sbs1.is_princ_office',0);
        $this->db->where('sbs2.is_princ_office',0);
        $this->db->where('sbs1.is_deleted',0);
        $this->db->where('sbs2.is_deleted',0);
        $this->db->order_by('sbs1.position_order ASC');
        $this->db->order_by('sbs2.position_order ASC');
        $query = $this->db->get();
        return $query->result();
    }
    
    public function getSubsidiarieParents() {
        $this->db->select('id, name, area_m2');
        $this->db->from('hpl_subsidiaries');
        $this->db->where('status', Status::STATUS_ACTIVO);
        $this->db->where('parent_id IS NULL');
        $this->db->where('is_princ_office', 0);
        $this->db->order_by('position_order ASC');
        $query = $this->db->get();
        return $query->result();
    }

    public function getDropdownSubsidiaries(){
        $dbl_subsidiaries = $this->getSubsidiaries();
        $a_subsidiaries = array();
        foreach ($dbl_subsidiaries as $dbr_subsidiaries) {
            $a_subsidiaries[$dbr_subsidiaries->parent_name][$dbr_subsidiaries->child_id]  = $dbr_subsidiaries->child_name;
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
