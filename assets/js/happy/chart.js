$(document).ready(function () {
    var ajaxDataRenderer = function(url, plot, options) {
        var ret = null;
        $.ajax({
          // have to use synchronous here, else the function
          // will return before the data is fetched
          async: false,
          url: url,
          dataType:"json",
          success: function(data) {
            ret = data;
          }
        });
        return ret;
      };

      // The url for our json data
    var jsonurl = "http://localhost/test/jsondata.txt";
    var ticks = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Set', 'Oct', 'Nov', 'Dic'];

    plot2 = $.jqplot('chart2', jsonurl, {
        animate: true,
        animateReplot: true,
        dataRenderer: ajaxDataRenderer,
            dataRendererOptions: {
              unusedOptionalUrl: jsonurl
        },
        cursor: {
            show: false,
            zoom: false,
            looseZoom: false,
            showTooltip: true
        },
        legend: {
            show: true,
            location: 'e',
            placement: 'outside'
        },
        seriesDefaults: {
            renderer:$.jqplot.BarRenderer,
            pointLabels: { show: true }
        },
        axes: {
            xaxis: {
                renderer: $.jqplot.CategoryAxisRenderer,
                ticks: ticks
            }
        }
    });

});