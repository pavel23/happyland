var myAutocompleteRenderer = function(instance, td, row, col, prop, value, cellProperties) {
    Handsontable.AutocompleteCell.renderer.apply(this, arguments);
    $(td).css({
        color: 'black'
    });
    td.title = 'Type to show the list of options';
};

var sumRowsTotalCash = function(instance, row) {
    var a, b, c, d, e, f;
    a = instance.getDataAtCell(row, 3);
    b = instance.getDataAtCell(row, 4);
    c = instance.getDataAtCell(row, 5);
    d = instance.getDataAtCell(row, 6);
    e = instance.getDataAtCell(row, 7);
    f = instance.getDataAtCell(row, 8);
    return ((b + c + d + e + f) - a);
}
var sumCalculateTotalCash = function(instance, td, row, col, prop, value, cellProperties) {
    Handsontable.TextCell.renderer.apply(this, arguments);

    $(td).css({
        background: '#9DEDF3',
        color: 'black',
        textAlign: 'right'
    });
    td.innerHTML = sumRowsTotalCash(instance, row);
}

var sumCalculateDifferenceCash = function(instance, td, row, col, prop, value, cellProperties) {
    Handsontable.TextCell.renderer.apply(this, arguments);
    var b;
    b = instance.getDataAtCell(row, 10);

    $(td).css({
        background: '#CDFF95',
        color: 'black',
        textAlign: 'right'
    });
    td.innerHTML = sumRowsTotalCash(instance, row) - b;
}

$(function() {
    var $container_daily_sales = $("#daily_sales"),
            $container_other_operations = $('#daily_sales_others'),
            autosaveNotification = 0,
            url_save_data = $('#save_daily_sales').attr('href'),
            $url_data_autocomplete = $('#url-data-operators').val(),
            user_map_ids = null, daily_sale_id = $('#dayli_sale_id').val() || 0;


    $container_daily_sales.handsontable({
        startRows: 1,
        startCols: 14,
        minSpareRows: 1,
        rowHeaders: true,
        contextMenu: true,
        colHeaders: [
            'ID',
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
            {type: 'numeric', allowInvalid: false, readOnly: true},
            {
                type: {renderer: myAutocompleteRenderer, editor: Handsontable.AutocompleteEditor},
                options: {items: 10},
                source: function(params, process) {
                    $.ajax({
                        url: $url_data_autocomplete,
                        contentType: 'application/json; charset=utf-8',
                        success: function(autocompleteResponse) {
                            process(autocompleteResponse.full_names);
                            user_map_ids = autocompleteResponse.ids;
                        }
                    });
                },
                strict: true
            },
            {type: 'numeric', allowInvalid: true},
            {type: 'numeric', allowInvalid: true},
            {type: 'numeric', allowInvalid: true},
            {type: 'numeric', allowInvalid: true},
            {type: 'numeric', allowInvalid: true},
            {type: 'numeric', allowInvalid: true},
            {type: 'numeric', allowInvalid: true},
            {type: 'numeric', allowInvalid: true, readOnly: true, renderer: sumCalculateTotalCash},
            {type: 'numeric', allowInvalid: true},
            {type: 'numeric', allowInvalid: true, readOnly: true, renderer: sumCalculateDifferenceCash},
            {type: 'numeric', allowInvalid: true},
            {type: 'numeric', allowInvalid: true},
            {type: 'numeric', allowInvalid: true}
        ],
        afterChange: function(change, source) {
            
            if (source === 'loadData') {
                console.log('test')
                return;
            }

            clearTimeout(autosaveNotification);
            var data_params = {}, JSONsaveResponse = {}, row_index = (change[0][0] >= 0 ? change[0][0] : null), col_index = (change[0][1] >= 0 ? change[0][1] : null),
                    old_value = (change[0][2] ? change[0][2] : null), new_value = (change[0][3] ? change[0][3] : null), $trow = $($container_daily_sales.handsontable('getCell', row_index, 0)).parent(),
                    daily_sale_detail_id = $trow.data('daily_sale_detail_id') || 0, user_id = null;

            if (old_value !== new_value) {

                if (col_index === 1) {
                    $container_daily_sales.handsontable('setDataAtCell', row_index, (col_index - 1), '');
                    for (var i = 0; i < user_map_ids.length; i++) {
                        if (user_map_ids[i].full_name === new_value) {
                            user_id = user_map_ids[i].id;
                            break;
                        }
                    }
                }

                data_params = {daily_sale_id: daily_sale_id, daily_sale_detail_id: daily_sale_detail_id};
                data_params.data = $container_daily_sales.handsontable('getData')[row_index];

                if (user_id) {
                    data_params.data[1] = parseFloat(user_id);
                }

                data_params.data[9] = parseFloat($container_daily_sales.handsontable('getCell', row_index, 9).innerHTML);
                data_params.data[11] = parseFloat($container_daily_sales.handsontable('getCell', row_index, 11).innerHTML);

                console.log(data_params);
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
            }
        }
    });

    /*  var handsontable = $container_daily_sales.data('handsontable');
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
     
     var typeOfSale = [
     {'name':'BOLETA', 'retiro':'100'},
     {'name':'VENTA SATELITES', 'retiro':'200'},
     {'name':'VENTA ZIPPERS', 'retiro':'300'},
     {'name':'FACTURA', 'retiro':'400'},
     {'name':'CUMPLEÑOS ( Venta en Contratos)', 'retiro':'500'},
     {'name':'DIFERENCIA DE CAJERO', 'retiro':'600'}
     ];
     
     
     $.ajax({
     url: $('#url-data-other_daily_sales').val(),
     contentType: "application/json; charset=utf-8",
     dataType: 'json',
     type: 'GET',
     success: function(responseData) {
     //handsontable.loadData(responseData.responseText);
     console.log(responseData.responseJSON);
     return $.parseJSON(responseData.responseJSON);
     
     }
     });
     $.ajax({
     url: $('#url-data-other_daily_sales').val(),
     dataType: 'json',
     contentType: 'application/json; charset=utf-8',
     type: 'GET',
     success: function (res) {
     handsontable.loadData(res.data);
     $console.text('Data loaded');
     }
     });               
     
     $container_other_operations.handsontable({
     data: typeOfSale,
     startRows: 1,
     startCols: 6,
     minSpareRows: 0,
     rowHeaders: true,
     contextMenu: true,
     colHeaders: [
     'ID',
     'Tipo de Venta',
     'Retiro (S/.)', 'Retiro ($)',
     'Total<br/>Efectivo (S/.)',
     'Total<br/>Formato Z (S/.)'
     ],
     columns: [
     {data: '', readOnly: true},
     {data: 'name', readOnly: true},
     {data: 'retiro', type: 'numeric'},
     {data: 2, type: 'numeric'},
     {data: 3, type: 'numeric'},
     {data: 4, type: 'numeric'}
     ]
     
     });*/

    /*$.ajax({
     url: $('#url-data-other_daily_sales').val(),
     dataType: 'json',
     type: 'GET',
     success: function (res) {
     $container_other_operations.handsontable.loadData(res);
     console.log(res);
     console.log('Data loaded');
     }
     });*/
});