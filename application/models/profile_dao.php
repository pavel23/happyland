<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of profiles_dao
 *
 * @author jroque
 */
class Profile_dao extends CI_Model {
    //put your code here
    public function get_all_profiles($params=array())
    {
        $query = "SELECT * FROM hpl_profile";
        $this->query = $this->db->query($query);
        return $this->query->result();
    }
}
