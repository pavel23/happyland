<a href="<?php echo site_url('profile_controller/profile_maintenance');?>">Agregar Perfil</a> | 
<a href="<?php echo site_url('profile_controller/export_excel');?>">Exportar Excel</a>
<br />
<?php foreach ($profile_data as $profile) { ?>
    <?php echo $profile->id; ?> | 
    <?php echo $profile->name; ?> | 
    <?php echo $profile->status; ?> | 
    <?php echo $profile->is_deleted; ?> | 
    <?php echo $profile->created_at; ?> | 
    <a href="<?php echo site_url('profile_controller/profile_maintenance/' . $profile->id);?>">Modificar</a> | 
    <a href="<?php echo site_url('profile_controller/profile_delete/' . $profile->id);?>">Eliminar</a> | 
    <br />
<?php } ?>