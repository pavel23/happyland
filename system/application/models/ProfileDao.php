<?php

/**
 * Description of profiles_dao
 *
 * @author jroque
 */
class ProfileDao extends CI_Model {

    public function getAllProfiles() {
        $this->db->where('is_deleted', 0);
        $this->db->where('status', Status::STATUS_ACTIVO);
        $query  = $this->db->get('hpl_profile');
        return ($query->num_rows() >0 ? $query->result() : null);
    }

    public function getProfileById($profile_id) {
        $this->db->where('id', $profile_id);
        $query = $this->db->get('hpl_profile');
        return ($query->num_rows() == 1 ? $query->row() : null);
    }
    
    public function existProfileId($profile_id) {
        $this->db->select('id, name');
        $this->db->where('id', $profile_id);
        $query = $this->db->get('hpl_profile');
        return ($query->num_rows() == 1 ? $query->row() : null);
    }
    
    public function saveProfile($data, $profile_id = null) {
        if ($profile_id) {
            $this->db->where('id', $profile_id);
            $this->db->update('hpl_profile', $data);
        } else {
            $this->db->insert('hpl_profile', $data);
        }
    }
    
    public function deleteProfile($profile_id = null) {
        if ($profile_id) {
            $data['is_deleted'] = 1;
            $this->db->where('id', $profile_id);
            $this->db->where('sys_block', 0);
            $this->db->update('hpl_profile', $data);
        }
    }

    public function getDropdownProfiles(){
        $dbl_profiles = $this->getAllProfiles();
        $a_profiles = array();
        foreach ($dbl_profiles as $dbr_profiles) {
            $a_profiles[$dbr_profiles->id]  = $dbr_profiles->name;
        }
        return $a_profiles;
    }

}
