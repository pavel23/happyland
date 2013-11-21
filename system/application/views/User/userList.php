<div class="row">
    <div class="col-lg-12">
        <div class="box">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Listado de Usuarios</h5>
                <div class="toolbar">
                    <a href="<?php echo site_url('User/maintenanceUser'); ?>" class="btn btn-primary btn-sm"><i class="icon-plus icon-white"></i></a>
                </div>
            </header>
            <div class="body">
                <?php if ($this->session->flashdata('message')) : ?>
                    <div class="alert alert-success">
                        <a class="close" data-dismiss="alert" href="#">×</a><?php echo $this->session->flashdata('message') ?>
                    </div>
                <?php endif; ?>
                <input type="hidden" id="url-load-data" value="<?php echo site_url('User/getDataTableList');?>">
                <table id="dataTable" class="table table-bordered table-condensed table-hover table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>DNI</th>
                            <th>Nombre y apeliidos</th>
                            <th>Local</th>
                            <th>Perfil</th>
                            <th><div align="center">Estado</div></th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                </table> 
            </div>
        </div>
    </div>
</div>
