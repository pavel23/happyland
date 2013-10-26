<div class="text-center">
    <img src="assets/img/logo.png" alt="Metis Logo">
</div>
<div class="tab-content">
    <div id="login" class="tab-pane active">
        <?php echo form_open('/', array('class' => 'form-signin')); ?>
        <p class="text-muted text-center">
            Ingrese Usuario y Contraseña
        </p>
        
        <?php echo form_input(array('name' => 'formLogin[username]', 'id' => 'formLogin_username', 'type' => 'text', 'placeholder' => 'Usuario', 'autofocus' => 'autofocus', 'class' => 'form-control')) ?>       
        <?php echo form_input(array('name' => 'formLogin[password]', 'id' => 'formLogin_password', 'type' => 'password', 'placeholder' => 'Contraseña', 'autofocus' => 'autofocus', 'class' => 'form-control')) ?>
        <?php echo form_submit('login', 'Login', 'class="btn btn-lg btn-primary btn-block"'); ?>
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