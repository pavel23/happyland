<?php

/**
 * Description of profiles_dao
 *
 * @author jroque
 */
class ModuleDao extends CI_Model {

    public function getParentModules($a_module_ids=array()) {
        $a_module_ids  = (is_array($a_module_ids) && count($a_module_ids)>0 ? $a_module_ids : null);
        if(count($a_module_ids)>0) {
            $this->db->where_in('id', $a_module_ids);
        }
        $this->db->where('parent_id', NULL);
        $this->db->where('is_deleted', 0);
        $this->db->where('status', Status::STATUS_ACTIVO);
        $this->db->order_by('position_order', 'ASC');
        $query = $this->db->get('hpl_module');
        return $query->result();
    }

    public function getChildModules($a_parent_module_ids=array()) {
        $a_parent_module_ids  = (is_array($a_parent_module_ids) && count($a_parent_module_ids)>0 ? $a_parent_module_ids : array($a_parent_module_ids));
        if(count($a_parent_module_ids)>0) {
            $this->db->where_in('parent_id', $a_parent_module_ids);
        } else {
            $this->db->where('parent_id', 'NOT NULL');
        }
        $this->db->where('is_deleted', 0);
        $this->db->where('status', Status::STATUS_ACTIVO);
        $this->db->order_by('position_order', 'ASC');
        $query = $this->db->get('hpl_module');
        return $query->result();
    }

    public function getAllModules($a_module_ids=array()) {
        $a_module_ids  = (is_array($a_module_ids) && count($a_module_ids)>0 ? $a_module_ids : array($a_module_ids));
        if(count($a_module_ids)>0) {
            $this->db->where_in('id', $a_module_ids);
        }
        $this->db->where('is_deleted', 0);
        $this->db->where('status', Status::STATUS_ACTIVO);
        $this->db->order_by('position_order', 'ASC');
        $query = $this->db->get('hpl_module');
        return $query->result();
    }
    
    public function returnExistsModuleIds($a_module_ids=array()) {
        $a_module_ids  = (is_array($a_module_ids) && count($a_module_ids)>0 ? $a_module_ids : array($a_module_ids));
        if(count($a_module_ids)>0) {
            $this->db->where_in('id', $a_module_ids);
        }
        $this->db->select('id');
        $this->db->where('is_deleted', 0);
        $this->db->where('status', Status::STATUS_ACTIVO);
        $this->db->order_by('position_order', 'ASC');
        $query = $this->db->get('hpl_module');
        return $query->result_array();
    }
}
