<div id="optionalTable" class="body collapse in">
    <?php echo form_open(site_url('Profile/saveModalPermission'), array('id' => 'formpermission', 'name' => 'formpermission', 'class' => 'form-horizontal')); ?>
    <?php echo form_hidden('profile_id', $profile_id);?>
    <table  class="table table-bordered responsive-table">
        <thead>
            <tr>
                <th colspan="2" rowspan="2">Módulo</th>
                <th colspan="3"><div align="center">Acceso</div></th>
            </tr>
            <tr>
                <th><div align="center"><span class="glyphicon glyphicon-search"></span> Lectura</div></th>
                <th><div align="center"><span class="glyphicon-edit"></span> Escritura</div></th>
                <th><div align="center"><span class="glyphicon-download-alt"></span>Descarga</div></th>
            </tr>
        </thead>
        <tbody>
        <?php foreach ($a_permission_modules as $module_id => $a_modules) { ?>
            <tr>
                <td colspan="2"><strong><?php echo $a_modules['name']; ?></strong><?php echo form_hidden('a_module_id[]', $module_id);?></td>
                <td><div align="center"><?php echo form_checkbox('read[' . $module_id . ']', '1', ($a_modules['read'] ? TRUE : FALSE), 'class="parent_read"'); ?></div></td>
                <td><div align="center"><?php echo form_checkbox('write[' . $module_id . ']', '1', ($a_modules['write'] ? TRUE : FALSE)); ?></div></td>
                <td><div align="center"><?php echo form_checkbox('download[' . $module_id . ']', '1', ($a_modules['download'] ? TRUE : FALSE)); ?></div></td>
            </tr>
            <?php $count_sub_mod=1;?>
            <?php foreach ($a_modules['children'] as $children_module_id => $a_children_modules) { ?>
            <tr>
                <td><?php echo $count_sub_mod;?></td>
                <td><?php echo $a_children_modules['name']; ?><?php echo form_hidden('a_sub_module_id[' . $module_id . '][]', $a_children_modules['id'], 'class="child_read" parent_module_id="'.$module_id.'"');?></td>
                <td><div align="center"><?php echo form_checkbox('read_children['.$module_id.'][' . $a_children_modules['id'] . ']', '1', ($a_children_modules['read'] ? TRUE : FALSE)); ?></div></td>
                <td><div align="center"><?php echo form_checkbox('write_children['.$module_id.'][' . $a_children_modules['id'] . ']', '1', ($a_children_modules['write'] ? TRUE : FALSE)); ?></div></td>
                <td><div align="center"><?php echo form_checkbox('download_children['.$module_id.'][' . $a_children_modules['id'] . ']', '1', ($a_children_modules['download'] ? TRUE : FALSE)); ?></div></td>
            </tr>
            <?php $count_sub_mod++; ?>
            <?php } ?>
        <?php } ?>
        </tbody>
    </table>
    <?php echo form_close(); ?>
</div>