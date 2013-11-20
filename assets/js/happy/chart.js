$(document).ready(function () {
    var ajaxDataRenderer = function(url, plot, options) {
        var ret = null;
        $.ajax({
          async: false,
          url: url,
          dataType:"json",
          success: function(data) {
            ret = data;
          }
        });
        return ret;
      };

    var jsonurl = $('#data-chart-url').val();
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
    
    /*
    var s1 = [200, 600, 700, 1000];
    var s2 = [460, -210, 690, 820];
    var ticks = ['May', 'June', 'July', 'August'];

    var data123 = $('#dataChart1').val();

    var plot1 = $.jqplot('dayliSaleBudget', [s1, s2], {
        animate: true,
        animateReplot: true,
        // The "seriesDefaults" option is an options object that will
        // be applied to all series in the chart.
        seriesDefaults:{
            renderer:$.jqplot.BarRenderer,
            rendererOptions: {fillToZero: true},
            pointLabels: { show: true }
        },
        // Custom labels for the series are specified with the "label"
        // option on the series option.  Here a series option object
        // is specified for each series.
        series:[
            {label:'Venta Real'},
            {label:'Venta Presupuestada'}
        ],
        // Show the legend and put it outside the grid, but inside the
        // plot container, shrinking the grid to accomodate the legend.
        // A value of "outside" would not shrink the grid and allow
        // the legend to overflow the container.
        legend: {
            show: true,
            placement: 'outsideGrid'
        },
        axes: {
            // Use a category axis on the x axis and use our custom ticks.
            xaxis: {
                renderer: $.jqplot.CategoryAxisRenderer,
                ticks: ticks
            },
            // Pad the y axis just a little so bars can get close to, but
            // not touch, the grid boundaries.  1.2 is the default padding.
            yaxis: {
                pad: 1.05,
                tickOptions: {formatString: '$%d'}
            }
        }
    });
    */
    
    
    
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