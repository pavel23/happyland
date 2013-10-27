<?php

/**
 * Description of Login_Dao
 *
 * @author Pavel
 */
class LoginDao extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function loginUser($username) {
        $this->db->where('num_doc', $username);
        $query = $this->db->get('hpl_user');

        return ($query->num_rows() == 1 ? $query->row() : false);
    }

}

?>
