$(function() {
    var $container_daily_sales = $('#daily_sales'),
            url_save_data = $('#url-save-daily-sales').val(),
            url_data_autocomplete = $('#url-data-operators').val(),
            url_data_daily_sales = $('#url-data-daily_sales').val();

    var DailySales = function() {
        var _user_map_ids = null;
        function setUserMapIds(p_user_map_ids) {
            _user_map_ids = p_user_map_ids;
        }
        return {
            setUserMapIds: setUserMapIds
        }
    }

    var myAutocompleteRenderer = function(instance, td, row, col, prop, value, cellProperties) {
        Handsontable.AutocompleteCell.renderer.apply(this, arguments);
        $(td).css({
            color: 'black'
        });
    };

    $container_daily_sales.handsontable({
        //startRows: 8,
        //startCols: 11,
        rowHeaders: false,
        contextMenu: false,
        fillHandle: true,
        /*currentRowClassName: 'currentRow',
         currentColClassName: 'currentCol',*/
        autoWrapRow: true,
        colHeaders: [
            'Nombres y Apellidos',
            'Caja',
            'Apertura Caja <br/> (S/.)',
            'Cierre Caja<br /> (S/.)',
            'Master Card <br />(S/.)',
            'Visa <br />(S/.)',
            'Web <br />(S/.)',
            'Venta Efectivo <br />(S/.)',
            'Venta Efectivo <br />($)',
            'Total<br/>Efectivo (S/.)',
            'Formato X <br/>(S/.)',
            'Dif.<br />Dinero (S/.)',
            'Dif.<br />Valores',
            'Transac.',
            'Horas/Caja'
        ],
        columns: [
            {
                data: 'name',
                type: {renderer: myAutocompleteRenderer, editor: Handsontable.AutocompleteEditor},
                options: {items: 10},
                source: function(params, process) {
                    $.ajax({
                        url: url_data_autocomplete,
                        contentType: 'application/json; charset=utf-8',
                        success: function(autocompleteResponse) {
                            process(autocompleteResponse.full_names);
                            //dailySaleOne.setUserMapIds(autocompleteResponse.ids)
                        }
                    }).done(function( data ) {
                        
                    });
                },
                strict: true
            },
            {data: 'cash_number', type: 'numeric', allowInvalid: false},
            {data: 'opening_cash', type: 'numeric', allowInvalid: false, format: '0,0.00'},
            {data: 'closing_cash', type: 'numeric', allowInvalid: false, format: '0,0.00'},
            {data: 'master_card_amount', type: 'numeric', allowInvalid: false, format: '0,0.00'},
            {data: 'visa_amount', type: 'numeric', allowInvalid: false, format: '0,0.00'},
            {data: 'web_payment', type: 'numeric', allowInvalid: false, format: '0,0.00'},
            {data: 'retirement_amount_pen', type: 'numeric', allowInvalid: false, format: '0,0.00'},
            {data: 'retirement_amount_dol', type: 'numeric', allowInvalid: false, format: '0,0.00'},
            {data: 'total_calculated', type: 'numeric', allowInvalid: false, readOnly: true/*, renderer: sumCalculateTotalCash*/, format: '0,0.00'},
            {data: 'total_x_format', type: 'numeric', allowInvalid: false, format: '0,0.00'},
            {data: 'difference_money', type: 'numeric', allowInvalid: false, readOnly: true/*, renderer: sumCalculateDifferenceCash*/, format: '0,0.00'},
            {data: 'difference_values', type: 'numeric', allowInvalid: false, format: '0,0.00'},
            {data: 'num_transacctions', type: 'numeric', allowInvalid: false},
            {data: 'hour_by_cash', type: 'numeric', allowInvalid: false}
        ],
        afterChange: function(change, source) {
            console.log(source);
            if(source=='edit') {
                console.log(change[0]);
                //autocompleteResponse.ids[]
            }
        }
    });

    var hndst_daily_sales = $container_daily_sales.data('handsontable');
    $.ajax({
        url: url_data_daily_sales,
        dataType: 'json',
        type: 'POST',
        //data: {'month': $('#list_month_id').val()},
        success: function(res) {
            console.log(res);
            hndst_daily_sales.loadData(res.daily_sales_data);
        }
    });

    $('#btn-save').click(function() {
        $.ajax({
            url: url_save_data,
            data: {'data': hndst_daily_sales.getData()},
            dataType: 'json',
            type: 'POST',
            success: function(res) {
                if (res.result === 'ok') {
                    console.log('Data saved');
                }
                else {
                    console.log('Save error');
                }
            },
            error: function() {
                console.log('Save error. POST method is not allowed on GitHub Pages. Run this example on your own server to see the success message.');
            }
        });
    });


});