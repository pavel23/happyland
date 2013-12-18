<div class="box">
    <header>
        <h5>Reportes</h5>
    </header>
    <div class="body">

        Reporte ventas x Día
        <div class="col-lg-5">
            <div class="box">
                <header>
                    <div class="icons">
                        <i class="fa fa-calendar"></i>
                    </div>
                    <h5>Reporte ventas Acumuladas x Mes</h5>
                    <div class="toolbar">
                        <ul class="nav pull-right">
                            <li>
                                <a href="#datePickerBlock" data-toggle="collapse" class="minimize-box">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="close-box">
                                    <i class="fa fa-times"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </header>
                <div class="body">
                    <div id="datePickerBlock" class="body collapse in">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-lg-4" for="dp1">As component</label>
                                <div class="col-lg-3">
                                    <div class="input-group input-append date" id="dp1" data-date="18-12-2013" data-date-format="dd-mm-yyyy">
                                        <input id="date_sale" class="form-control" type="text" value="18-12-2013" readonly="">
                                        <span class="input-group-addon add-on"><i class="fa fa-calendar"></i></span>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- sajd lkasjd lkasjda -->
                <div id="reportrange" class="pull-right">
                    <i class="icon-calendar icon-large"></i>
                    <span><?php echo date("F j, Y", strtotime('-30 day')); ?> - <?php echo date("F j, Y"); ?></span> <b class="caret"></b>
                </div>
                <!-- sajd lkasjd lkasjda -->

            </div>
        </div>
    </div>
</div>
<?php foreach ($dbl_subsidiaries_parents as $dbl_parents) { ?>          
    <div class="col-lg-6">
        <div class="box info">
            <header>
                <div class="icons"><i class="fa fa-calendar"></i></i></div>
                <h5>[<?php echo $dbl_parents->name; ?>] Resultados del dirios <?php echo $date_selected; ?></h5>
            </header>
            <div class="body">
                <table class="table table-condensed table-hovered sortableTable">
                    <thead>
                        <tr>
                            <th></th>
                            <th>2013</th>
                            <th>Ppto</th>
                            <th>2012</th>
                            <th>cr /ppto</th>
                            <th>cr / 2012</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <?php foreach ($a_daily_sales_by_day[$dbl_parents->id] as $dbr_sale_by_day) { ?>
                            <tr>
                                <td><?php echo $dbr_sale_by_day->subsidiary_name; ?></td>
                                <td><?php echo number_format($dbr_sale_by_day->grand_total_z_format, 2); ?></td>
                                <td><?php echo number_format($dbr_sale_by_day->budget_amount, 2); ?></td>
                                <td><?php echo number_format($dbr_sale_by_day->budget_amount_assigned, 2); ?></td>
                                <td><?php //echo number_format($dbr_sale_by_day->budget_amount, 2);    ?></td>
                                <td><?php //echo number_format($dbr_sale_by_day->budget_amount_assigned, 2);    ?></td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="box warning">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>[<?php echo $dbl_parents->name; ?>] Resultados Acumulados al mes <?php echo Utils::getMonthsName($month_selected); ?></h5>
            </header>
            <div class="body">
                <table class="table table-condensed table-hovered sortableTable">
                    <thead>
                        <tr>
                            <th></th>
                            <th>2013</th>
                            <th>Ppto</th>
                            <th>2012</th>
                            <th>cr /ppto</th>
                            <th>cr / 2012</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <?php foreach ($a_daily_sales_accumulate[$dbl_parents->id] as $dbr_accumulate) { ?>
                            <tr>
                                <td><?php echo $dbr_accumulate->subsidiary_name; ?></td>
                                <td><?php echo number_format($dbr_accumulate->grand_total_z_format, 2); ?></td>
                                <td><?php echo number_format($dbr_accumulate->budget_amount, 2); ?></td>
                                <td><?php echo number_format($dbr_accumulate->budget_amount_assigned, 2); ?></td>
                                <td></td>
                                <td></td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<?php } ?>
