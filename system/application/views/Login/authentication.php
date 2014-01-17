<?php
$is_login = $is_login;
if ($this->session->flashdata('message_recovering')) {
    $is_login = false;
}

?>
<div class="text-center">
    <img src="<?php echo base_url(); ?>/assets/img/logo-bg-white.jpg" alt="Intranet de Sociedad Happyland Perú" width="400">
</div>
<br />
<div class="tab-content">
    <div id="login" class="tab-pane <?php echo ($is_login ? 'active' : ''); ?>">
        <?php echo form_open(base_url() . 'login/authentication', array('class' => 'form-signin', 'role' => 'form')); ?>
        <p class="text-muted text-center">
            Ingrese Usuario y Contraseña
        </p>

        <?php if ($this->session->flashdata('message')) : ?>
            <div class="alert alert-danger">
                <a class="close" data-dismiss="alert" href="#">×</a><?php echo $this->session->flashdata('message') ?>
            </div>
        <?php endif; ?>
        <?php if ($this->session->flashdata('message_success')) : ?>
            <div class="alert alert-success">
                <a class="close" data-dismiss="alert" href="#">×</a><?php echo $this->session->flashdata('message_success') ?>
            </div>
        <?php endif; ?>
        <div class="form-group">
            <?php echo form_input(array('name' => 'formLogin[dni]', 'id' => 'formLogin_dni', 'type' => 'text', 'placeholder' => 'DNI', 'autofocus' => 'autofocus', 'class' => 'form-control')) ?>       
            <?php echo form_error('formLogin[dni]') ?>
        </div>
        <div class="form-group">
            <?php echo form_input(array('name' => 'formLogin[password]', 'id' => 'formLogin_password', 'type' => 'password', 'placeholder' => 'Contraseña', 'autofocus' => 'autofocus', 'class' => 'form-control')) ?>
            <?php echo form_error('formLogin[password]') ?>
        </div>
        <?php echo form_submit('login', 'Login', 'class="btn btn-lg btn-primary btn-block"'); ?>
        <?php echo form_hidden('formLogin[token]', $token) ?>
        <?php echo form_close(); ?>
    </div>
    <div id="forgot" class="tab-pane <?php echo (!$is_login ? 'active' : ''); ?>">
        <?php echo form_open(site_url('Login/recovering'), array('class' => 'form-signin form-recover')); ?>
        <p class="text-muted text-center">Recuperar Contraseña</p>
        <?php if ($this->session->flashdata('message_recovering')) : ?>
            <div class="alert alert-danger">
                <a class="close" data-dismiss="alert" href="#">×</a><?php echo $this->session->flashdata('message_recovering') ?>
            </div>
        <?php endif; ?>
        <div class="form-group">
            <?php echo form_input(array('name' => 'form_recover[dni]', 'id' => 'form_recover_dni', 'value' => set_value('form_recover[dni]'), 'type' => 'text', 'placeholder' => 'Ingresa DNI', 'autofocus' => 'autofocus', 'class' => 'form-control', 'data-url_verify_user' => site_url('Login/verifyUser'))) ?>       
            <?php echo form_error('form_recover[dni]') ?>
        </div>            
        <div class="view-recover">
            <div class="form-group">
                <label id="form_recover_secret_question" class=" col-lg-12">Respuesta Secreta : ¿Mi primier nombre?</label>
            </div>            
            <div class="form-group">
                <?php echo form_input(array('name' => 'form_recover[secret_answer]', 'id' => 'form_recover_secret_answer', 'type' => 'text', 'value' => set_value('form_recover[secret_answer]'), 'placeholder' => 'Respuesta a la Pregunta Secreta', 'autofocus' => 'autofocus', 'class' => 'form-control')) ?>       
                <?php echo form_error('form_recover[secret_answer]') ?>
            </div>
            <div class="form-group">
                <?php echo form_input(array('name' => 'form_recover[new_password]', 'id' => 'form_recover_new_password', 'type' => 'password', 'value' => set_value('form_recover[new_password]'), 'placeholder' => 'Nueva Contraseña', 'autofocus' => 'autofocus', 'class' => 'form-control')) ?>       
                <?php echo form_error('form_recover[new_password]') ?>
            </div>
            <div class="form-group">
                <?php echo form_input(array('name' => 'form_recover[repeat_new_password]', 'id' => 'form_recover_repeat_new_password', 'value' => set_value('form_recover[repeat_new_password]'), 'type' => 'password', 'placeholder' => 'Repetir Nueva Contraseña', 'autofocus' => 'autofocus', 'class' => 'form-control')) ?>       
                <?php echo form_error('form_recover[repeat_new_password]') ?>
            </div>
        </div>
        <button class="btn btn-lg btn-danger btn-block" type="submit">Recuperar Contraseña</button>
        <?php echo form_close(); ?>
    </div>
</div>
<div class="text-center">
    <ul class="list-inline">
        <li><a class="text-muted" href="#login" data-toggle="tab">Login</a></li>
        <li><a class="text-muted" href="#forgot" data-toggle="tab">Recordar Contraseña</a></li>
    </ul>
</div>