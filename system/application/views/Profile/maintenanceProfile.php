<div class="row">
    <div class="col-lg-12">
        <div class="box dark">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Perfil</h5>                
            </header>
            <div id="div-5" class="accordion-body collapse in body">                        
                <?php echo form_open(site_url('Profile/maintenanceProfile/' . (!$is_new ? $dbr_profile->id : '')), array('class' => 'form-horizontal')); ?>

                <div class="form-group">
                    <?php echo form_label('Nombre', 'formprofile_name', array('class' => 'control-label col-lg-4')) ?>
                    <div class="col-lg-4">
                        <?php echo form_input(array('name' => 'formprofile[name]', 'id' => 'formprofile_name', 'type' => 'text', 'placeholder' => 'Nombre', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? '' : $dbr_profile->name)) ?>       
                        <?php echo form_error('formprofile[name]') ?>
                    </div>
                </div>
                <div class="form-group">
                    <?php echo form_label('Descripión', 'formprofile_description', array('class' => 'control-label col-lg-4')) ?>
                    <div class="col-lg-4">
                        <?php echo form_textarea(array('name' => 'formprofile[description]', 'id' => 'formprofile_description', 'rows' => 4, 'placeholder' => 'Descripión', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? '' : $dbr_profile->description)) ?>
                        <?php echo form_error('formprofile[description]') ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Accesos</label>
                    <div class="col-lg-8">
                        <div class="checkbox">
                            <label>                                
                                <?php echo form_radio('formprofile[access_permition]', 'total', ($is_new ? true : ($dbr_profile->access_permition == 'total' ? true : false)), 'class="uniform"') ?> Acceso Total
                            </label>      
                        </div>
                        <div class="checkbox">
                            <label>                                
                                <?php echo form_radio('formprofile[access_permition]', 'readonly', ($is_new ? true : ($dbr_profile->access_permition == 'readonly' ? true : false)), 'class="uniform"') ?> Acceso Sólo Lectura
                            </label>      
                        </div>
                        <div class="checkbox">
                            <label>                                
                                <?php echo form_radio('formprofile[access_permition]', 'custom', ($is_new ? true : ($dbr_profile->access_permition == 'custom' ? true : false)), 'class="uniform"') ?> Acceso Personalizado
                            </label>      
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-4">Módulos</label>
                    <div class="col-lg-8">
                        <?php echo form_dropdown('formprofile[modules][]', $a_modules, array(), 'style="width:350px;" class="chosen-select" multiple="multiple" data-placeholder="Ingrese o seleccione el módulo"') ?>
                        <a id="set_permission_by_module">Definir permisos por módulos</a>
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