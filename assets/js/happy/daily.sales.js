var myAutocompleteRenderer = function(instance, td, row, col, prop, value, cellProperties) {
    Handsontable.AutocompleteCell.renderer.apply(this, arguments);
    $(td).css({
        color: 'black'
    });
    td.title = 'Type to show the list of options';
};

var sumRowsTotalCash = function(instance, row) {
    var a, b, c, d, e, f;
    a = instance.getDataAtCell(row, 4);
    b = instance.getDataAtCell(row, 5);
    c = instance.getDataAtCell(row, 6);
    d = instance.getDataAtCell(row, 7);
    e = instance.getDataAtCell(row, 8);
    f = instance.getDataAtCell(row, 9);
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
    b = instance.getDataAtCell(row, 11);
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
        $url_save_data = $('#save_daily_sales').attr('href'), 
        $url_data_autocomplete=$('#url-data-operators').val(),
        $user_map_ids = null;

    $container_daily_sales.handsontable({
        startRows: 1,
        startCols: 14,
        minSpareRows: 1,
        rowHeaders: true,
        contextMenu: true,
        colHeaders: [
            'ID',
            'COD',
            'Nombres y Apellidos',
            'Caja',
            'Apertura<br />Inicio (S/.)',
            'Apertura<br />Fin (S/.)',
            'Tarjeta<br />Master Card (S/.)',
            'Tarjeta<br />Visa (S/.)',
            'Retiro (S/.)', 'Retiro ($)',
            'Total<br/>Efectivo (S/.)',
            'Total<br/>Formato X (S/.)',
            'Dif.<br />Dinero (S/.)',
            'Dif.<br />Valores',
            'Transacciones',
            'Horas/Caja'
        ],
        columns: [
            {type: 'numeric', allowInvalid: false, readOnly: true},
            {type: 'text', allowInvalid: false, readOnly: true},
            {
                type: {renderer: myAutocompleteRenderer, editor: Handsontable.AutocompleteEditor},
                options: {items: 10},
                source: function(params, process) {
                    $.ajax({
                        url: $url_data_autocomplete,
                        contentType: 'application/json; charset=utf-8',
                        success: function(autocompleteResponse) {
                            process(autocompleteResponse.full_names);
                            $user_map_ids = autocompleteResponse.ids;
                        }
                    });
                },
                strict: true,
                //highlighter: colorHighlighter,
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
                console.log('aca carga la data para edición');
                return;
            }
            clearTimeout(autosaveNotification);
            var row_index = (change[0][0]>=0 ? change[0][0] : null);
            var col_index = (change[0][1]>=0 ? change[0][1] : null);
            var old_value = (change[0][2] ? change[0][2] : null);
            var new_value = (change[0][3] ? change[0][3] : null);

            if (old_value !== new_value) {
                if(col_index===2){
                    $container_daily_sales.handsontable('setDataAtCell', row_index, (col_index-1) , '');
                    for (var i = 0; i < $user_map_ids.length; i++) {
                        if ($user_map_ids[i].full_name === new_value) {
                            $container_daily_sales.handsontable('setDataAtCell', row_index, (col_index-1) , ''+$user_map_ids[i].id);
                            break;
                        }
                    }
                }
                $.ajax({
                    url: $url_save_data,
                    dataType: 'json',
                    type: 'POST',
                    data: {'row_index': row_index, 'col_index': col_index, 'old_value': old_value, 'new_value': new_value},
                    complete: function(saveResponse) {
                        autosaveNotification = setTimeout(function() {
                            $JSONsaveResponse = $.parseJSON(saveResponse.responseText);
                            if(!$container_daily_sales.handsontable('getDataAtCell', row_index, 0)>0){
                                $container_daily_sales.handsontable('setDataAtCell', row_index, 0 , $JSONsaveResponse.id);
                            }
                            console.log('Changes will be autosaved');
                        }, 1000);
                    }
                });
            }
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

    
    var typeOfSale = [
      ['BOLETA'],
      ['VENTA SATELITES'],
      ['VENTA ZIPPERS'],
      ['FACTURA'],
      ['CUMPLEAÑOS ( Venta en Contratos)'],
      ['DIFERENCIA DE CAJERO']
    ];

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
            {data: ''},
            {data: 0},
            {data: 1},
            {data: 2},
            {data: 3},
            {data: 4}
        ],

    });
});