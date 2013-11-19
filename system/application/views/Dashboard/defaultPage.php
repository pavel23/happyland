Pagina por defecto
<div class="row">
    <div class="col-lg-8">
	<div class="box">
	    <header>
		<h5>Venta Diaria Real VS Valor Presupuestado</h5>
	    </header>
            <div class="body">
                <div id="dayliSaleBudget"></div>
            </div>
	</div>
    </div>
    <div class="col-lg-4">
	<div class="box">
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
	    </div>
	</div>
    </div>
    <div class="col-lg-8">
	<div class="box">
	    <header>
		<h5>Detalle de Venta Diaria</h5>
	    </header>
            <div class="body">
                <div id="chart2"></div>
                <div id="resizable1"></div>
            </div>
	</div>
    </div>
</div>