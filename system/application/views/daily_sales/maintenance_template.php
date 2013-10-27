<input type="hidden" name="url-data-operators" id="url-data-operators" value="<?php echo site_url('daily_sales_controller/getJSONOperators'); ?>" />
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
            <div id="div-5" class="accordion-body collapse in body">
                <div id="error_message"></div>
                <div id="daily_sales"></div>
            </div>
        </div>
    </div>
</div>
