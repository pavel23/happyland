<?php
$start_date = date("d-m-Y");
$finish_date = date("d-m-Y", strtotime("$start_date +3 month"));
?>

<div class="row">
    <div class="col-lg-12">
        <div class="box dark">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>usuario</h5>                
            </header>
            <div id="div-5" class="accordion-body collapse in body">                        
                <?php echo form_open(site_url('User/maintenanceUser/' . (!$is_new ? $dbr_user->id : '')), array('class' => 'form-horizontal')); ?>
                <div class="form-group">
                    <?php echo form_label('DNI', 'formuser_num_doc', array('class' => 'control-label col-lg-4')) ?>
                    <div class="col-lg-4">                        
                        <?php echo form_input(array('name' => 'formuser[num_doc]', 'id' => 'formuser_num_doc', 'type' => 'text', 'placeholder' => 'DNI', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? '' : $dbr_user->num_doc)) ?>       
                        <?php echo form_error('formuser[num_doc]') ?>
                    </div>
                </div>
                <div class="form-group">
                    <?php echo form_label('Apellido Paterno', 'formuser_last_name', array('class' => 'control-label col-lg-4')) ?>
                    <div class="col-lg-4">
                        <?php echo form_input(array('name' => 'formuser[last_name]', 'id' => 'formuser_last_name', 'type' => 'text', 'placeholder' => 'Apellido Paterno', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? '' : $dbr_user->last_name)) ?>       
                        <?php echo form_error('formuser[last_name]') ?>
                    </div>
                </div>
                <div class="form-group">
                    <?php echo form_label('Apellido Materno', 'formuser_second_last_name', array('class' => 'control-label col-lg-4')) ?>
                    <div class="col-lg-4">
                        <?php echo form_input(array('name' => 'formuser[second_last_name]', 'id' => 'formuser_second_last_name', 'type' => 'text', 'placeholder' => 'Apellido Materno', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? '' : $dbr_user->second_last_name)) ?>
                        <?php echo form_error('formuser[second_last_name]') ?>
                    </div>
                </div>
                <div class="form-group">
                    <?php echo form_label('Nombres', 'formuser_first_name', array('class' => 'control-label col-lg-4')) ?>
                    <div class="col-lg-4">
                        <?php echo form_input(array('name' => 'formuser[first_name]', 'id' => 'formuser_first_name', 'type' => 'text', 'placeholder' => 'Nombres', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? '' : $dbr_user->first_name)) ?>
                        <?php echo form_error('formuser[first_name]') ?>
                    </div>
                </div>
                <div class="form-group">
                    <?php echo form_label('Correo', 'formuser_email_address', array('class' => 'control-label col-lg-4')) ?>
                    <div class="col-lg-4">
                        <?php echo form_input(array('name' => 'formuser[email_address]', 'id' => 'formuser_email_address', 'type' => 'text', 'placeholder' => 'Email', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? '' : $dbr_user->email_address)) ?>
                        <?php echo form_error('formuser[email_address]') ?>
                    </div>     
                </div>

                <div class="row form-group">
                    <?php echo form_label('Control sobre Los Locales', 'formuser_subsidiaries_id', array('class' => 'control-label col-lg-4')) ?>
                    <div class="col-lg-4">
                        <?php echo form_dropdown('formuser[subsidiaries_id]', $dbr_subsidiaries, array(), 'class="form-control autotab"') ?>
                    </div>
                </div>
                <div class="row form-group">
                    <?php echo form_label('Perfil de Acceso', 'formuser_profile_id', array('class' => 'control-label col-lg-4')) ?>
                    <div class="col-lg-4">
                        <?php echo form_dropdown('formuser[profile_id]', $dbr_profiles, array(), 'class="form-control autotab"') ?>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-lg-4">La Cuenta de Usuario</label>

                    <div class="col-lg-8">
                        <div class="checkbox">
                            <label>                                
                                <?php echo form_radio('formuser[opt_perfil]', 'F', ($is_new ? true : ($dbr_user->expiration_date ? true : false)), 'class="uniform"') ?> Tiene Fecha de expiración
                            </label>      
                        </div>
                        <div class="row col-lg-12">
                            <div class="col-lg-3">
                                <?php echo form_label('Desde', 'formuser_start_date') ?>
                                <div class="input-group input-append  date" id="dpMonths" data-date="102/2012" data-date-format="mm/yyyy" data-date-viewmode="years" data-date-minviewmode="months">
                                    <?php echo form_input(array('name' => 'formuser[start_date]', 'id' => 'formuser_start_date', 'type' => 'text', 'placeholder' => 'dd-mm-yyyy', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? $start_date : $dbr_user->start_date)) ?>
                                    <span class="input-group-addon add-on"><i class="icon-calendar"></i></span>                                    
                                </div>
                                <?php echo form_error('formuser[start_date]') ?>
                            </div>
                            <div class="col-lg-3">
                                <?php echo form_label('Hasta', 'formuser_expiration_date') ?>
                                <div class="input-group input-append  date" id="dpMonths" data-date="102/2012" data-date-format="mm/yyyy" data-date-viewmode="years" data-date-minviewmode="months">
                                    <?php echo form_input(array('name' => 'formuser[expiration_date]', 'id' => 'formuser_expiration_date', 'type' => 'text', 'placeholder' => 'dd-mm-yyyy', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? $finish_date : $dbr_user->expiration_date)) ?>
                                    <span class="input-group-addon add-on"><i class="icon-calendar"></i></span>
                                </div>
                                <?php echo form_error('formuser[expiration_date]') ?>
                            </div>
                        </div>
                        <div class="checkbox">
                            <label>                                
                                <?php echo form_radio('formuser[opt_perfil]', 'E', ($is_new ? false : ($dbr_user->expiration_date ? false : true)), 'class="uniform"') ?> Nunca Expira
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-actions no-margin-bottom">
                    <?php if (!$is_new): ?>
                        <?php echo form_hidden('formuser[user_id]', $dbr_user->id) ?>
                    <?php endif; ?>
                    <?php echo form_submit('Save', 'Guardar', 'class="btn btn-primary"'); ?>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</div>