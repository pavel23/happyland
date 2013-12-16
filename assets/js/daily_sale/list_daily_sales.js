$(function() {
    var url_full_calendar = $('#url_full_calendar').val();
    $('#list_subsidiaries_id').change(function() {
        $this_select = $(this);
        $('#calendar').html('');
        $('#calendar').fullCalendar({
            header: {
                left: 'prev,today,next,',
                center: 'title',
                right: ''
            },
            firstDay: 1,
            selectable: true,
            selectHelper: true,
            dayNamesShort: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
            monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            buttonText: {
                prev: '&lt; Anterior',
                next: 'Siguiente &gt;',
                today: 'Mes Actual'
            },
            eventSources: [
                {
                    url: url_full_calendar,
                    method: 'POST',
                    dataType: 'json',
                    data: {
                        subsidiaries_id: $this_select.val()
                    },
                    error: function() {
                        alert('ocurrio un error al cargar el calendario!');
                    },
                    success: function() {
                        console.log($(this));
                    }
                }
            ],
            eventRender: function(event, element) {
                $(element).append(event.z_amount);
                $(element).append('<br />');
                $(element).append(event.status);
                $(element).append('<br />');
                $(element).append(event.description);
            }
        });
    });

    $('#list_subsidiaries_id').trigger('change');
});