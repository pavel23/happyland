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

    private $loggedin = array();

    public function __construct() {
        $this->loggedin = $this->session->userdata('loggedin');
    }

    public function getDailySaleById($daily_sale_id) {

        return $this->db->select('id, status, date_sale,total_opening_cash, total_closing_cash, total_master_card, total_visa_card, total_web_payment ,total_retirement_pen, total_retirementl_dol, grand_total_calculated, grand_total_z_format, total_difference_money, total_diferrence_values, total_num_transactions, total_hours_by_cash')
                        ->from('hpl_daily_sales')
                        ->where('id', $daily_sale_id)
                        ->where('subsidiaries_id', $this->loggedin['subsidiaries'])->get()->row();
    }

    public function getDailySaleByDateSale($date_sale = null) {

        $timestamp = strtotime(($date_sale ? $date_sale : Date('Y-m-d')));

        return $this->db->select('id, date_sale')
                        ->from('hpl_daily_sales')
                        ->where('UNIX_TIMESTAMP(date_sale)', $timestamp)
                        ->where('subsidiaries_id', $this->loggedin['subsidiaries'])->get()->row();
    }

    public function getDailySaleCalendar($star, $end) {

        $sql = 'SELECT id, grand_total_calculated, status, date_sale 
                FROM hpl_daily_sales 
                WHERE date_sale >= FROM_UNIXTIME(?, "%Y-%m-%d") AND date_sale <= FROM_UNIXTIME(?, "%Y-%m-%d")
                AND subsidiaries_id = ?';

        $query = $this->db->query($sql, array($star, $end, $this->loggedin['subsidiaries']));

        return ($query->num_rows() > 0 ? $query->result() : array());
    }

    public function getDailySaleDetailBySaleId($daily_sale_id) {

        $this->db->select('dsd.id,IF(dsd.operator_id <> 0,(SELECT  full_name from hpl_user where id = dsd.operator_id ),tys.name ) as name, tys.is_other_sales, tys.id as type_of_sales_id,dsd.operator_id,dsd.cash_number,dsd.opening_cash,dsd.closing_cash,dsd.master_card_amount,dsd.visa_amount, dsd.web_payment,dsd.retirement_amount_pen,dsd.retirement_amount_dol,dsd.total_calculated,dsd.total_x_format,dsd.difference_money,dsd.difference_values,dsd.num_transacctions,dsd.hour_by_cash')
                ->from('hpl_type_of_sales tys')
                ->join('hpl_daily_sales_detail dsd', 'tys.id=dsd.type_of_sales_id', 'left');
        $this->db->where('dsd.daily_sales_id', $daily_sale_id);
        //$this->db->or_where('ISNULL(dsd.daily_sales_id )');

        $query = $this->db->get();
        return ($query->num_rows() > 0 ? $query->result() : null);
    }

    public function getDailyOtherSale() {
    return $this->db->select('id as type_of_sales_id, name, is_other_sales, is_other_sales as other_sale')->from('hpl_type_of_sales')
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
