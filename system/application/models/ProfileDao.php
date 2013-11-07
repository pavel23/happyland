<?php

/**
 * Description of profiles_dao
 *
 * @author jroque
 */
class ProfileDao extends CI_Model {

    public function getAllProfiles() {
        $this->db->where('is_deleted', 0);
        $query  = $this->db->get('hpl_profile');
        return ($query->num_rows() >0 ? $query->result() : null);
    }

    public function getProfileById($profile_id) {
        $this->db->where('id', $profile_id);
        $query = $this->db->get('hpl_profile');
        return ($query->num_rows() == 1 ? $query->row() : null);
    }
    
    public function existProfileId($profile_id) {
        $this->db->select('id');
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

}
