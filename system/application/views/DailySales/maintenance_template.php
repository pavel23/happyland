<?php $this->load->view('Includes/Modules/module_title', array('module_title' => 'Módulo de Ventas Diarias: Registro')); ?>

<input type="hidden" name="url-data-operators" id="url-data-operators" value="<?php echo site_url('DailySales/getJSONOperators'); ?>" />
<input type="hidden" name="url-data-operators" id="url-save-daily-sales" value="<?php echo site_url('DailySales/processForm'); ?>" />

<div class="row">
    <div class="col-lg-12">
        <div class="box dark">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <div class="toolbar">
                    <div class="body collapse in">
                        <?php if ($status == Status::STATUS_CERRADO): ?>
                            <a id="open_daily_sales" class="btn btn-primary btn-sm" href="<?php echo (isset($dailySaleId) ? site_url('DailySales/openDailySale/' . $dailySaleId) . ($subsidiaries_id ? '?sd_id='.$subsidiaries_id : '') : ''); ?>" data-original-title="" title="">Abrir Venta</a>
                        <?php endif; ?>
                        <?php if ($status == Status::STATUS_ABIERTO): ?>
                            <a id="save_daily_sales" class="btn btn-danger btn-sm" href="<?php echo (isset($dailySaleId) ? site_url('DailySales/closeDailySale/' . $dailySaleId) . ($subsidiaries_id ? '?sd_id='.$subsidiaries_id : '') : ''); ?>" data-original-title="" title="">Cerrar Venta</a>
                        <?php endif; ?>
                    </div>
                </div>
            </header>

            <div id="wrapper_daily_sale" class="accordion-body collapse in body" data-is_readonly="<?php echo $is_readonly ?>" data-dailysale='<?php echo json_encode($dailySale); ?>' >
                <input type="hidden" name="daily_sale_id" id="daily_sale_id" value="<?php echo (isset($dailySaleId) ? $dailySaleId : '' ); ?>">
                <input type="hidden" name="subsidiaries_id" id="subsidiaries_id" value="<?php echo $subsidiaries_id; ?>">
                <input type="hidden" name="seleted_date" id="seleted_date" value="<?php echo $selected_date; ?>">
                <div id="error_message"></div>
                <div id="daily_sales"></div>
                <div id="daily_sales_others"></div>
                <div id="daily_sales_totals"></div>
            </div>
        </div>
    </div>
</div>
