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
class User_dao extends CI_Model {

    //put your code here
    public function get_all_users($params = array()) {
        $query = "SELECT * FROM hpl_user";
        $this->query = $this->db->query($query);
        return $this->query->result();
    }

    public function get_operator_users() {
        $query = "SELECT full_name FROM hpl_user WHERE profile_id=3 LIMIT 10";
        $this->query = $this->db->query($query);
        return $this->query->result_array();
    }

    public function get_user_id_by_name($full_name='') {
        $query = "SELECT id FROM hpl_user WHERE full_name='" . $full_name . "'";
        $this->query = $this->db->query($query);
        return $this->query->result_array();
    }
}
