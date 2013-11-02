<?php

/**
 * Description of profiles_dao
 *
 * @author jroque
 */
class UserDao extends CI_Model {

    //put your code here
    public function getAllUsers() {

        $this->db->select('u.id, u.num_doc, u.full_name, u.status, p.id as profile_id, p.name as profile_name, s.id as subsidiarie_id, s.name as subsidiarie_name');
        $this->db->from('hpl_user u');
        $this->db->join('hpl_profile p', 'u.profile_id = p.id');
        $this->db->join('hpl_subsidiaries s', 'u.subsidiaries_id = s.id');

        $query = $this->db->get();

        return $query->result();
    }

    public function getOperatorUsers() {
        $query = "SELECT full_name FROM hpl_user WHERE profile_id=3 LIMIT 10";
        $this->query = $this->db->query($query);
        return $this->query->result_array();
    }

    public function getUserById($userid) {
        $this->db->where('id', $userid);
        $query = $this->db->get('hpl_user');
        return ($query->num_rows() == 1 ? $query->row() : null);
    }

    public function get_user_id_by_name($full_name = '') {
        $query = "SELECT id FROM hpl_user WHERE full_name='" . $full_name . "'";
        $this->query = $this->db->query($query);
        return $this->query->result_array();
    }

    public function saveUser() {
        $user_credentials = $this->input->post('formuser');
        
        
        print_r($user_credentials);
        
        //$this->db->insert('hpl_user', $data);
    }

}
