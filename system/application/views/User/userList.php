<div class="row">
    <div class="col-lg-12">
        <div class="box">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Listado de Usuarios</h5>
                <div class="toolbar">
                    <a class="btn btn-primary btn-sm"><i class="icon-plus icon-white"></i></a>
                </div>
            </header>
            <div class="body">
                <table id="dataTable" class="table table-bordered table-condensed table-hover table-striped">
                    <thead>
                        <tr>
                            <th>Nombre y apeliidos</th>
                            <th>Local</th>
                            <th>Perfil</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($dbr_users as $dbr_user): ?>
                            <tr>
                                <td><?php echo $dbr_user->full_name; ?></td>
                                <td><?php echo $dbr_user->subsidiarie_name; ?></td>
                                <td><?php echo $dbr_user->profile_name; ?></td>
                                <td><?php echo Status::$statuses[$dbr_user->status] ; ?></td>
                                <td>                                  
                                    <a href="#" class="btn btn-primary btn-xs">
                                        <i class="icon-edit icon-white"></i>
                                        <span><strong>Editar</strong></span>       
                                    </a> 	

                                    <a href="#" class="btn btn-primary btn-xs">
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
