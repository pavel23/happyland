    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
var url_full_calendar = $('#url_full_calendar').val();
var calendar = $('#calendar').fullCalendar({
    header: {
        left: 'prev,today,next,',
        center: 'title'
    },
    selectable: true,
    selectHelper: true,
  
    eventSources: [url_full_calendar],
  
//    events: function(start, end, callback) {
//        var events = [];
//        $.ajax({
//            url: url_full_calendar,
//            dataType: 'json',
//            type:'post',
//            data: {
//                start: Math.round(start.getTime() / 1000),
//                end: Math.round(end.getTime() / 1000)
//            },
//            success: function(response) {
//                console.log(response);
//                
//                  events.push({
//                        title: response.status,
//                        start: new Date(y, m, 29) // will be parsed
//                    });
//                
////                var events = [];
////                $(doc).find('event').each(function() {
////                    events.push({
////                        title: $(this).attr('title'),
////                        start: $(this).attr('start') // will be parsed
////                    });
////                });
//                               callback(events);
//            }
//        });
//    }
});

