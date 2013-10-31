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
class DailySaleDao extends CI_Model {

    //put your code here
    public function getDailySaleOthers() {

        return $this->db->select('tys.id, tys.name, dsd.id, dsd.total_calculated, dsd.total_calculated, dsd.total_x_format')
                    ->from('hpl_type_of_sales tys')
                    ->join('hpl_daily_sales_detail dsd', 'tys.id=dsd.type_of_sales_id', 'left')->get()->result();
    }
}
