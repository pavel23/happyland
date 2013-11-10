<div class="row">
    <div class="col-lg-12">
        <div class="box dark">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Perfil</h5>                
            </header>
            <div id="div-5" class="accordion-body collapse in body">                        
                <?php $profileid = (!$is_new ? $dbr_profile->id : '');?>
                <?php echo form_open(site_url('Profile/maintenanceProfile/' . $profileid), array('class' => 'form-horizontal')); ?>

                <div class="form-group">
                    <?php echo form_label('Nombre', 'formprofile_name', array('class' => 'control-label col-lg-4')) ?>
                    <div class="col-lg-4">
                        <?php echo form_input(array('name' => 'formprofile[name]', 'id' => 'formprofile_name', 'type' => 'text', 'placeholder' => 'Nombre', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? '' : $dbr_profile->name)) ?>       
                        <?php echo form_error('formprofile[name]') ?>
                    </div>
                </div>
                <div class="form-group">
                    <?php echo form_label('Descripción', 'formprofile_description', array('class' => 'control-label col-lg-4')) ?>
                    <div class="col-lg-4">
                        <?php echo form_textarea(array('name' => 'formprofile[description]', 'id' => 'formprofile_description', 'rows' => 4, 'placeholder' => 'Descripción', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? '' : $dbr_profile->description)) ?>
                        <?php echo form_error('formprofile[description]') ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Accesos</label>
                    <div class="col-lg-8">
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
                </div>
                <div class="form-group" id="module_profile_access_container">
                    <label class="control-label col-lg-4">Módulos</label>
                    <div class="col-lg-8">
                        <?php echo form_dropdown('formprofile[modules][]', $a_parent_modules, $a_parent_modules_selected, 'style="width:350px;" class="chosen-select" multiple="multiple" data-placeholder="Ingrese o seleccione el módulo"') ?>
                        <a id="set_permission_by_module" href="<?php echo site_url('Profile/getModalPermission/'.$profileid);?>" class="btn btn-success btn-sm btn-grad">Definir Permisos por Módulo</a>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-lg-4">Estado</label>
                    <div class="col-lg-4">
                        <?php echo form_dropdown('formprofile[status]', $a_status, $dbr_profile ? $dbr_profile->status : null, 'class="form-control autotab"') ?>
                    </div>
                </div>

                <div class="form-actions no-margin-bottom">
                    <?php if (!$is_new): ?>
                        <?php echo form_hidden('formprofile[profile_id]', $dbr_profile->id) ?>
                    <?php endif; ?>
                    <?php echo form_submit('Save', 'Guardar', 'class="btn btn-primary"'); ?>
                </div>
                <?php echo form_close(); ?>

            </div>
        </div>
    </div>
</div>