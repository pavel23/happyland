var DailySales = function() {
    var _daily_sale_id = 0;
    var _instance = null, autosaveNotification = null, _user_map_ids = null;

    function setUserMapIds(p_user_map_ids) {
        _user_map_ids = p_user_map_ids;
    }

    function setSailySaleId(p_dayly_sale_id) {
        _daily_sale_id = p_dayly_sale_id;
    }

    function getSailySaleId() {
        return _daily_sale_id;
    }

    function setInstance(p_instance) {
        _instance = p_instance;
    }

    function getInstance() {
        return _instance;
    }

    function saveDailySales(url_save_data, change, source) {
        if (!_instance) {
            return;
        }

        if (source === 'loadData') {
            var data_row = _instance.handsontable('getData');
            $(_instance).find('tbody tr').each(function(i) {

                if (data_row[i] && data_row[i].id) {
                    if (data_row[i].operator_id > 0) {
                        $(this).data('operator_id', data_row[i].operator_id);
                    }
                    $(this).data('daily_sale_detail_id', data_row[i].id);
                }

            });
            return;
        }

        var JSONsaveResponse = {}, row_index = (change[0][0] >= 0 ? change[0][0] : null), col_index = (change[0][1] ? change[0][1] : null),
                old_value = (change[0][2] ? change[0][2] : null), new_value = (change[0][3] ? change[0][3] : null),
                $trow = $(_instance.handsontable('getCell', row_index, 0)).parent(),
                daily_sale_detail_id = parseInt($trow.data('daily_sale_detail_id')) || 0, operator_id = parseInt($trow.data('operator_id')),
                data_params_detail = _instance.handsontable('getData')[row_index], daily_sale_id = parseInt($(document).data('daily_sale_id')) || 0;

        if (data_params_detail.type_of_sales_id) {
            $(document).data('type_of_sales_id', data_params_detail.type_of_sales_id);
        }

        if (old_value !== new_value) {

            if (col_index === 'name') {
                for (var i = 0; i < _user_map_ids.length; i++) {
                    if (_user_map_ids[i].full_name === new_value) {
                        operator_id = _user_map_ids[i].id;
                        $trow.data('operator_id', operator_id);
                        break;
                    }
                }
            }

            data_params = {daily_sale_id: daily_sale_id, daily_sale_detail_id: daily_sale_detail_id, operator_id: $trow.data('operator_id'), data: data_params_detail};

            data_params.data.total_calculated = parseFloat(_instance.handsontable('getCell', row_index, 8).innerHTML);
            data_params.data.difference_money = parseFloat(_instance.handsontable('getCell', row_index, 10).innerHTML);
            data_params.data.type_of_sales_id = $(document).data('type_of_sales_id');

            $.ajaxQueue({
                url: url_save_data,
                dataType: 'json',
                type: 'POST',
                data: data_params
            }).done(function(response) {

                console.log(response)
                JSONsaveResponse = response;
                if (JSONsaveResponse.daily_sale_detail_id > 0 && daily_sale_detail_id === 0) {
                    $trow.data('daily_sale_detail_id', JSONsaveResponse.daily_sale_detail_id);
                }

                if (JSONsaveResponse.daily_sale_id > 0 && daily_sale_id === 0) {
                    $(document).data('daily_sale_id', JSONsaveResponse.daily_sale_id);
                }
            });
            /*$.ajax({
             url: url_save_data,
             dataType: 'json',
             type: 'POST',
             data: data_params,
             complete: function(response) {
             autosaveNotification = setTimeout(function() {
             JSONsaveResponse = response.responseJSON;
             if (JSONsaveResponse.daily_sale_detail_id > 0 && daily_sale_detail_id === 0) {
             $trow.data('daily_sale_detail_id', JSONsaveResponse.daily_sale_detail_id);
             //daily_sale_detail_id = JSONsaveResponse.daily_sale_detail_id;
             }
             
             if (JSONsaveResponse.daily_sale_id > 0 && daily_sale_id === 0) {
             $(document).data('daily_sale_id', JSONsaveResponse.daily_sale_id);
             //_daily_sale_id = ;
             }
             }, 1000);
             }
             });*/
        }
    }



    var privateCounter = 0;
    function changeBy(val) {
        privateCounter += val;
    }
    return {
        setUserMapIds: setUserMapIds,
        setInstance: setInstance,
        getInstance: getInstance,
        getSailySaleId: getSailySaleId,
        setSailySaleId: setSailySaleId,
        saveDailySales: saveDailySales,
        increment: function() {
            changeBy(1);
        },
        decrement: function() {
            changeBy(-1);
        },
        value: function() {
            return privateCounter;
        }
    }
};



//console.log(Counter.value()); /* Alerts 0 */
//Counter.increment();
//Counter.increment();
//console.log(Counter.value()); /* Alerts 2 */
//Counter.decrement();
//console.log(Counter.value()); /* Alerts 1 */


var myAutocompleteRenderer = function(instance, td, row, col, prop, value, cellProperties) {
    Handsontable.AutocompleteCell.renderer.apply(this, arguments);
    $(td).css({
        color: 'black'
    });
};

var sumRowsTotalCash = function(instance, row) {
    var a, b, c, d, e, f;
    a = parseFloat(instance.getDataAtCell(row, 'opening_cash')) || 0;
    b = parseFloat(instance.getDataAtCell(row, 'closing_cash')) || 0;
    c = parseFloat(instance.getDataAtCell(row, 'master_card_amount')) || 0;
    d = parseFloat(instance.getDataAtCell(row, 'visa_amount')) || 0;
    e = parseFloat(instance.getDataAtCell(row, 'retirement_amount_pen')) || 0;
    f = parseFloat(instance.getDataAtCell(row, 'retirement_amount_dol')) || 0;
    return ((b + c + d + e + f) - a);
}
var sumCalculateTotalCash = function(instance, td, row, col, prop, value, cellProperties) {
    Handsontable.TextCell.renderer.apply(this, arguments);

    $(td).css({
        background: '#9DEDF3',
        color: 'black',
        textAlign: 'right'
    });

    td.innerHTML = parseFloat(sumRowsTotalCash(instance, row));
}

var sumCalculateDifferenceCash = function(instance, td, row, col, prop, value, cellProperties) {
    Handsontable.TextCell.renderer.apply(this, arguments);
    var b;
    b = parseFloat(instance.getDataAtCell(row, 'total_x_format')) || 0;

    $(td).css({
        background: '#CDFF95',
        color: 'black',
        textAlign: 'right'
    });
    td.innerHTML = parseFloat(sumRowsTotalCash(instance, row)) - parseFloat(b);
}

var email_validator_fn = function(value, callback) {
    setTimeout(function() {
        if (/^\d*$/.test(value)) {
            console.log(value);
            callback(false);
        }
        else {
            console.log('error');
            callback(true);
        }
    }, 1000);
};

$(function() {

    var dailySaleOne = DailySales();
    var dailySaleTwo = DailySales();

    var $container_daily_sales = $("#daily_sales"),
            $container_other_operations = $('#daily_sales_others'),
            url_save_data = $('#save_daily_sales').attr('href'),
            $url_data_autocomplete = $('#url-data-operators').val(),
            user_map_ids = null, daily_sale_id = $('#dayli_sale_id').val() || 0,
            $wrapper = $('#wrapper_daily_sale');

    if (daily_sale_id > 0) {
        $(document).data('daily_sale_id', daily_sale_id);
    }

//console.log($wrapper.data('dailysale'));

    var data_type_of_sale_one = $.map($wrapper.data('dailysale'), function(data) {
        if (parseFloat(data.is_other_sales) === 0) {
            return data;
        }
    });
    var data_type_of_sale_two = $.map($wrapper.data('dailysale'), function(data) {
        if (parseFloat(data.is_other_sales) === 1) {
            return data;
        }
    });

    dailySaleOne.setInstance($container_daily_sales);
    dailySaleTwo.setInstance($container_other_operations);

//console.log(data_type_of_sale_one);
    $container_daily_sales.handsontable({
        data: data_type_of_sale_one,
        startRows: 1,
        startCols: 14,
        minSpareRows: 1,
        colWidths: [230, 60, 90, 90, 90, 90, 90, 90, 90, 90, 90, 90, 90, 90],
        contextMenu: true,
        colHeaders: [
            'Nombres y Apellidos',
            'Caja',
            'Apertura<br />Inicio (S/.)',
            'Apertura<br />Fin (S/.)',
            'Tarjeta<br />Master Card (S/.)',
            'Tarjeta<br />Visa (S/.)',
            'Retiro (S/.)',
            'Retiro ($)',
            'Total<br/>Efectivo (S/.)',
            'Total<br/>Formato Z (S/.)',
            'Dif.<br />Dinero (S/.)',
            'Dif.<br />Valores',
            'Transacciones',
            'Horas/Caja'
        ],
        columns: [
            {
                data: 'name',
                type: {renderer: myAutocompleteRenderer, editor: Handsontable.AutocompleteEditor},
                options: {items: 10},
                source: function(params, process) {
                    $.ajax({
                        url: $url_data_autocomplete,
                        contentType: 'application/json; charset=utf-8',
                        success: function(autocompleteResponse) {
                            process(autocompleteResponse.full_names);
                            dailySaleOne.setUserMapIds(autocompleteResponse.ids)
                            user_map_ids = autocompleteResponse.ids;
                        }
                    });
                },
                strict: true
            },
            {data: 'cash_number', type: 'numeric', allowInvalid: true},
            {data: 'opening_cash', type: 'numeric', allowInvalid: true, format: '0,0.00'},
            {data: 'closing_cash', type: 'numeric', allowInvalid: true, format: '0,0.00'},
            {data: 'master_card_amount', type: 'numeric', allowInvalid: true, format: '0,0.00'},
            {data: 'visa_amount', type: 'numeric', allowInvalid: true, format: '0,0.00'},
            {data: 'retirement_amount_pen', type: 'numeric', allowInvalid: true, format: '0,0.00'},
            {data: 'retirement_amount_dol', type: 'numeric', allowInvalid: true, format: '0,0.00'},
            {data: 'total_calculated', type: 'numeric', allowInvalid: true, readOnly: true, renderer: sumCalculateTotalCash, format: '0,0.00'},
            {data: 'total_x_format', type: 'numeric', allowInvalid: true, format: '0,0.00'},
            {data: 'difference_money', type: 'numeric', allowInvalid: true, readOnly: true, renderer: sumCalculateDifferenceCash, format: '0,0.00'},
            {data: 'difference_values', type: 'numeric', allowInvalid: true, format: '0,0.00'},
            {data: 'num_transacctions', type: 'numeric', allowInvalid: true, format: '0,0.00'},
            {data: 'hour_by_cash', type: 'numeric', allowInvalid: true, format: '0,0.00'}
        ],
        afterChange: function(change, source) {

            //operator_id="1602"daily_sale_detail_id=204
            dailySaleOne.saveDailySales(url_save_data, change, source);
            /*  clearTimeout(autosaveNotification);
             var JSONsaveResponse = {}, row_index = (change[0][0] >= 0 ? change[0][0] : null), col_index = (change[0][1] ? change[0][1] : null),
             old_value = (change[0][2] ? change[0][2] : null), new_value = (change[0][3] ? change[0][3] : null),
             $trow = $($container_daily_sales.handsontable('getCell', row_index, 0)).parent(),
             daily_sale_detail_id = $trow.data('daily_sale_detail_id') || 0, operator_id = $trow.data('operator_id'),
             data_params_detail = $container_daily_sales.handsontable('getData')[row_index];
             
             if (data_params_detail.type_of_sales_id) {
             $(document).data('type_of_sales_id', data_params_detail.type_of_sales_id);
             }
             
             if (old_value !== new_value) {
             
             if (col_index === 'name') {
             for (var i = 0; i < user_map_ids.length; i++) {
             if (user_map_ids[i].full_name === new_value) {
             operator_id = user_map_ids[i].id;
             $trow.data('operator_id', operator_id);
             break;
             }
             }
             }
             
             data_params = {daily_sale_id: daily_sale_id, daily_sale_detail_id: daily_sale_detail_id, operator_id: $trow.data('operator_id'), data: data_params_detail};
             
             data_params.data.total_calculated = parseFloat($container_daily_sales.handsontable('getCell', row_index, 8).innerHTML);
             data_params.data.difference_money = parseFloat($container_daily_sales.handsontable('getCell', row_index, 10).innerHTML);
             data_params.data.type_of_sales_id = $(document).data('type_of_sales_id');
             
             $.ajax({
             url: url_save_data,
             dataType: 'json',
             type: 'POST',
             data: data_params,
             complete: function(response) {
             autosaveNotification = setTimeout(function() {
             JSONsaveResponse = response.responseJSON;
             if (JSONsaveResponse.daily_sale_detail_id > 0) {
             $trow.data('daily_sale_detail_id', JSONsaveResponse.daily_sale_detail_id)
             daily_sale_detail_id = JSONsaveResponse.daily_sale_detail_id;
             }
             
             if (JSONsaveResponse.daily_sale_id > 0) {
             daily_sale_id = JSONsaveResponse.daily_sale_id;
             }
             console.log('Changes will be autosaved');
             }, 1000);
             }
             });
             }*/
        }
    });

    var handsontable = $container_daily_sales.data('handsontable');
    $('#save_daily_sales').on('click', function(e) {
        e.preventDefault();
        if (!$url_save_data) {
            return false;
        }
        $.ajax({
            url: $url_save_data,
            data: {'data': handsontable.getData()}, //returns all cells' data
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
            error: function(e) {
                console.log('Save error. Ocurrio un error al enviar los datos ' + e.description);
            }
        });
    });

    $container_other_operations.handsontable({
        data: data_type_of_sale_two,
        startRows: 1,
        startCols: 14,
        minSpareRows: 0,
        colWidths: [230, 60, 90, 90, 90, 90, 90, 90, 90, 90, 90, 90, 90, 90],
        contextMenu: true,
        columns: [
            {data: 'name', type: 'text', readOnly: true},
            {data: 'cash_number', type: 'numeric', allowInvalid: true},
            {data: 'opening_cash', type: 'numeric', allowInvalid: true, format: '0,0.00'},
            {data: 'closing_cash', type: 'numeric', allowInvalid: true, format: '0,0.00'},
            {data: 'master_card_amount', type: 'numeric', allowInvalid: true, format: '0,0.00'},
            {data: 'visa_amount', type: 'numeric', allowInvalid: true, format: '0,0.00'},
            {data: 'retirement_amount_pen', type: 'numeric', allowInvalid: true, format: '0,0.00'},
            {data: 'retirement_amount_dol', type: 'numeric', allowInvalid: true, format: '0,0.00'},
            {data: 'total_calculated', type: 'numeric', allowInvalid: true, readOnly: true, renderer: sumCalculateTotalCash, format: '0,0.00'},
            {data: 'total_x_format', type: 'numeric', allowInvalid: true, format: '0,0.00'},
            {data: 'difference_money', type: 'numeric', allowInvalid: true, readOnly: true, renderer: sumCalculateDifferenceCash, format: '0,0.00'},
            {data: 'difference_values', type: 'numeric', allowInvalid: true, format: '0,0.00'},
            {data: 'num_transacctions', type: 'numeric', allowInvalid: true, format: '0,0.00'},
            {data: 'hour_by_cash', type: 'numeric', allowInvalid: true, format: '0,0.00'}
        ],
        afterChange: function(change, source) {
            dailySaleTwo.saveDailySales(url_save_data, change, source);
        }

    });


});