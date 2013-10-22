<link rel="stylesheet" type="text/css" href="http://localhost/happyland/css/global.css">
<link rel="stylesheet" type="text/css" href="http://localhost/happyland/css/daily_sales.css">

listado de ventas diarias
<div><?php echo date('t', mktime(0, 0, 0, 2, 1, 2010));?></div>

<div><?php echo date('F');?></div>
<ol class="calendar">
    <?php for($i=0; $i<date('t'); $i++){?>
        <?php 
            if($i<10){
                $status = 'closed';
            }
            if($i==10){
                $status = 'open';
            }
            if($i>10){
                $status = 'disabled';
            }
        ?>
        <li class="day_container <?php echo $status;?>">
            <a href="<?php echo site_url('daily_sales_controller/maintenanceForm');?>">
                <div class="day_number"><?php echo $i + 1;?></div>
                <div class="day_sale_text">Venta del día</div>
                <div class="day_sale_amount">S/ <?php echo number_format((($i +1) * 10),2);?></div>
                <div class="day_status">Estado Venta</div>
            </a>
        </li>
    <?php }?>
</ol>