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

    public function getDailySaleById($daily_sale_id, $subsidiaries_id=null) {
        $subsidiaries_id    = ($subsidiaries_id ? $subsidiaries_id : $this->loggedin['subsidiaries']);
        return $this->db->select('id, status, date_sale,total_opening_cash, total_closing_cash, total_master_card, total_visa_card, total_web_payment ,total_retirement_pen, total_retirementl_dol, grand_total_calculated, grand_total_z_format, total_difference_money, total_diferrence_values, total_num_transactions, total_hours_by_cash')
                        ->from('hpl_daily_sales')
                        ->where('id', $daily_sale_id)
                        ->where('subsidiaries_id', $subsidiaries_id)->get()->row();
    }

    public function getDailySaleByDateSale($date_sale = null, $subsidiaries_id=null) {
        $subsidiaries_id    = ($subsidiaries_id ? $subsidiaries_id : $this->loggedin['subsidiaries']);
        $timestamp = strtotime(($date_sale ? $date_sale : date('Y-m-d')));
        return $this->db->select('id, date_sale')
                        ->from('hpl_daily_sales')
                        ->where('UNIX_TIMESTAMP(date_sale)', $timestamp)
                        ->where('subsidiaries_id', $subsidiaries_id)->get()->row();
    }

    public function getDailySaleCalendar($month, $year, $subsidiaries_id=null) {

        $sql = 'SELECT id, grand_total_z_format, status, date_sale 
                FROM hpl_daily_sales 
                WHERE MONTH(date_sale) = ? AND YEAR(date_sale) = ?
                AND subsidiaries_id = ?';
        $subsidiaries_id    = ($subsidiaries_id ? $subsidiaries_id : $this->loggedin['subsidiaries']);
        $query = $this->db->query($sql, array($month, $year, $subsidiaries_id));

        return ($query->num_rows() > 0 ? $query->result() : array());
    }

    public function getDailySaleDetailBySaleId($daily_sale_id) {
        $this->db->select('dsd.id,IF(dsd.operator_id <> 0,(SELECT  full_name from hpl_user where id = dsd.operator_id ),tys.name ) as name, tys.is_other_sales, tys.id as type_of_sales_id,dsd.operator_id,dsd.cash_number,dsd.opening_cash,dsd.closing_cash,dsd.master_card_amount,dsd.visa_amount, dsd.web_payment,dsd.retirement_amount_pen,dsd.retirement_amount_dol,dsd.total_calculated,dsd.total_x_format,dsd.difference_money,dsd.difference_values,dsd.num_transacctions,dsd.hour_by_cash');
        $this->db->from('hpl_type_of_sales tys');
        $this->db->join('hpl_daily_sales_detail dsd', 'tys.id=dsd.type_of_sales_id', 'left');
        $this->db->where('dsd.daily_sales_id', $daily_sale_id);
        $query = $this->db->get();
        return ($query->num_rows() > 0 ? $query->result() : null);
    }

    public function getDailyOtherSale() {
        $this->db->select('id as type_of_sales_id, name, is_other_sales, is_other_sales as other_sale');
        $this->db->from('hpl_type_of_sales');
        $this->db->where('status', Status::STATUS_ACTIVO);
        $this->db->where('is_deleted', 0);
        $this->db->where('is_other_sales', 1);
        return $this->db->get()->result();
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
    
    public function getDailySaleManagementList() {
        $this->db->select('dls.id, sbs.name AS subsidiary_name, dls.status, dls.date_sale,total_opening_cash, dls.total_closing_cash, dls.total_master_card, dls.total_visa_card, dls.total_web_payment, dls.total_retirement_pen, dls.total_retirementl_dol, dls.grand_total_calculated, dls.grand_total_z_format, dls.total_difference_money, dls.total_diferrence_values, dls.total_num_transactions, dls.total_hours_by_cash');
        $this->db->from('hpl_subsidiaries sbs');
        $this->db->join('hpl_daily_sales dls', 'sbs.id=dls.subsidiaries_id','inner');
        $this->db->where('sbs.is_princ_office',0);
        $this->db->order_by('sbs.name ASC');
        $this->db->order_by('dls.date_sale ASC');
        $query = $this->db->get();
        return $query->result();
    }

}
