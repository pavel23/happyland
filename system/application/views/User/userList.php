<?php $this->load->view('Includes/Modules/module_title', array('module_title' => 'Módulo de Usuarios: Listado')); ?> 
<div class="btn-toolbar">
    <div class="col-sm-10">
    </div>
    <div class="col-sm-2">
        <a href="<?php echo site_url('User/maintenanceUser'); ?>" class="btn btn-info">
            <span class="glyphicon glyphicon-plus"></span> Nuevo Usuario
        </a>
    </div>
</div>
<?php if ($this->session->flashdata('message')) : ?>
    <div class="alert alert-success">
        <a class="close" data-dismiss="alert" href="#">×</a><?php echo $this->session->flashdata('message') ?>
    </div>
<?php endif; ?>
<div class="container">
    <input type="hidden" id="url-load-data" value="<?php echo site_url('User/getDataTableList'); ?>">
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