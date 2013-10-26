var myAutocompleteRenderer = function(instance, td, row, col, prop, value, cellProperties) {
    Handsontable.AutocompleteCell.renderer.apply(this, arguments);
    $(td).css({
        // fontStyle: 'italic',
        color: 'black',
        //fontWeight: 'bold'
    });
    td.title = 'Type to show the list of options';
};

var sumRowsTotalCash = function(instance, row) {
    var a, b, c, d, e, f;
    a = instance.getDataAtCell(row, 2);
    b = instance.getDataAtCell(row, 3);
    c = instance.getDataAtCell(row, 4);
    d = instance.getDataAtCell(row, 5);
    e = instance.getDataAtCell(row, 6);
    f = instance.getDataAtCell(row, 7);
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
    b = instance.getDataAtCell(row, 9);
    $(td).css({
        background: '#CDFF95',
        color: 'black',
        textAlign: 'right'
    });
    td.innerHTML = sumRowsTotalCash(instance, row) - b;
}

/*function colorHighlighter(item) {
  var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&');
  var label = item.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
    return '<strong>' + match + '</strong>';
  });
  return '<span style="margin-right: 10px; background-color: ' + item + '">&nbsp;&nbsp;&nbsp;</span>' + label;
}*/

$(function() {
    var $container = $("#example1");
    var $parent = $container.parent();
    var autosaveNotification;
    var $url_site = $('#url-site').val();
    $container.handsontable({
        startRows: 1,
        startCols: 14,
        rowHeaders: true,
        colHeaders: [
            'Nombres y Apellidos',
            'Caja',
            'Apertura<br />Inicicio (S/.)',
            'Apertura<br />Fin (S/.)',
            'Tarjeta<br />Master Card (S/.)',
            'Tarjeta<br />Visa (S/.)',
            'Retiro (S/.)', 'Retiro ($)',
            'Total<br/>Efectivo (S/.)',
            'Total<br/>Formato X (S/.)',
            'Diferencia<br />Dinero (S/.)',
            'Diferencia<br />Valores',
            'Transacciones',
            'Horas/Caja'
        ],
        columns: [
            {
                type: {
                        renderer: myAutocompleteRenderer, 
                        editor: Handsontable.AutocompleteEditor
                },
                source: function(params, process) {
                        $.ajax({
                            url: $('#url-data-operators').val(),
                            success: function(response) {
                                process(response);
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
            {type: 'numeric', allowInvalid: true, readOnly:true, renderer: sumCalculateTotalCash},
            {type: 'numeric', allowInvalid: true},
            {type: 'numeric', allowInvalid: true, readOnly:true, renderer: sumCalculateDifferenceCash},
            {type: 'numeric', allowInvalid: true},
            {type: 'numeric', allowInvalid: true},
            {type: 'numeric', allowInvalid: true}
        ],
        minSpareRows: 1,
        contextMenu: true,
        /*cells: function(r, c, prop) {
            var cellProperties = {};
            if (c === 8 || c === 10) {
                cellProperties.readOnly = true;
            }
            return cellProperties;
        },*/
        afterChange: function(change, source) {
            if (source === 'loadData') {
                console.log('aca carga la data');
                return; //don't save this change
            }

            clearTimeout(autosaveNotification);
            var row_index = (change[0][0] ? change[0][0] : null);
            var col_index = (change[0][1] ? change[0][1] : null);
            var old_value = (change[0][2] ? change[0][2] : null);
            var new_value = (change[0][3] ? change[0][3] : null);

            if (old_value !== new_value) {
                $.ajax({
                    url: $url_site,
                    dataType: 'json',
                    type: 'POST',
                    data: {'row_index': row_index, 'col_index': col_index, 'old_value': old_value, 'new_value': new_value}, //contains changed cells' data
                    complete: function(reponseData) {
                        console.log(reponseData);
                        autosaveNotification = setTimeout(function() {
                            console.log('Changes will be autosaved');
                        }, 1000);
                    }
                });
            }
        }
    });

    var handsontable = $container.data('handsontable');
    $parent.find('button[name=load]').click(function() {
        $.ajax({
            url: $url_site,
            dataType: 'json',
            type: 'GET',
            success: function(res) {
                handsontable.loadData(res.data);
                console.log('Data loaded');
            }
        });
    });

    $parent.find('button[name=save]').click(function() {
        $.ajax({
            url: $url_site,
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
});