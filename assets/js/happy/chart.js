$(document).ready(function() {
    $('#list_subsidiaries_id').on('change', function() {
        /*console.log('prueba chage');
        var ajaxDataRenderer = function(url, plot, options) {
            var ret = null;
            $.ajax({
                async: false,
                url: url,
                dataType: "json",
                method: 'POST',
                data: {subsidiaries_id: $('#list_subsidiaries_id').val()},
                success: function(data) {
                    ret = data;
                }
            });
            return ret.data_bar_chart;
        };

        var jsonurl = $('#data-chart-url').val();
        var ticks = ['Jul', 'Ago', 'Set', 'Oct', 'Nov', 'Dic'];

        $('#dayliSaleBudget').html('');
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
                            showTooltip: false
                    },
            legend: {
                show: true,
                location: 'nw',
                placement: 'inside'
            },
            seriesDefaults: {
                renderer: $.jqplot.BarRenderer,
                pointLabels: {show: true}
            },
            series: [
                {label: 'Venta Real'},
                {label: 'Venta Presupuestada'}
            ],
            axes: {
                xaxis: {
                    renderer: $.jqplot.CategoryAxisRenderer,
                    ticks: ticks//ajaxDataRenderer.data_labels//
                },
                yaxis: {
                    tickOptions: {formatString: 'S/. %d'}
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
                [[['Verwerkende industrie', 9], ['Retail', 6], ['Primaire producent', 7],
                        ['Out of home', 1], ['Groothandel', 3], ['Grondstof', 1], ['Consument', 3], ['Bewerkende industrie', 2]]],
                {
                    title: ' ',
                    seriesDefaults: {
                        shadow: false,
                        renderer: jQuery.jqplot.PieRenderer,
                        rendererOptions: {
                            startAngle: 180,
                            sliceMargin: 4,
                            showDataLabels: true}
                    },
                    legend: {show: true, location: 'w'}
                }
        );

        $('#chart2').bind('resize', function(event, ui) {
            plot1.replot({resetAxes: true});
        });*/
        
        
        var s1 = [[2002, 112000], [2003, 122000], [2004, 104000], [2005, 99000], [2006, 121000],
            [2007, 148000], [2008, 114000], [2009, 133000], [2010, 161000], [2011, 173000]];
        var s2 = [[2002, 10200], [2003, 10800], [2004, 11200], [2005, 11800], [2006, 12400],
            [2007, 12800], [2008, 13200], [2009, 12600], [2010, 13100]];

        var jsonurl = $('#data-chart-url').val();
        var ajaxDataRenderer = function(url, plot, options) {
            var ret = null;
            $.ajax({
                async: false,
                url: url,
                dataType: "json",
                method: 'POST',
                data: {subsidiaries_id: $('#list_subsidiaries_id').val()},
                success: function(data) {
                    ret = data;
                }
            });
            return ret.data_bar_chart;
        };
        
        var ticks = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Set', 'Oct', 'Nov', 'Dic'];
        $('#dayliSaleBudget').html('');
        //plot1 = $.jqplot('dayliSaleBudget', jsonurl, {
        plot1 = $.jqplot('dayliSaleBudget', [s1,s2], {
            // Turns on animatino for all series in this plot.
            animate: true,
            // Will animate plot on calls to plot1.replot({resetAxes:true})
            animateReplot: true,
          /*  dataRenderer: ajaxDataRenderer,
            dataRendererOptions: {
                unusedOptionalUrl: jsonurl
            },*/
            cursor: {
                show: true,
                zoom: true,
                looseZoom: true,
                showTooltip: false
            },
            series: [
                {
                    pointLabels: {
                        show: true
                    },
                    renderer: $.jqplot.BarRenderer,
                    showHighlight: false,
                    yaxis: 'y2axis',
                    rendererOptions: {
                        animation: {
                            speed: 2500
                        },
                        barWidth: 15,
                        barPadding: -15,
                        barMargin: 0,
                        highlightMouseOver: false
                    }
                },
                {
                    rendererOptions: {
                        animation: {
                            speed: 2000
                        }
                    }
                }
            ],
            axesDefaults: {
                pad: 0
            },
            axes: {
                xaxis: {
                    tickInterval: 1,
                    drawMajorGridlines: false,
                    drawMinorGridlines: true,
                    drawMajorTickMarks: false,
                    rendererOptions: {
                        tickInset: 0.5,
                        ticks: ticks,
                        minorTicks: 1
                    }
                },
                yaxis: {
                    tickOptions: {
                        formatString: "$%'d"
                    },
                    rendererOptions: {
                        forceTickAt0: true
                    }
                },
                y2axis: {
                    tickOptions: {
                        formatString: "$%'d"
                    },
                    rendererOptions: {
                        alignTicks: true,
                        forceTickAt0: true
                    }
                }
            },
            highlighter: {
                show: true,
                showLabel: true,
                tooltipAxes: 'y',
                sizeAdjust: 7.5, tooltipLocation: 'ne'
            }
        });
        
        
    });

    $('#list_subsidiaries_id').trigger('change');
});