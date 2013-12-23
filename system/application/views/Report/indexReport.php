<div class="row">
    <div class="col-lg-12">
        <div class="box">
            <header>
                <div class="icons">
                    <i class="fa fa-list"></i>
                </div>
                <h5>Reporte de Ventas</h5>
            </header>
            <div class="body">
                <div class="col-lg-3">
                    <ul>
                        <li>
                            <h4>Ventas por día</h4>
                            <div data-date-format="dd-mm-yyyy" data-date="<?php echo date('d-m-Y'); ?>" id="report_date" class="input-group input-append date">
                                <input type="text" readonly="" value="<?php echo date('d-m-Y'); ?>" class="form-control">
                                <span class="input-group-addon add-on"><i class="fa fa-calendar"></i></span>
                            </div>
                        </li>
                        <li>
                            <h4>Ventas acumuladas por rango de fechas</h4>
                            <div class="form-control">
                                <div id="report_range_date" class="pull-left" data-url="<?php echo site_url('Reports/reportSalesAccumulatedByRange'); ?>">
                                    <i class="fa fa-calendar"></i>
                                    <span><?php echo date("F j, Y", strtotime('-30 day')); ?> - <?php echo date("F j, Y"); ?></span> <b class="caret"></b>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="report_container"></div>