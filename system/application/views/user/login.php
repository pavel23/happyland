<div class="text-center">
    <img src="assets/img/logo.png" alt="Metis Logo">
</div>
<div class="tab-content">
    <div id="login" class="tab-pane active">
        <form action="index.html" class="form-signin">
            <p class="text-muted text-center">
                Ingrese Usuario y Contraseña
            </p>
            <input type="text" placeholder="Username" class="form-control">
            <input type="password" placeholder="Password" class="form-control">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
        </form>
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
        <li><a class="text-muted" href="#forgot" data-toggle="tab">Forgot Password</a></li>
    </ul>
</div>