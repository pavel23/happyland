<?php

/**
 * Description of profiles_dao
 *
 * @author jroque
 */
class StatusDao extends CI_Model {

    private $STATUS_ACTIVE='act';
    private $STATUS_INACTIVE='ina';
    
    public function getProfileStatus() {
        $a_profile_status = array();
        $a_profile_status[$this->STATUS_ACTIVE] = 'Activo';
        $a_profile_status[$this->STATUS_INACTIVE] = 'Inactivo';
        return $a_profile_status;
    }


    public function getUserStatus() {
        $a_user_status = array();
        $a_user_status[$this->STATUS_ACTIVE] = 'Activo';
        $a_user_status[$this->STATUS_INACTIVE] = 'Inactivo';
        return $a_user_status;
    }
    
    public function getSTATUS_ACTIVE() {
        return $this->STATUS_ACTIVE;
    }
    public function getSTATUS_INACTIVE() {
        return $this->STATUS_INACTIVE;
    }
}