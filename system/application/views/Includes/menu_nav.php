<div role="navigation" class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <?php
        $a_session = $this->session->userdata('loggedin');
        $a_module_permission = json_decode($this->encrypt->decode($a_session['menu_permission']));
        ?>
        <div class="navbar-header">
            <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
                <span class="sr-only">Panel de Navegación</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="#" ><img src="<?php echo base_url(); ?>assets/img/small-logo.png"></a>
        </div>
        <div class="navbar-collapse collapse">
            <?php if (count($a_module_permission) > 0) { ?>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="<?php echo site_url('Dashboard/index'); ?>">Principal</a></li>
                    <?php foreach ($a_module_permission as $module_id => $a_module) { ?>
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#"><?php echo $a_module->name; ?><b class="caret"></b></a>
                            <?php if ($a_module->child) { ?>
                                <ul class="dropdown-menu">
                                    <?php foreach ($a_module->child as $a_child) { ?>
                                        <li><a href="<?php echo site_url($a_child->url); ?>"><?php echo $a_child->name; ?></a></li>
                                    <?php } ?>
                                </ul>
                            <?php } ?>
                        </li>
                    <?php } ?>
                </ul>
            <?php } ?>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>Bienvenido(a):</b> <?php echo $a_session['name'];?><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Mis datos</a></li>
                        <li><a href="<?php echo site_url('Login/recovering'); ?>">Cambiar Contraseña</a></li>
                        <li class="divider"></li>
                        <li><a href="<?php echo site_url('Login/logout'); ?>">Cerrar Sesión</a></li>
                    </ul>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>