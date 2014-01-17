<div class="col-sm-12">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Estas viendo información de:</h3>
        </div>
        <div class="panel-body">
            <?php echo form_open('', array('class' => 'form-inline', 'role' => 'form')); ?>
            <form class="form-inline" role="form">
                <div class="form-group">
                    <label for="list_subsidiaries_id">Local:</label>
                    <?php echo form_dropdown('list_subsidiaries_id', $a_subsidiaries, '', 'id="list_subsidiaries_id" class="form-control"'); ?>
                </div>
                <div class="form-group">
                    <label for="list_year">Año:</label>
                    <?php echo form_dropdown('list_year', array('2012', '2013', '2014'), '', 'id="list_year" class="form-control"'); ?>
                </div>
            <?php echo form_close(); ?>
        </div>
    </div>
</div>