<?php

/**
 * Description of profiles_dao
 *
 * @author jroque
 */
class ProfileDao extends CI_Model {

    public function getAllProfiles() {
        $query = "SELECT * FROM hpl_profile WHERE is_deleted=0";
        $this->query = $this->db->query($query);
        return $this->query->result();
    }
    
    public function getProfileById($profile_id) {
        $this->db->where('id', $profile_id);
        $query = $this->db->get('hpl_profile');
        return ($query->num_rows() == 1 ? $query->row() : null);
    }

}
