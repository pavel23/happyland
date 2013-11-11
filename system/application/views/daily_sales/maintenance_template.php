
<input type="hidden" name="url-data-operators" id="url-data-operators" value="<?php echo site_url('daily_sales_controller/getJSONOperators'); ?>" />
<input type="hidden" name="url-data-other_daily_sales" id="url-data-other_daily_sales" value="<?php echo site_url('daily_sales_controller/getJSONDailySaleOthers'); ?>" />
<div class="row">
    <div class="col-lg-12">
        <div class="box dark">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Ventas Diarias</h5>
                <div class="toolbar">
                    <div class="btn-group">		  
                        <a id="save_daily_sales" href="<?php echo site_url('daily_sales_controller/processForm'); ?>" class="btn btn-primary btn-sm">
                            <i class="icon-save"></i>
                        </a>
                    </div>
                </div>                
            </header>
                                              
            <div id="wrapper_daily_sale" class="accordion-body collapse in body" data-is_readonly="<?php  echo $is_readonly ?>" data-dailysale='<?php echo json_encode($dailySale); ?>' >
                <input type="hidden" name="dayli_sale_id" id="dayli_sale_id" value="<?php echo (isset($dailySaleId) ? $dailySaleId : '' ); ?>">
                <div id="error_message"></div>
                <div id="daily_sales"></div>
                <div id="daily_sales_others"></div>
                <div id="daily_sales_totals"></div>
            </div>
        </div>
    </div>
</div>
