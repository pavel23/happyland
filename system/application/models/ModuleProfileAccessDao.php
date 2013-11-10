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
            $this->db->where('module_id', $module_id);
            $this->db->where('profile_id', $profile_id);
            $this->db->update('hpl_module_profile_access', $data);
        } else {
            $this->db->insert('hpl_module_profile_access', $data);
        }
    }

    public function getModuleProfileAccess($module_id = null, $profile_id = null) {
        if (intval($module_id)==0 || intval($profile_id)==0) {
            return false;
        }
        $this->db->select('module_id, profile_id');
        $this->db->where('module_id', $module_id);
        $this->db->where('profile_id', $profile_id);
        $query  = $this->db->get('hpl_module_profile_access');

        return ($query->num_rows() > 0 ? TRUE : FALSE);
    }
}
