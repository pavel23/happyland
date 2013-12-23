<?php foreach ($dbl_subsidiaries_parents as $dbl_parents) { ?>
    <div class="row">
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
                                    <td><?php //echo number_format($dbr_sale_by_day->budget_amount, 2);              ?></td>
                                    <td><?php //echo number_format($dbr_sale_by_day->budget_amount_assigned, 2);              ?></td>
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
    </div>
<?php } ?>