<input type="hidden" id="data-gauge-url" value="<?php echo site_url('Dashboard/getDataGaugeByZonal'); ?>">
<?php for ($zonal = 1; $zonal <= 3; $zonal++) { ?>
    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        Informe Zonal <?php echo $zonal; ?> - Acumulado Anual 
                    </h3>
                </div>
                <div id="panel_body_zonal<?php echo $zonal; ?>" class="panel-body">
                    <div class="col-md-6">
                        <div id="gauge_zonal<?php echo $zonal; ?>"></div>
                    </div>
                    <div class="col-md-6">
                        <div id="pie_zonal<?php echo $zonal; ?>"></div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="col-md-12">
                        <div id="table-zonal<?php echo $zonal; ?>"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php } ?>
