<div class="row">
    <div class="col-lg-12">
        <?php if ($this->session->flashdata('message')) : ?>
            <div class="alert alert-success">
                <a class="close" data-dismiss="alert" href="#">×</a><?php echo $this->session->flashdata('message') ?>
            </div>
        <?php endif; ?> 
    </div>
    <div class="col-lg-12">
        <div class="box success">
            <header>
                <h5>Estas viendo información de:</h5>
                <?php echo form_dropdown('list_subsidiaries_id', $a_subsidiaries, '', 'id="list_subsidiaries_id" class="chosen-select form-control autotab"'); ?>
            </header>
        </div>
    </div>

    <div class="col-lg-8">
        <div class="box inverse">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Venta Diaria Real vs Valor Presupuestado (Acumulado)</h5>
            </header>
            <div class="body">
                <div id="dayliSaleBudget"></div>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div class="box inverse">

            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Datos x Mes</h5>
            </header>
            <div class="body">
                <div id="gauge_chart"></div>
            </div>
        </div>
    </div>
    <input type="hidden" id="data-chart-url" value="<?php echo site_url('Dashboard/DayliSalesBarChart'); ?>">
</div>