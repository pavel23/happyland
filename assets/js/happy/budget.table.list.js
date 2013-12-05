$(function() {
    var anOpen = [];
    var sImageUrl = $('#url-image-btn-base').val();
    var oTable = $('#dataTable').dataTable({
        'bProcessing': true,
        'sAjaxSource': $('#url-load-data').val(),
        'sPaginationType': 'bootstrap',
        'aoColumns': [
            /*{
                'mDataProp': null,
                'sClass': "control center",
                'sDefaultContent': '<img src="' + sImageUrl + 'details_open.png">'
            },*/
            {'mDataProp': 'name', 'sClass': 'auto'},
            {'mDataProp': 'budget_current_year', 'sClass': 'right'},
            {'mDataProp': 'budget_last_year', 'sClass': 'right'},
            {'mDataProp': 'btn_edit', 'sClass': 'control center'}
        ]
    });
});