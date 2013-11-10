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
    public function getDailySaleById($daily_sale_id) {

        return $this->db->select('*')->from('hpl_daily_sales')
                        ->where('id', $daily_sale_id)->get()->row();
    }

    public function getDailySaleDetailBySaleId($daily_sale_id) {

        $this->db->select('dsd.id,IF(dsd.operator_id <> 0,(SELECT  full_name from hpl_user where id = dsd.operator_id ),tys.name ) as name, tys.is_other_sales, tys.id as type_of_sales_id,dsd.operator_id,dsd.cash_number,dsd.opening_cash,dsd.closing_cash,dsd.master_card_amount,dsd.visa_amount,dsd.retirement_amount_pen,dsd.retirement_amount_dol,dsd.total_calculated,dsd.total_x_format,dsd.difference_money,dsd.difference_values,dsd.num_transacctions,dsd.hour_by_cash')
                ->from('hpl_type_of_sales tys')
                ->join('hpl_daily_sales_detail dsd', 'tys.id=dsd.type_of_sales_id', 'left');
        $this->db->where('dsd.daily_sales_id', $daily_sale_id);
        $this->db->or_where('ISNULL(dsd.daily_sales_id )');

        $query = $this->db->get(); 
        return ($query->num_rows() > 0 ? $query->result() : null);
    }

    public function getDailyOtherSale() {
        return $this->db->select('id,name, is_other_sales')->from('hpl_type_of_sales')
                        ->where('status', Status::STATUS_ACTIVO)
                        ->where('is_deleted', 0)->get()->result();
    }

    public function saveDailySale($data, $daily_sale_id = null) {

        if ($daily_sale_id) {
            $this->db->where('id', $daily_sale_id);
            $this->db->update('hpl_daily_sales', $data);
        } else {
            $this->db->insert('hpl_daily_sales', $data);

            $daily_sale_id = $this->db->insert_id();
        }

        return $daily_sale_id;
    }

    public function saveDailySaleDetail($data, $daily_sale_detail_id = null) {
        if ($daily_sale_detail_id) {
            $this->db->where('id', $daily_sale_detail_id);
            $this->db->update('hpl_daily_sales_detail', $data);
        } else {
            $this->db->insert('hpl_daily_sales_detail', $data);
            $daily_sale_detail_id = $this->db->insert_id();
        }

        return $daily_sale_detail_id;
    }

}
