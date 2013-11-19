<nav class="navbar navbar-inverse navbar-static-top">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="topnav">
        <div class="btn-toolbar">
            <div class="btn-group">
                <a href="<?php echo site_url('Login/logout') ?>" data-toggle="tooltip" data-original-title="Logout" data-placement="bottom" class="btn btn-metis-1 btn-sm">
                    <i class="icon-off"></i>
                </a>
            </div>
        </div>
   </div>
    <?php 
        $a_session              = $this->session->userdata('loggedin');
        $a_module_permission    = json_decode($this->encrypt->decode($a_session['menu_permission']));       
        ?>
    <?php if(count($a_module_permission)>0){?>
    <!-- /.topnav -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <!-- .nav -->
        <ul class="nav navbar-nav">
            <li><a href="<?php echo site_url('Dashboard/index');?>">Dashboard</a></li>
            <?php foreach($a_module_permission as $module_id=>$a_module){?>
                <li class='dropdown '>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <?php echo $a_module->name;?><b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                    <?php if($a_module->child){?>
                        <?php foreach($a_module->child as $a_child){?>
                            <li><a href="<?php echo site_url($a_child->url);?>"><?php echo $a_child->name;?></a></li>
                        <?php }?>
                    <?php }?>
                    </ul>
                </li>            
            <?php }?>
        </ul>
        <!-- /.nav -->
    </div>
    <?php }?>
</nav>