
$(function() {

    var url_full_calendar = $('#url_full_calendar').val();
    $('#calendar').fullCalendar({
        header: {
            left: 'prev,today,next,',
            center: 'title',
            right: ''
        },
        selectable: true,
        selectHelper: true,
        dayNamesShort: [
            'Do',
            'Lu',
            'Ma',
            'Mi',
            'Ju',
            'Vi',
            'Sa'
        ],
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        buttonText: {
            prev: '&lt;',
            next: '&gt;',
            today: 'Hoy'
        },
        eventSources: [url_full_calendar]
    });


})


