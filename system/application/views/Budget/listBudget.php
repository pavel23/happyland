 <div class="row">
    <div class="col-lg-12">
        <div class="box">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Listado de Presupuesto</h5>
            </header>
            <div class="body">
                <?php if ($this->session->flashdata('message')) : ?>
                    <div class="alert alert-success">
                        <a class="close" data-dismiss="alert" href="#">×</a><?php echo $this->session->flashdata('message') ?>
                    </div>
                <?php endif; ?>
                <input type="hidden" id="url-load-data" value="<?php echo site_url('BudgetSales/getDataTableList');?>">
                <table id="dataTable" class="table table-bordered table-condensed table-hover table-striped">
                    <thead>
                        <tr>
                            <th>Nombre Local</th>
                            <th><div align="center">Ppto Acumulado <?php echo date('Y');?> (S/.)</div></th>
                            <th><div align="center">Ppto Acumulado <?php echo date('Y') - 1;?> (S/.)</div></th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                </table>                
            </div>
        </div>
    </div>
</div>
