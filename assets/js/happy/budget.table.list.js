$(function() {
    $('#dataTable').dataTable({
        'bProcessing': true,
        'sAjaxSource': $('#url-load-data').val(),
        'sPaginationType': 'bootstrap',
        'aoColumns': [
            {
                'mDataProp': null,
                'sClass': "control center",
                'sDefaultContent': '<img src="' + $('#url-image-btn').val() + '">'
            },
            {'mDataProp': 'subsidiarie_name'},
            {'mDataProp': 'month_text'},
            {'mDataProp': "budget_amount"},
            {'mDataProp': "edit_btn"}
        ]
    });

    //console.log($('#dataTable td.control'));
    $('#dataTable td.control').on('click', function() {
        console.log('test');
        var nTr = this.parentNode;
        var i = $.inArray(nTr, anOpen);

        if (i === -1) {
            $('img', this).attr('src', sImageUrl + "details_close.png");
            oTable.fnOpen(nTr, fnFormatDetails(oTable, nTr), 'details');
            anOpen.push(nTr);
        }
        else {
            $('img', this).attr('src', sImageUrl + "details_open.png");
            oTable.fnClose(nTr);
            anOpen.splice(i, 1);
        }
    });

    function fnFormatDetails(oTable, nTr)
    {
        var oData = oTable.fnGetData(nTr);
        var sOut =
                '<div class="innerDetails">' +
                '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
                '<tr><td>Rendering engine:</td><td>' + oData.subsidiarie_name + '</td></tr>' +
                '<tr><td>Browser:</td><td>' + oData.month_text + '</td></tr>' +
                '<tr><td>Platform:</td><td>' + oData.budget_amount + '</td></tr>'
                '</table>' +
                '</div>';
        return sOut;
    }
});