<div class="row">
    <div class="col-lg-12">
        <div class="box success">
	    <header>
                <h5>Estas viendo información de: <?php echo ($subsidiary_name);?></h5>
	    </header>
	</div>
        <div class="box inverse">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Presupuesto de Ventas</h5><?php echo form_dropdown('list_month', Utils::getMonths(), date('m'), 'id="list_month_id" class="form-control autotab"'); ?>
            </header>
            <div id="div-5" class="accordion-body collapse in body">
                <input type="hidden" id="url-data-budget" name="url-data-budget" value="<?php echo site_url('BudgetSales/getDataBudgetJson/'.$subsidiary_id); ?>">
                <input type="hidden" id="url-data-budget-save" name="url-data-budget-save" value="<?php echo site_url('BudgetSales/saveDataBudget/'.$subsidiary_id); ?>">
                <div id="budget_headers" style="display:none;"><?php echo json_encode($a_data_budget);?></div>
                <?php if ($this->session->flashdata('message_danger')) : ?>
                    <div class="alert alert-danger">
                        <a class="close" data-dismiss="alert" href="#">×</a><?php echo $this->session->flashdata('message_danger') ?>
                    </div>
                <?php endif; ?>
                <?php if ($this->session->flashdata('message_success')) : ?>
                    <div class="alert alert-success">
                        <a class="close" data-dismiss="alert" href="#">×</a><?php echo $this->session->flashdata('message_success') ?>
                    </div>
                <?php endif; ?>
                <div id="budget_sales"></div>
            </div>
        </div>
    </div>
</div>

