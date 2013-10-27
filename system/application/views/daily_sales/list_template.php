<div class="row">
    <div class="col-lg-12">
        <div class="box dark">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Listado de Ventas Diarias</h5>                
            </header>
            <div id="div-5" class="accordion-body collapse in body">
                <div><?php echo date('t', mktime(0, 0, 0, 2, 1, 2010)); ?></div>

                <div><?php echo date('F'); ?></div>
                <ol class="calendar">
                    <?php for ($i = 0; $i < date('t'); $i++) { ?>
                        <?php
                        if ($i < 10) {
                            $status = 'closed';
                        }
                        if ($i == 10) {
                            $status = 'open';
                        }
                        if ($i > 10) {
                            $status = 'disabled';
                        }
                        ?>
                        <li class="day_container <?php echo $status; ?>">
                            <a href="<?php echo site_url('daily_sales_controller/maintenanceForm'); ?>">
                                <div class="day_number"><?php echo $i + 1; ?></div>
                                <div class="day_sale_text">Venta del día</div>
                                <div class="day_sale_amount">S/ <?php echo number_format((($i + 1) * 10), 2); ?></div>
                                <div class="day_status">Estado Venta</div>
                            </a>
                        </li>
                    <?php } ?>
                </ol>
            </div>
        </div>
    </div>
</div>



