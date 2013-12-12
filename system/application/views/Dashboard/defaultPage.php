<div class="row">
    <div class="col-lg-12">
        <?php if ($this->session->flashdata('message')) : ?>
            <div class="alert alert-success">
                <a class="close" data-dismiss="alert" href="#">×</a><?php echo $this->session->flashdata('message') ?>
            </div>
        <?php endif; ?> 
    </div>
    <div class="col-lg-12">
        <div class="box success">
            <header>
                <h5>Estas viendo información de:</h5>
                <?php echo form_dropdown('list_subsidiaries_id', $a_subsidiaries, '', 'id="list_subsidiaries_id" class="chosen-select form-control autotab"'); ?>
            </header>
        </div>
    </div>

    <div class="col-lg-8">
        <div class="box inverse">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Venta Diaria Real VS Valor Presupuestado</h5>
            </header>
            <div class="body">
                <div id="dayliSaleBudget"></div>
            </div>
        </div>
    </div>

    <div class="col-lg-4">
        <div class="box inverse">

            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Datos x Mes</h5>
            </header>
            <div class="body">
                <div id="gauge_chart"></div>
            </div>
        </div>
    </div>
    <input type="hidden" id="data-chart-url" value="<?php echo site_url('Dashboard/DayliSalesBarChart'); ?>">
</div>

<?php foreach($dbl_subsidiaries_parents as $dbl_parents){?>
<div class="col-lg-6">
    <div class="box inverse">
        <header>
            <div class="icons"><i class="icon-th"></i></div>
            <h5>Resultados diarios al <?php echo $date_selected;?></h5>
        </header>
        <div class="body">
            <table class="table table-condensed table-hovered sortableTable">
                <thead>
                    <tr>
                        <th></th>
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
                        <td><?php echo $dbl_parents->name;?></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <?php foreach ($a_daily_sales_by_day[$dbl_parents->id] as $dbr_sale_by_day) { ?>
                        <tr>
                            <td></td>
                            <td><?php echo $dbr_sale_by_day->date_sale;?> - <?php echo $dbr_sale_by_day->subsidiary_name;?></td>
                            <td><?php echo number_format($dbr_sale_by_day->grand_total_z_format, 2);?></td>
                            <td><?php echo number_format($dbr_sale_by_day->budget_amount, 2);?></td>
                            <td><?php echo number_format($dbr_sale_by_day->budget_amount_assigned, 2);?></td>
                            <td><?php //echo number_format($dbr_sale_by_day->budget_amount, 2);?></td>
                            <td><?php //echo number_format($dbr_sale_by_day->budget_amount_assigned, 2);?></td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="col-lg-6">
    <div class="box inverse">
        <header>
            <div class="icons"><i class="icon-th"></i></div>
            <h5>Resultados Acumulados al mes <?php echo Utils::getMonthsName($month_selected);?></h5>
        </header>
        <div class="body">
            <table class="table table-condensed table-hovered sortableTable">
                <thead>
                    <tr>
                        <th></th>
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
                        <td><?php echo $dbl_parents->name;?></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <?php foreach ($a_daily_sales_accumulate[$dbl_parents->id] as $dbr_accumulate) { ?>
                        <tr>
                            <td></td>
                            <td><?php echo $dbr_accumulate->subsidiary_name;?></td>
                            <td><?php echo number_format($dbr_accumulate->grand_total_z_format, 2);?></td>
                            <td><?php echo number_format($dbr_accumulate->budget_amount, 2);?></td>
                            <td><?php echo number_format($dbr_accumulate->budget_amount_assigned, 2);?></td>
                            <td></td>
                            <td></td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<?php }?>
