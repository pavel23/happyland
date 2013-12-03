 <div class="row">
    <div class="col-lg-12">
        <div class="box">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Listado de Presupuesto</h5>
                <div class="toolbar">
                    <a href="<?php echo site_url('DailySales/maintenanceBudget'); ?>" class="btn btn-primary btn-sm"><i class="icon-plus icon-white"></i></a>
                </div>
            </header>
            <div class="body">
                <?php if ($this->session->flashdata('message')) : ?>
                    <div class="alert alert-success">
                        <a class="close" data-dismiss="alert" href="#">×</a><?php echo $this->session->flashdata('message') ?>
                    </div>
                <?php endif; ?>
                <input type="hidden" id="url-load-data" value="<?php echo site_url('DailySales/getDataTableList');?>">
                <input type="hidden" id="url-image-btn" value="<?php echo base_url(). 'assets/images/details_open.png';?>">
                <table id="dataTable" class="table table-bordered table-condensed table-hover table-striped">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Nombre Local</th>
                            <th>Mes</th>
                            <th><div align="center">Monto (S/.)</div></th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                </table>                
            </div>
        </div>
    </div>
</div>
