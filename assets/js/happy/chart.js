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

    plot2 = $.jqplot('dayliSaleBudget', jsonurl, {
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
            location: 'nw',
            placement: 'inside'
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
        },
        rendererOptions: {
            animation: {
                speed: 2500
            },
            barWidth: 15,
            barPadding: -15,
            barMargin: 0,
            highlightMouseOver: false
        }
    });
    
    
    
    plot2 = jQuery.jqplot('chart2', 
    [[['Verwerkende industrie', 9],['Retail', 6], ['Primaire producent', 7], 
    ['Out of home', 1],['Groothandel', 3], ['Grondstof', 1], ['Consument', 3], ['Bewerkende industrie', 2]]], 
    {
      title: ' ', 
      seriesDefaults: {
        shadow: false, 
        renderer: jQuery.jqplot.PieRenderer, 
        rendererOptions: { 
          startAngle: 180, 
          sliceMargin: 4, 
          showDataLabels: true } 
      }, 
      legend: { show:true, location: 'w' }
    }
  );
  
  $('#chart2').bind('resize', function(event, ui) {
        plot1.replot( { resetAxes: true } );
    });
  
});