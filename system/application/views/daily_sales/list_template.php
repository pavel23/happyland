<div class="row">
    <div class="col-lg-12">
        <div class="box dark">
            <header>
                <div class="icons"><i class="icon-th"></i></div>
                <h5>Listado de Ventas Diarias</h5>                
            </header>
            <div id="div-5" class="accordion-body collapse in body">
                <input type="hidden" name="url_full_calendar" id="url_full_calendar" value="<?php echo site_url('daily_sales_controller/getDailySaleCalendar') ?>">                
                <div id="calendar"></div>                
            </div>
        </div>
    </div>
</div>



