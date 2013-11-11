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
    
    public function getChildModulesWithData($a_parent_module_ids=array(), $profile_id=null) {
        if(intval($profile_id)==0) {
            return false;
        }
        $a_parent_module_ids  = (is_array($a_parent_module_ids) && count($a_parent_module_ids)>0 ? $a_parent_module_ids : array($a_parent_module_ids));
        if(count($a_parent_module_ids)>0) {
            $this->db->where_in('mdl.parent_id', $a_parent_module_ids);
        } else {
            $this->db->where('mdl.parent_id', 'NOT NULL');
        }
        $this->db->select('mdl.id, mdl.name, mdl.description, mdl.parent_id, mpa.read, mpa.write, mpa.download');
        $this->db->where('mdl.is_deleted', 0);
        $this->db->where('mdl.status', Status::STATUS_ACTIVO);
        $this->db->order_by('mdl.position_order', 'ASC');
        $this->db->from('hpl_module mdl');
        $this->db->join('hpl_module_profile_access mpa', 'mdl.id=mpa.module_id', 'left');
        $query = $this->db->get();
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
