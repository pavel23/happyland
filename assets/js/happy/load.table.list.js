$(function() {
    $('#dataTable').dataTable({
        'bProcessing': true,
        'sAjaxSource': $('#url-load-data').val(),
        'sPaginationType': 'bootstrap'/*,
        'aoColumns': [
            { 'mDataProp': 'id' },
            { 'mDataProp': 'name' },
            { 'mDataProp': 'description' },
            { 'mDataProp': 'status' },
            { 'mDataProp': 'edit_btn' }
        ]*/
    });
});