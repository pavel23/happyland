                  
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
            prev: '&lt; Anterior',
            next: 'Siguiente &gt;',
            today: 'Mes Actual'
        },
        
        eventSources: [
            {
                url: url_full_calendar,
                type: 'GET',
                data: {
                    subsidiaries_id: $('#list_subsidiaries_id').val()
                },
                error: function() {
                    alert('ocurrio un error al cargar el calendario!');
                }/*,
                color: 'yellow',   // a non-ajax option
                textColor: 'black' // a non-ajax option*/
            }
        ]
    });

    $('#list_subsidiaries_id').change(function(){
        $('#calendar').html('');
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
                prev: '&lt; Mes Anterior ',
                next: 'Siguiente &gt;',
                today: 'Actual'
            },

            eventSources: [
                {
                    url: url_full_calendar,
                    type: 'GET',
                    data: {
                        subsidiaries_id: $(this).val()
                    },
                    error: function() {
                        alert('ocurrio un error al cargar el calendario!');
                    }
                }
            ]
        });
    });
})


