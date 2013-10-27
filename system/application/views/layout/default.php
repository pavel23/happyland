<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title><?php echo $this->layout->title ?></title>
        <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/lib/bootstrap.min.css">
        <?php if ($this->layout->isLogin): ?>
            <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/login.css"/>
            <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/lib/magic.css"/>
        <?php else: ?>
            <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/main.css"/>
            <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/font/font-awesome.css"/>
        <?php endif; ?>

        <?php $this->layout->css(); ?>
    </head>
    <body>
        <?php if ($this->layout->isLogin): ?>
            <div class="container">
                <?php echo $content; ?>
            </div>
        <?php else: ?>

            <div id="wrap">
                <div id="top">
                    <?php $this->load->view("Includes/menu_nav"); ?> 
                    <?php $this->load->view("Includes/title"); ?> 
                </div>

                <div id="left">
                    <?php $this->load->view("Includes/menu"); ?> 
                </div>
                <div id="content">
                    <div class="outer">
                        <div class="inner">
                            <?php echo $content; ?>
                        </div>
                    </div>
                </div>
            </div>
            <?php $this->load->view("Includes/footer"); ?> 
        <?php endif; ?>

        <script src="<?php echo base_url(); ?>assets/js/lib/jquery.js"></script>
        <script src="<?php echo base_url(); ?>assets/js/lib/bootstrap.js"></script>

        <?php $this->layout->js(); ?>
    </body>
</html>
