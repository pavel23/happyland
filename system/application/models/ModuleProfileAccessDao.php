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
    
    public function getModulesByProfile($profile_id=null) {
        if (intval($profile_id)==0) {
            return FALSE;
        }
        $this->db->select('mpa.module_id, mdl.name, mdl.description, mdl.parent_id, mdl.module_name, mdl.module_action, mpa.profile_id, mpa.read, mpa.write, mpa.download');
        $this->db->from('hpl_module_profile_access mpa');
        $this->db->join('hpl_module mdl', 'mpa.module_id=mdl.id', 'inner');
        $this->db->where('mpa.profile_id', $profile_id);
        $this->db->where('mdl.show_menu', 1);
        $this->db->order_by('mdl.position_order', 1);
        $query  = $this->db->get();
        $dbl_modules_by_profile = $query->result();

        $a_module_access    = array();
        if(!$dbl_modules_by_profile) {
            return $a_module_access;
        }

        foreach($dbl_modules_by_profile as $dbr_module) {
            if(strlen(trim($dbr_module->module_name))>0){
                $a_module_access['module_permission'][$dbr_module->module_name][$dbr_module->module_action][$dbr_module->module_id]['read']     = $dbr_module->read;
                $a_module_access['module_permission'][$dbr_module->module_name][$dbr_module->module_action][$dbr_module->module_id]['write']    = $dbr_module->write;
                $a_module_access['module_permission'][$dbr_module->module_name][$dbr_module->module_action][$dbr_module->module_id]['download'] = $dbr_module->download;
            }
            if(!$dbr_module->parent_id) {
                $a_module_access['menu_permission'][$dbr_module->module_id]['name']                    = $dbr_module->name;
                $a_module_access['menu_permission'][$dbr_module->module_id]['description']             = $dbr_module->description;
                $a_module_access['menu_permission'][$dbr_module->module_id]['url']                     = $dbr_module->module_name. '/' . $dbr_module->module_action;
                $a_module_access['menu_permission'][$dbr_module->module_id]['read']                    = $dbr_module->read;
                $a_module_access['menu_permission'][$dbr_module->module_id]['write']                   = $dbr_module->write;
                $a_module_access['menu_permission'][$dbr_module->module_id]['download']                = $dbr_module->download;
            } else {
                $a_module_access['menu_permission'][$dbr_module->parent_id]['child'][$dbr_module->module_id]['name']           = $dbr_module->name;
                $a_module_access['menu_permission'][$dbr_module->parent_id]['child'][$dbr_module->module_id]['description']    = $dbr_module->description;
                $a_module_access['menu_permission'][$dbr_module->parent_id]['child'][$dbr_module->module_id]['url']            = $dbr_module->module_name. '/' . $dbr_module->module_action;
                $a_module_access['menu_permission'][$dbr_module->parent_id]['child'][$dbr_module->module_id]['read']           = $dbr_module->read;
                $a_module_access['menu_permission'][$dbr_module->parent_id]['child'][$dbr_module->module_id]['write']          = $dbr_module->write;
                $a_module_access['menu_permission'][$dbr_module->parent_id]['child'][$dbr_module->module_id]['download']       = $dbr_module->download;
            }
        }
        return $a_module_access;
    }
}
