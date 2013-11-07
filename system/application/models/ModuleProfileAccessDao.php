<?php

/**
 * Description of profiles_dao
 *
 * @author jroque
 */
class ModuleProfileAccessDao extends CI_Model {

    public function saveModuleProfileAccess($data, $module_id = null, $profile_id = null) {
        if (count($module_id)>0 && count($profile_id)>0) {
            $this->db->where('module_id', $module_id);
            $this->db->where('profile_id', $profile_id);
            $this->db->update('hpl_module_profile_access', $data);
        } else {
            $this->db->insert('hpl_module_profile_access', $data);
        }
    }
}
