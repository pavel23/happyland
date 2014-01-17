<?php $this->load->view('Includes/Modules/list_subsidiaries', array('a_subsidiaries' => $a_subsidiaries)); ?> 

<div class="col-sm-12">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Venta Diaria</h3>
            <input type="hidden" name="url_full_calendar" id="url_full_calendar" value="<?php echo site_url('DailySales/getDailySaleCalendar') ?>">
        </div>
        <?php if ($this->session->flashdata('message_danger')) : ?>
            <div class="alert alert-danger">
                <a class="close" data-dismiss="alert" href="#">×</a><?php echo $this->session->flashdata('message_danger') ?>
            </div>
        <?php endif; ?>
        <?php if ($this->session->flashdata('message_success')) : ?>
            <div class="alert alert-success">
                <a class="close" data-dismiss="alert" href="#">×</a><?php echo $this->session->flashdata('message_success') ?>
            </div>
        <?php endif; ?>
        <div class="bs-docs-canvas">
            <div id="calendar"></div>
        </div>
    </div>
</div>