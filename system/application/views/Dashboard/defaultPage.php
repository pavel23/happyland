<input type="hidden" id="data-chart-url" value="<?php echo site_url('Dashboard/DayliSalesBarChart'); ?>">
<?php $this->load->view('Includes/Modules/list_subsidiaries', array('a_subsidiaries' => $a_subsidiaries)); ?> 
<div class="col-sm-8">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Venta Diaria vs Valor Presupuestado (Acum. Mensual)</h3>
        </div>
        <div class="bs-docs-canvas">
            <div id="dayliSaleBudget"></div><br />
        </div>
    </div>
</div>

<div class="col-sm-4">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Cobertura Presupuestal (Acum. Anual)</h3>
        </div>
        <div class="bs-docs-canvas">
            <div id="gauge_chart"></div><br />
        </div>
    </div>
</div>