<ul id="menu" class="collapse">
    <li class="nav-header">Menu</li>
    <li class="nav-divider"></li>
    <?php 
        $a_session              = $this->session->userdata('loggedin');
        $a_module_permission    = $a_session['module_permission'];
    ?>
    <?php foreach($a_module_permission as $module_id=>$a_module){?>
        <li class="panel ">
            <a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle" data-target="#module-<?php echo $module_id;?>-nav">
                <i class="icon-dashboard"></i><?php echo $a_module['name'];?>
                <span class="pull-right">
                    <i class="icon-angle-left"></i>
                </span>
            </a>
            <?php if(array_key_exists('child', $a_module)){?>
                <ul class="collapse" id="module-<?php echo $module_id;?>-nav">
                <?php foreach($a_module['child'] as $a_child){?>
                    <li class=""><a href="dashboard.html"><i class="icon-angle-right"></i><?php echo $a_child['name'];?></a></li>
                <?php }?>
                </ul>
            <?php }?>
        </li>
    <?php }?>
    
    <li><a href="grid.html"><i class="icon-columns"></i> Grid</a></li>
    <li><a href="blank.html"><i class="icon-check-empty"></i> Blank Page</a></li> 
    <li class="nav-divider"></li>
    <li><a href="login.html"><i class="icon-signin"></i> Login Page</a></li>
</ul>