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


    <div class="col-lg-4">
        <div class="box inverse">

            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Datos x Mes</h5>
            </header>
            
            <div class="body">
                <table class="table table-condensed table-hovered sortableTable">
                    <thead>
                        <tr>
                            <th><div align="right">Fecha <i class="icon-sort"></i><i class="icon-sort-down"></i><i class="icon-sort-up"></i></div></th>
                    <th><div align="right">Venta Real (S/.)<i class="icon-sort"></i><i class="icon-sort-down"></i><i class="icon-sort-up"></i></div></th>
                    <th><div align="right">Venta Presup. (S/.)<i class="icon-sort"></i><i class="icon-sort-down"></i><i class="icon-sort-up"></i></div></th>
                    <th><div align="right">Diferencia (S/.)<i class="icon-sort"></i><i class="icon-sort-down"></i><i class="icon-sort-up"></i></div></th>
                    </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($dbl_daily_sales_report as $dbr_daily_sales_report) { ?>
                            <tr>
                                <td><div align="right"><?php echo Utils::getFormattedDate($dbr_daily_sales_report->date_sale, '%d %M'); ?></div></td>
                                <td><div align="right">S/. <?php echo number_format($dbr_daily_sales_report->grand_total_calculated, 2); ?></div></td>
                                <td><div align="right">S/. <?php echo number_format($dbr_daily_sales_report->grand_total_z_format, 2); ?></div></td>
                                <td><div align="right">S/. <?php echo number_format(($dbr_daily_sales_report->grand_total_calculated - $dbr_daily_sales_report->grand_total_z_format), 2); ?></div></td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
                <input type="hidden" id="data-chart-url" value="<?php echo site_url('Dashboard/DayliSalesBarChart'); ?>">
            </div>
        </div>
    </div>
</div>

<?php foreach($dbl_subsidiaries_parents as $dbl_parents){?>
<div class="col-lg-5">
    <div class="box inverse">

        <header>
            <div class="icons"><i class="icon-th"></i></div>
            <h5>Datos x Mes</h5>
        </header>
        <div class="body">
            <table class="table table-condensed table-hovered sortableTable">
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                        <th>Resultados Diarios</th>
                        <th>15/11/2013</th>
                        <th></th>
                    </tr>
                    <tr>
                        <th></th>
                        <th></th>
                        <th>2013</th>
                        <th>Ppto</th>
                        <th>2012</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($dbl_consolidate_daily_sales as $dbl_consolidate) { ?>
                        <?php if(!$dbl_consolidate->parent_id) {?>
                        <tr>
                            <td><?php echo $dbl_consolidate->subsidiary_name;?></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <?php } else {?>
                        <tr>
                            <td><?php echo $dbl_consolidate->subsidiary_name;?></td>
                            <td><?php echo $dbl_consolidate->subsidiary_name;?></td>
                            <td><?php echo number_format($dbl_consolidate->grand_total_z_format, 2);?></td>
                            <td><?php echo number_format($dbl_consolidate->budget_amount, 2);?></td>
                            <td><?php echo number_format($dbl_consolidate->budget_amount_assigned, 2);?></td>    
                        </tr>
                        <?php }?>                    
                    <?php } ?>
                </tbody>
            </table>      
        </div>
    </div>
</div>
<?php }?>
