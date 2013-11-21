$(function() {
    $('#dataTable').dataTable({
        'sAjaxSource': $('#url-load-data').val(),
        'sPaginationType': "bootstrap"
    });
    
});