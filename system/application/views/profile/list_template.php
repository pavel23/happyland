 <div class="row">
    <div class="col-lg-12">
        <div class="box">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Listado de Perfiles</h5>
                <div class="toolbar">
                    <a href="<?php echo site_url('profile_controller/profile_maintenance'); ?>" class="btn btn-primary btn-sm"><i class="icon-plus icon-white"></i></a>
                    <a href="<?php echo site_url('profile_controller/export_excel');  ?>" class="btn btn-primary btn-sm"><i class="icon-download-alt icon-white"></i></a>
                </div>
            </header>
            <div class="body">
                <table id="dataTable" class="table table-bordered table-condensed table-hover table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php foreach ($profile_data as $profile): ?>
                            <tr>
                                <td><?php echo $profile->id; ?></td>
                                <td><?php echo $profile->name; ?></td>
                                <td><?php echo $profile->description; ?></td>
                                <td><?php echo Status::$statuses[$profile->status]; ?></td>
                                <td>                                  
                                    <a href="<?php echo site_url('profile_controller/profile_maintenance/' . $profile->id); ?>" class="btn btn-primary btn-xs">
                                        <i class="icon-edit icon-white"></i>
                                        <span><strong>Editar</strong></span>       
                                    </a> 	

                                    <a href="<?php echo site_url('profile_controller/profile_delete/' . $profile->id); ?>" class="btn btn-primary btn-xs">
                                        <i class="icon-trash icon-white"></i>
                                        <span><strong>Eliminar</strong></span>        	
                                    </a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>                
            </div>
        </div>
    </div>
</div>
