var date = new Date();
var d = date.getDate();
var m = date.getMonth();
var y = date.getFullYear();

console.log(new Date(y, m, 1));

var calendar = $('#calendar').fullCalendar({
    header: {
        left: 'prev,today,next,',
        center: 'title'
    },
    selectable: true,
    selectHelper: true,
//    select: function(start, end, allDay) {
//        var title = prompt('Event Title:');
//        if (title) {
//            calendar.fullCalendar('renderEvent',
//                    {
//                        title: title,
//                        start: start,
//                        end: end,
//                        allDay: allDay
//                    },
//            true // make the event "stick"
//                    );
//        }
//        calendar.fullCalendar('unselect');
//    },
    events: [
        {
            title: 'All Day Event',
            start: new Date(y, m, 1),
            className: 'label label-success'
        },
        {
            title: 'Long Event',
            start: new Date(y, m, d - 5),
            end: new Date(y, m, d - 2),
            className: 'label label-info'
        },
        {
            id: 999,
            title: 'Repeating Event',
            start: new Date(y, m, d - 3, 16, 0),
            allDay: false,
            className: 'label label-warning'
        },
        {
            id: 999,
            title: 'Repeating Event',
            start: new Date(y, m, d + 4, 16, 0),
            allDay: false,
            className: 'label label-inverse'
        },
        {
            title: 'Meeting',
            start: new Date(y, m, d, 10, 30),
            allDay: false,
            className: 'label label-important'
        },
        {
            title: 'Lunch',
            start: new Date(y, m, d, 12, 0),
            end: new Date(y, m, d, 14, 0),
            allDay: false
        },
        {
            title: 'Birthday Party',
            start: new Date(y, m, d + 1, 19, 0),
            end: new Date(y, m, d + 1, 22, 30),
            allDay: false
        },
        {
            title: 'Click for Google',
            start: new Date(y, m, 28),
            end: new Date(y, m, 29),
            url: 'http://google.com/'
        }
    ]
});

