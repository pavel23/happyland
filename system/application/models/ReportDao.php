<?php

/**
 * Description of profiles_dao
 *
 * @author jroque
 */
class ReportDao extends CI_Model {

    public function getParentModulesWithData($a_module_ids=array(), $profile_id=null) {
        if(intval($profile_id)==0) {
            return false;
        }
        $a_module_ids  = (is_array($a_module_ids) && count($a_module_ids)>0 ? $a_module_ids : null);
        if(count($a_module_ids)>0) {
            $this->db->where_in('mdl.id', $a_module_ids);
        }
        $this->db->select('mdl.id, mpa.module_id, mdl.name, mdl.description, mdl.parent_id, mpa.read, mpa.write, mpa.download');
        $this->db->from('hpl_module mdl');
        $this->db->join('hpl_module_profile_access mpa', 'mdl.id=mpa.module_id AND mpa.profile_id='.$profile_id, 'left');
        $this->db->where('mdl.parent_id', NULL);
        $this->db->where('mdl.is_deleted', 0);
        $this->db->where('mdl.status', Status::STATUS_ACTIVO);
        //$this->db->where('mpa.profile_id', $profile_id);
        $this->db->order_by('mdl.position_order', 'ASC');
        $query = $this->db->get();
        return $query->result();
    }

}
