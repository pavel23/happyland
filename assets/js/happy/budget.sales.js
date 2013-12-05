$(function() {
    var $container_budget_sales = $('#budget_sales');
    var url_process             = $('#url-data-budget-save').val();
    var headers                 = $('#budget_headers').text();
    var autosaveNotification    = null;
    var current_value           = null;
    var new_value               = null;
    var row_position            = null;

    var saveCurrentBudget = function(url_process, data_for_process) {
        $.ajax({
            url: url_process,
            dataType: 'json',
            type: 'POST',
            data: {'data_for_process': data_for_process},
            complete: function(data_reponse) {
                autosaveNotification = setTimeout(function() {
                    console.log('Changes will be autosaved');
                    console.log(data_reponse);
                    $('#list_month_id').trigger('change');
                }, 1000);
            }
        });
    }

    $container_budget_sales.handsontable({
        //startRows: 8,
        //startCols: 11,
        rowHeaders: false,
        contextMenu: false,
        fillHandle: true,
        /*currentRowClassName: 'currentRow',
        currentColClassName: 'currentCol',*/
        autoWrapRow: true,
        colHeaders: $.parseJSON(headers).budget_headers,
        columns: [
            {data: 'date_text', readOnly: true},
            {data: 'current_ppto', type: 'numeric', format: '0,0.00'},
            {data: 'current_real_sale', readOnly: true, type: 'numeric', format: '0,0.00'},
            {data: 'last_real_sale_assig', type: 'numeric', format: '0,0.00'},
            {data: 'current_percent_cr_ppto', readOnly: true, format: '00.00'},
            {data: 'last_percent_cr', readOnly: true, format: '00.00'},
            {data: 'current_ppto_accumulated', readOnly: true, format: '00.00'},
            {data: 'current_real_sale_accumulated', readOnly: true, format: '00.00'},
            {data: 'last_real_sale_accumulated', readOnly: true, format: '00.00'},
            {data: 'current_cr_ppto_accumulated', readOnly: true, format: '00.00'},
            {data: 'last_cr_sale_accumulated', readOnly: true, format: '00.00'},
        ],
        afterChange: function(change, source) {
            if (source === 'loadData') {
                return; //don't save this change
            }
            if (source === 'paste') {
                clearTimeout(autosaveNotification);
                saveCurrentBudget(url_process, handsontable.getData());
            } else {
                current_value = (change[0][2] ? change[0][2] : 0);
                new_value = (change[0][3] ? change[0][3] : 0);
                row_position = (change[0][0] ? change[0][0] : 0);
                if (new_value !== current_value && new_value > 0) {
                    clearTimeout(autosaveNotification);
                    saveCurrentBudget(url_process, [handsontable.getData()[row_position]]);
                }
            }
        }
    });

    var handsontable = $container_budget_sales.data('handsontable');
    $('#list_month_id').on('change', function() {
        $.ajax({
            url: $('#url-data-budget').val(),
            dataType: 'json',
            type: 'POST',
            data: {'month': $('#list_month_id').val()},
            success: function(res) {
                handsontable.loadData(res.budget_data);
            }
        });
    });
    $('#list_month_id').trigger('change');
});