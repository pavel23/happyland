<?php

/**
 * Description of profiles_dao
 *
 * @author jroque
 */
class ModuleProfileAccessDao extends CI_Model {

    public function saveModuleProfileAccess($data, $module_id = null, $profile_id = null) {
        $exists_row = $this->getModuleProfileAccess($module_id, $profile_id);
        if ($exists_row==TRUE) {
            unset($data['profile_id']);
            unset($data['module_id']);
            if(count($data)>0) {
                $this->db->where('module_id', $module_id);
                $this->db->where('profile_id', $profile_id);
                $this->db->update('hpl_module_profile_access', $data);
                $this->db->last_query();    
            }
        } else {
            $this->db->insert('hpl_module_profile_access', $data);
        }
    }

    public function getModuleProfileAccess($module_id = null, $profile_id = null) {
        if (intval($module_id)==0 || intval($profile_id)==0) {
            return FALSE;
        }
        $this->db->select('module_id, profile_id');
        $this->db->where('module_id', $module_id);
        $this->db->where('profile_id', $profile_id);
        $query  = $this->db->get('hpl_module_profile_access');
        return ($query->num_rows() > 0 ? TRUE : FALSE);
    }
    
    public function deleteAccessModuleByProfile($profile_id=null, $a_module_id=array()) {
        $a_module_id  = is_array($a_module_id) ? array_filter($a_module_id) : array(trim($a_module_id));
        if (intval($profile_id)==0 || count($a_module_id)==0) {
            return FALSE;
        }
        
        $this->db->select('GROUP_CONCAT(id) as concat_id');
        $this->db->from('hpl_module');
        $this->db->where_in('id', $a_module_id);
        $this->db->or_where_in('parent_id', $a_module_id);
        $query = $this->db->get();
        //echo $this->db->last_query();
        $o_child_module_id = $query->row();
      
        $s_child_module_id  = $o_child_module_id ? $o_child_module_id->concat_id : NULL;
        $a_child_module_id  = explode(',', $s_child_module_id);

        if(count($a_child_module_id)) {
            $this->db->where('profile_id', $profile_id);
            $this->db->where_not_in('module_id', $a_child_module_id);
            $this->db->delete('hpl_module_profile_access');
            //echo $this->db->last_query();
        }
    }
    
    public function deleteAllAccessByProfile($profile_id=null) {
        if (intval($profile_id)==0) {
            return FALSE;
        }
        $this->db->where('profile_id', $profile_id);
        $this->db->delete('hpl_module_profile_access');
    }
}
