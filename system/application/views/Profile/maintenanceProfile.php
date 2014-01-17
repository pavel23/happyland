<?php $this->load->view('Includes/Modules/module_title', array('module_title' => 'Módulo de Perfiles: Mantenimiento')); ?> 

<div class="panel panel-default">
    <div class="panel-body">
        <?php $profileid = (!$is_new ? $dbr_profile->id : ''); ?>
        <?php echo form_open(site_url('Profile/maintenanceProfile/' . $profileid), array('role' => 'form')); ?>
        <div class="form-group">
            <?php echo form_label('Nombre', 'formprofile_name') ?>
            <?php echo form_input(array('name' => 'formprofile[name]', 'id' => 'formprofile_name', 'type' => 'text', 'placeholder' => 'Nombre', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? '' : $dbr_profile->name)) ?>       
            <?php echo form_error('formprofile[name]') ?>
        </div>

        <div class="form-group">
            <?php echo form_label('Descripción', 'formprofile_description') ?>
            <?php echo form_textarea(array('name' => 'formprofile[description]', 'id' => 'formprofile_description', 'rows' => 3, 'placeholder' => 'Descripción', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? '' : $dbr_profile->description)) ?>
            <?php echo form_error('formprofile[description]') ?>
        </div>

        <div class="form-group">
            <?php echo form_label('Accesos') ?>
            <div class="checkbox">
                <label>                                
                    <?php echo form_radio('formprofile[access_permition]', 'total', ($is_new ? true : ($dbr_profile->access_permition == 'total' ? true : false)), 'id="checkbox_total" class="uniform"') ?> Acceso Total
                </label>      
            </div>
            <div class="checkbox">
                <label>                                
                    <?php echo form_radio('formprofile[access_permition]', 'readonly', ($is_new ? true : ($dbr_profile->access_permition == 'readonly' ? true : false)), 'id="checkbox_readonly" class="uniform"') ?> Acceso Sólo Lectura
                </label>      
            </div>
            <div class="checkbox">
                <label>                                
                    <?php echo form_radio('formprofile[access_permition]', 'custom', ($is_new ? true : ($dbr_profile->access_permition == 'custom' ? true : false)), 'id="checkbox_custom" class="uniform"') ?> Acceso Personalizado
                </label>      
            </div>
        </div>

        <div class="form-group">
            <?php echo form_label('Módulos') ?>
            <div>
                <?php echo form_dropdown('formprofile[modules][]', $a_parent_modules, $a_parent_modules_selected, 'style="width:350px;" class="chosen-select" multiple="multiple" data-placeholder="Ingrese o seleccione el módulo"') ?>
                <a id="set_permission_by_module" href="<?php echo site_url('Profile/getModalPermission/' . $profileid); ?>" class="btn btn-success">Definir Permisos por Módulo</a>    
            </div>
        </div>

        <div class="form-group">
            <?php echo form_label('Estado', 'formprofile_status') ?>
            <?php echo form_dropdown('formprofile[status]', $a_status, $dbr_profile ? $dbr_profile->status : null, 'class="form-control"') ?>
        </div>

        <?php if (!$is_new): ?>
            <?php echo form_hidden('formprofile[profile_id]', $dbr_profile->id) ?>
        <?php endif; ?>
        <?php echo form_submit('Save', 'Guardar', 'class="btn btn-default"'); ?>
        <?php echo form_close(); ?>
    </div>
</div>