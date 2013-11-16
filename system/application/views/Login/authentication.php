<div class="text-center">
    <img src="<?php echo base_url();?>/assets/images/logo-bg-white.jpg" alt="Intranet de Sociedad Happyland Perú" width="400">
</div>
<br />
<div class="tab-content">
    <div id="login" class="tab-pane active">
        <?php echo form_open(base_url() . 'login/authentication', array('class' => 'form-signin')); ?>
        <p class="text-muted text-center">
            Ingrese Usuario y Contraseña
        </p>

        <?php if ($this->session->flashdata('message')) : ?>
            <div class="alert alert-danger">
                <a class="close" data-dismiss="alert" href="#">×</a><?php echo $this->session->flashdata('message') ?>
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
    <div id="forgot" class="tab-pane">
        <form action="index.html" class="form-signin">
            <p class="text-muted text-center">Enter your valid e-mail</p>
            <input type="email" placeholder="mail@domain.com" required="required" class="form-control">
            <br>
            <button class="btn btn-lg btn-danger btn-block" type="submit">Recuperar Contraseña</button>
        </form>
    </div>
</div>
<div class="text-center">
    <ul class="list-inline">
        <li><a class="text-muted" href="#login" data-toggle="tab">Login</a></li>
        <li><a class="text-muted" href="#forgot" data-toggle="tab">Recordar Contraseña</a></li>
    </ul>
</div>