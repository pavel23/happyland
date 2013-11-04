<?php

/**
 * Description of profiles_dao
 *
 * @author jroque
 */
class StatusDao extends CI_Model {
    
    public function getProfileStatus() {
        $a_profile_status = array();
        $a_profile_status['act'] = 'Activo';
        $a_profile_status['ina'] = 'Inactivo';
        return $a_profile_status;
    }

    public function getUserStatus() {
        $a_user_status = array();
        $a_user_status['act'] = 'Activo';
        $a_user_status['ina'] = 'Inactivo';
        return $a_user_status;
    }
    
}