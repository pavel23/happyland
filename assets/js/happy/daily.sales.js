var myAutocompleteRenderer = function(instance, td, row, col, prop, value, cellProperties) {
    Handsontable.AutocompleteCell.renderer.apply(this, arguments);
    $(td).css({
        color: 'black'
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

$(function() {
    var $container = $("#daily_sales"), autosaveNotification = 0, $url_site = $('#url-site').val();
    
    $container.handsontable({
        startRows: 1,
        startCols: 14,
        rowHeaders: true,
        colHeaders: [
            'ID',
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
            {
                type: 'text', 
                allowInvalid: false, 
                readOnly: true
            },
            {
                type: {
                    renderer: myAutocompleteRenderer,
                    editor: Handsontable.AutocompleteEditor
                },
                source: function(params, process) {
                    $.ajax({
                        url: $('#url-data-operators').val(),
                        contentType: 'application/json; charset=utf-8',
                        success: function(response) {
                            process(response.full_names);
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
        minSpareRows: 1,
        contextMenu: true,
        afterChange: function(change, source) {
            if (source === 'loadData') {
                console.log('aca carga la data');
                return; //don't save this change
            }

            clearTimeout(autosaveNotification);
            var row_index = (change[0][0]>=0 ? change[0][0] : null);
            var col_index = (change[0][1]>=0 ? change[0][1] : null);
            var old_value = (change[0][2] ? change[0][2] : null);
            var new_value = (change[0][3] ? change[0][3] : null);

            if (old_value !== new_value) {
                if(col_index==1){
                    $container.handsontable('setDataAtCell', row_index, (col_index-1) , 'COD00'+row_index)   
                }
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

    $('#save_daily_sales').on('click', function(e) {
        e.preventDefault();

        var href = $(this).attr('href');

        if (!href) {
            return false;
        }

        $.ajax({
            url: href,
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

/*
$(function() {
    
    
    var container = {
        codes: [
            {code: 100, label: "Continue"},
            {code: 200, label: "OK"},
            {code: 400, label: "Bad Request"},
            {code: 401, label: "Unauthorized"},
            {code: 403, label: "Forbidden"},
            {code: 500, label: "Server Error"}],
        codeLabels: ["Continue", "OK", "Bad Request", "Unauthorized", "Forbidden", "Server Error"]
    };

    function RequestLog(code, container) {
        this.container = container;
        this.Code = code;
        Object.defineProperty(this, "StatusCode", {
            //writable: true,
            configurable: true,
            set: function(value) {
                for (var i = 0; i < container.codes.length; i++) {
                    console.log(i + '->' + container.codes[i].label);
                    if (container.codes[i].label === value) {
                        this.Code = container.codes[i].code;
                        break;
                    }
                }
            },
            get: function() {
                for (var i = 0; i < container.codes.length; i++) {
                    if (container.codes[i].code === this.Code) {
                        return container.codes[i].label;
                    }
                }
                return "";
            }
        });
        return this;
    }

    var viewmodel = {
        data: [new RequestLog(200, container), new RequestLog(400, container)]
    };

    $("#table-test").handsontable({
        data: viewmodel.data,
        startRows: 0,
        minSpareRows: 1,
        autoWrapRow: true,
        colHeaders: ["Code", "Status"],
        columns: [
            {data: "Code", width: 200, readOnly: true},
            {data: "StatusCode", type: "autocomplete", source: container.codeLabels, strict: true, width: 200},
        ]
    });
});
*/