<div class="row">
    <div class="col-lg-12">
        <div class="box success">
	    <header>
		<h5>Estas viendo información de:</h5>
                <?php echo form_dropdown('list_subsidiaries_id', $a_subsidiaries, '', 'id="list_subsidiaries_id" class="form-control autotab"'); ?>
	    </header>
	</div>
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
                        <?php foreach($dbl_daily_sales_report as $dbr_daily_sales_report){?>
                        <tr>
                            <td><div align="right"><?php echo Utils::getFormattedDate($dbr_daily_sales_report->date_sale, '%d %M');?></div></td>
                            <td><div align="right">S/. <?php echo number_format($dbr_daily_sales_report->grand_total_calculated, 2);?></div></td>
                            <td><div align="right">S/. <?php echo number_format($dbr_daily_sales_report->grand_total_z_format, 2);?></div></td>
                            <td><div align="right">S/. <?php echo number_format(($dbr_daily_sales_report->grand_total_calculated - $dbr_daily_sales_report->grand_total_z_format), 2);?></div></td>
			</tr>
                        <?php }?>
		    </tbody>
		</table>
                <input type="hidden" id="data-chart-url" value="<?php echo site_url('Dashboard/DayliSalesBarChart');?>">
	    </div>
	</div>
    </div>
    <div class="col-lg-4">
	<div class="box inverse">
	    <header>
		<div class="icons"><i class="icon-th"></i></div>
                <h5>Detalle de Venta Diaria</h5>
	    </header>
            <div class="body">
                <div id="chart2"></div>
                <div id="resizable1"></div>
            </div>
	</div>
    </div>
</div>