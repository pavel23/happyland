 <div class="row">
    <div class="col-lg-12">
        <div class="box">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Listado de Perfiles</h5>
                <div class="toolbar">
                    <a href="<?php echo site_url('Profile/maintenanceProfile'); ?>" class="btn btn-primary btn-sm"><i class="icon-plus icon-white"></i></a>
                    <a href="<?php echo site_url('Profile/exportExcel');  ?>" class="btn btn-primary btn-sm"><i class="icon-download-alt icon-white"></i></a>
                </div>
            </header>
            <div class="body">
                <table id="dataTable" class="table table-bordered table-condensed table-hover table-striped">
                    <thead>
                        <tr>
                            <th width="80">ID</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th width="150">Estado</th>
                            <th width="150">Acciones</th>
                        </tr>
                    </thead>
                    
                </table>
            </div>
        </div>
    </div>
 </div>