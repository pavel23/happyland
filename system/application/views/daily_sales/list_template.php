<div class="row">
    <div class="col-lg-12">
        <div class="box dark">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Listado de Ventas Diarias</h5>                
            </header>
            <div id="div-5" class="accordion-body collapse in body">
                <input type="hidden" name="url_full_calendar" id="url_full_calendar" value="<?php echo site_url('DailySales//getDailySaleCalendar') ?>">                
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
                <div id="calendar"></div>                
            </div>
        </div>
    </div>
</div>



