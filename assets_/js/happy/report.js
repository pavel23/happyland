$(function() {
    $('#report_date').datepicker(

    ).on('changeDate', function(ev){
        $(this).datepicker('hide');
        console.log('petición ajax para dias ' + ev.date.valueOf());
    });
    
  
    $('#report_range_date').daterangepicker(
        {
            locale: {
                applyLabel: daterangepicker_es.applyLabel,
                cancelLabel: daterangepicker_es.cancelLabel,
                fromLabel: daterangepicker_es.fromLabel,
                toLabel: daterangepicker_es.toLabel,
                weekLabel: daterangepicker_es.weekLabel,
                customRangeLabel: daterangepicker_es.customRangeLabel,
                daysOfWeek: daterangepicker_es.daysMin,
                monthNames: daterangepicker_es.monthsShort,
                firstDay: 0
            },
            ranges: {
                'Hoy': [moment(), moment()],
                'Ayer': [moment().subtract('days', 1), moment().subtract('days', 1)],
                'Últimos 7 Días': [moment().subtract('days', 6), moment()],
                'Últimos 30 Días': [moment().subtract('days', 29), moment()],
                'Este Mes': [moment().startOf('month'), moment().endOf('month')],
                'Último Mes': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
            },
            startDate: moment().subtract('days', 29),
            endDate: moment()
        },
        function(start, end) {
            $('#report_range_date').find('span').html(start.format('D') + ' ' + daterangepicker_es.months[start.format('MM')-1] + ', ' + start.format('YYYY') + ' - ' + end.format('D') + ' ' + daterangepicker_es.months[end.format('MM')-1] + ', ' + end.format('YYYY'));
            console.log('Petición AJAX con los datos start=> ' + start + ' end => ' + end);
        }
    );
});