<?php

/**
 * Description of profiles_dao
 *
 * @author jroque
 */
class Profile_dao extends CI_Model {

    public function getAllProfiles() {
        $query = "SELECT id, name FROM hpl_profile";
        $this->query = $this->db->query($query);
        return $this->query->result();
    }

}
