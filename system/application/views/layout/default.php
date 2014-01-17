<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title><?php echo $this->layout->title ?></title>
        <link rel="stylesheet" href="<?php echo base_url(); ?>assets/dist/css/bootstrap.css">
        <link rel="stylesheet" href="<?php echo base_url(); ?>assets/dist/css/theme.css">
        <link rel="stylesheet" href="<?php echo base_url(); ?>assets/happy/css/custom-style.css">
        <link rel="stylesheet" href="<?php echo base_url(); ?>assets/lib/css/font-awesome.min.css">
        <?php if ($this->layout->isLogin): ?>
            <link rel="stylesheet" href="<?php echo base_url(); ?>assets/lib/css/signin.css"/>
        <?php else: ?>
            <link rel="stylesheet" href="<?php echo base_url(); ?>assets/dist/css/bootstrap-theme.min.css"/>
        <?php endif; ?>
        <?php $this->layout->css(); ?>
    </head>
    <body>
        <div class="container theme-showcase">
            <?php if ($this->layout->isLogin) { ?>
                <?php echo $content; ?>
            <?php } else { ?>
                <?php $this->load->view("Includes/menu_nav"); ?>
                <div class="row">
                    <?php echo $content; ?>
                </div>
                <?php $this->load->view("Includes/footer"); ?>
            <?php } ?>
        </div>
        <script src="<?php echo base_url(); ?>assets/lib/js/jquery.js"></script>
        <script src="<?php echo base_url(); ?>assets/dist/js/bootstrap.min.js"></script>
        <script src="<?php echo base_url(); ?>assets/lib/js/jquery.isloading.min.js"></script>
        <?php $this->layout->js(); ?>
    </body>
</html>