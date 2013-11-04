<?php

/**
 * Description of profiles_dao
 *
 * @author jroque
 */
class ModuleDao extends CI_Model {
    public function __construct() {
        $this->load->model('StatusDao');
    }
    public function getParentModules() {
        $this->db->where('parent_id', NULL);
        $this->db->where('is_deleted', 0);
        $this->db->where('status', $this->StatusDao->getSTATUS_ACTIVE());
        $this->db->order_by('position_order', 'ASC');
        $query = $this->db->get('hpl_module');
        return $query->result();
    }
}
