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
        $query = $this->db->get('hpl_subsidiaries');

        return $query->result();
    }

}

?>
