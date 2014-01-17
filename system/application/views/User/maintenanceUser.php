<?php
$start_date = date('d-m-Y');
$finish_date = date('d-m-Y', strtotime($start_date . ' + 3 month'));
?>
<?php $this->load->view('Includes/Modules/module_title', array('module_title' => 'Módulo de Usuarios: Mantenimiento')); ?> 

<div class="panel panel-default">
    <div class="panel-body">
        <?php echo form_open(site_url('User/maintenanceUser/' . (!$is_new ? $dbr_user->id : '')), array('role' => 'form')); ?>
        <div class="form-group">
            <?php echo form_label('DNI', 'formuser_num_doc') ?>
            <?php echo form_input(array('name' => 'formuser[num_doc]', 'id' => 'formuser_num_doc', 'type' => 'text', 'placeholder' => 'DNI', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? '' : $dbr_user->num_doc)) ?>       
            <?php echo form_error('formuser[num_doc]') ?>
        </div>

        <div class="form-group">
            <?php echo form_label('Apellido Paterno', 'formuser_last_name') ?>
            <?php echo form_input(array('name' => 'formuser[last_name]', 'id' => 'formuser_last_name', 'type' => 'text', 'placeholder' => 'Apellido Paterno', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? '' : $dbr_user->last_name)) ?>       
            <?php echo form_error('formuser[last_name]') ?>
        </div>

        <div class="form-group">
            <?php echo form_label('Apellido Materno', 'formuser_second_last_name') ?>
            <?php echo form_input(array('name' => 'formuser[second_last_name]', 'id' => 'formuser_second_last_name', 'type' => 'text', 'placeholder' => 'Apellido Materno', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? '' : $dbr_user->second_last_name)) ?>
            <?php echo form_error('formuser[second_last_name]') ?>
        </div>

        <div class="form-group">
            <?php echo form_label('Nombres', 'formuser_first_name') ?>
            <?php echo form_input(array('name' => 'formuser[first_name]', 'id' => 'formuser_first_name', 'type' => 'text', 'placeholder' => 'Nombres', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? '' : $dbr_user->first_name)) ?>
            <?php echo form_error('formuser[first_name]') ?>
        </div>

        <div class="form-group">
            <?php echo form_label('Contraseña', 'formuser_password') ?>
            <?php echo form_password(array('name' => 'formuser[password]', 'id' => 'formuser_password', 'type' => 'text', 'placeholder' => 'Contraseña', 'autofocus' => 'autofocus', 'class' => 'form-control')) ?>
            <?php echo form_error('formuser[password]') ?>
        </div>

        <div class="form-group">
            <?php echo form_label('Confirmar Contraseña', 'formuser_password_confirm') ?>
            <?php echo form_password(array('name' => 'formuser[password_confirm]', 'id' => 'formuser_password_confirm', 'type' => 'text', 'placeholder' => 'Confirmar Contraseña', 'autofocus' => 'autofocus', 'class' => 'form-control')) ?>
            <?php echo form_error('formuser[password_confirm]') ?>
        </div>

        <div class="form-group">
            <?php echo form_label('Correo', 'formuser_email_address') ?>
            <?php echo form_input(array('name' => 'formuser[email_address]', 'id' => 'formuser_email_address', 'type' => 'text', 'placeholder' => 'Email', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? '' : $dbr_user->email_address)) ?>
            <?php echo form_error('formuser[email_address]') ?>
        </div>

        <div class="form-group">
            <?php echo form_label('Puede ver información del local:', 'formuser_subsidiaries_id') ?>
            <?php echo form_dropdown('formuser[subsidiaries_id]', $dbr_subsidiaries, array(), 'class="form-control"') ?>
        </div>

        <div class="form-group">
            <?php echo form_label('Perfil de Acceso', 'formuser_profile_id') ?>
            <?php echo form_dropdown('formuser[profile_id]', $dbr_profiles, $dbr_user ? $dbr_user->profile_id : null, 'class="form-control autotab"') ?>
        </div>

        <div class="form-group">
            <?php echo form_label('Estado', 'formprofile_status') ?>
            <?php echo form_dropdown('formprofile[status]', $a_status, $dbr_user ? $dbr_user->status : null, 'class="form-control"') ?>
        </div>

        <div class="form-group">
            <?php echo form_label('La Cuenta de Usuario', 'formuser_opt_perfil') ?><br/>
            <?php echo form_radio('formuser[opt_perfil]', 'F', ($is_new ? true : ($dbr_user->expiration_date ? true : false)), 'class="uniform"') ?> Tiene Fecha de expiración<br/>
            <?php echo form_label('Desde', 'formuser_start_date') ?>
            <div class="input-group input-append  date" id="dpStartDate" data-date="102/2012" data-date-format="dd/mm/yyyy" data-date-viewmode="years" data-date-minviewmode="months">
                <?php echo form_input(array('name' => 'formuser[start_date]', 'id' => 'formuser_start_date', 'type' => 'text', 'placeholder' => 'dd-mm-yyyy', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? $start_date : $dbr_user->start_date)) ?>
                <span class="input-group-addon add-on"><i class="icon-calendar"></i></span>
            </div>
            <?php echo form_error('formuser[start_date]') ?>

            <?php echo form_label('Hasta', 'formuser_expiration_date') ?>
            <div class="input-group input-append  date" id="dpExpirationDate" data-date="102/2012" data-date-format="dd/mm/yyyy" data-date-viewmode="years" data-date-minviewmode="months">
                <?php echo form_input(array('name' => 'formuser[expiration_date]', 'id' => 'formuser_expiration_date', 'type' => 'text', 'placeholder' => 'dd-mm-yyyy', 'autofocus' => 'autofocus', 'class' => 'form-control'), ($is_new ? $finish_date : $dbr_user->expiration_date)) ?>
                <span class="input-group-addon add-on"><i class="icon-calendar"></i></span>
            </div>
            <?php echo form_error('formuser[expiration_date][]') ?>
            <br />
            <?php echo form_radio('formuser[opt_perfil]', 'E', ($is_new ? false : ($dbr_user->expiration_date ? false : true)), 'class="uniform"') ?> Nunca Expira
        </div>

        <?php if (!$is_new): ?>
            <?php echo form_hidden('formuser[user_id]', $dbr_user->id) ?>
        <?php endif; ?>
        <?php echo form_submit('Save', 'Guardar', 'class="btn btn-default"'); ?>
        <?php echo form_close(); ?>
    </div>
</div>
