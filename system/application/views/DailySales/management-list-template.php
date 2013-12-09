 <div class="row">
    <div class="col-lg-12">
        <div class="box">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Listado de Venta Diaria - Control Gestión</h5>
                <a href="<?php echo site_url('DailySales/exportExcel'); ?>" id="btn-save-budget" class="btn btn-success" title="">Exportar Excel</a>
            </header>
            <div class="body">
                <?php if ($this->session->flashdata('message')) : ?>
                    <div class="alert alert-success">
                        <a class="close" data-dismiss="alert" href="#">×</a><?php echo $this->session->flashdata('message') ?>
                    </div>
                <?php endif; ?>
                <input type="hidden" id="url-load-data" value="<?php echo site_url('DailySales/getManagementListData');?>">
                <table id="dataTable" class="table table-bordered table-condensed table-hover table-striped table-responsive table-custom-happyland">
                    <thead>
                        <tr>
                            <th>Nombre Local</th>
                            <th>Fec. Venta</th>
                            <th>Total Apertura Caja</th>
                            <th>Total cierre Caja</th>
                            <th>Total Master Card</th>
                            <th>Total Visa</th>
                            <th>Total Pago Web</th>
                            <th>Total Venta Efec. (S/.)</th>
                            <th>Total Venta Efec. ($.)</th>
                            <th>Total Efectivo</th>
                            <th>Total Z (GS)</th>
                            <th>Total Dif. Dinero</th>
                            <th>Total Dif. Valores</th>
                            <th>Total Num. Transac</th>
                            <th>Total Horas/Caja</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                </table>                
            </div>
        </div>
    </div>
</div>