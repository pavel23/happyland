$(document).ready(function() {
    var jsonurl = $('#data-chart-url').val();
    $('#list_subsidiaries_id').on('change', function() {
        $.ajax({
            async: false,
            url: jsonurl,
            dataType: 'json',
            method: 'POST',
            data: {subsidiaries_id: $('#list_subsidiaries_id').val()},
            success: function(chart_data) {
                $('#dayliSaleBudget').highcharts({
                    chart: {
                        zoomType: 'xy'
                    },
                    title: {
                        text: 'Presupuesto Vs Venta Real'
                    },
                    /*subtitle: {
                     text: 'Source: WorldClimate.com'
                     },*/
                    xAxis: [{
                            categories: chart_data.month_budget
                        }],
                    yAxis: [{// Primary yAxis
                            labels: {
                                format: 'S/. {value}',
                                style: {
                                    color: Highcharts.getOptions().colors[2]
                                }
                            },
                            title: {
                                text: 'Venta Real',
                                style: {
                                    color: Highcharts.getOptions().colors[2]
                                }
                            }
                        }, {// Secondary yAxis
                            title: {
                                text: 'Presupuesto',
                                style: {
                                    color: Highcharts.getOptions().colors[1]
                                }
                            },
                            labels: {
                                format: 'S/. {value}',
                                style: {
                                    color: Highcharts.getOptions().colors[1]
                                }
                            },
                            opposite: true
                        }],
                    tooltip: {
                        shared: true
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'left',
                        x: 120,
                        verticalAlign: 'top',
                        y: 100,
                        floating: true,
                        backgroundColor: '#FFFFFF'
                    },
                    series: [{
                            name: 'Presupuesto',
                            color: Highcharts.getOptions().colors[1],
                            type: 'column',
                            yAxis: 0,
                            data: chart_data.budget_amount,
                            tooltip: {
                                valuePrefix: 'S/. '
                            }

                        }, {
                            name: 'Venta Real',
                            color: Highcharts.getOptions().colors[2],
                            type: 'spline',
                            data: chart_data.daily_sale_avg,
                            tooltip: {
                                valuePrefix: 'S/. '
                            }
                        }]
                });

                /**
                 * 
                 * */

                $('#gauge_chart').highcharts({
                    chart: {
                        type: 'gauge',
                        plotBackgroundColor: null,
                        plotBackgroundImage: null,
                        plotBorderWidth: 0,
                        plotShadow: false
                    },
                    title: {
                        text: 'Ventas %'
                    },
                    pane: {
                        startAngle: -90,
                        endAngle: 90,
                        center: ['50%', '100%'],
                        background: [{
                                /*backgroundColor: {
                                 linearGradient: {x1: 0, y1: 0, x2: 0, y2: 1},
                                 stops: [
                                 [0, '#FFF'],
                                 [1, '#333']
                                 ]
                                 },*/
                                borderWidth: 0,
                                outerRadius: '109%'
                            }, {
                                backgroundColor: {
                                    linearGradient: {x1: 0, y1: 0, x2: 0, y2: 1},
                                    stops: [
                                        [0, '#333'],
                                        [1, '#FFF']
                                    ]
                                },
                                borderWidth: 1,
                                outerRadius: '107%'
                            }, {
                                // default background
                            }, {
                                backgroundColor: '#DDD',
                                borderWidth: 0,
                                outerRadius: '105%',
                                innerRadius: '103%'
                            }]
                    },
                    // the value axis
                    yAxis: {
                        min: 0,
                        max: 200,
                        minorTickInterval: 'auto',
                        minorTickWidth: 1,
                        minorTickLength: 10,
                        minorTickPosition: 'inside',
                        minorTickColor: '#666',
                        tickPixelInterval: 30,
                        tickWidth: 2,
                        tickPosition: 'inside',
                        tickLength: 10,
                        tickColor: '#666',
                        labels: {
                            step: 2,
                            rotation: 'auto'
                        },
                        title: {
                            text: 'Vta. Real/Ppto'
                        },
                        plotBands: [{
                                from: 0,
                                to: 120,
                                color: '#55BF3B' // green
                            }, {
                                from: 120,
                                to: 160,
                                color: '#DDDF0D' // yellow
                            }, {
                                from: 160,
                                to: 200,
                                color: '#DF5353' // red
                            }]
                    },
                    series: [{
                            name: 'Speed',
                            data: [80],
                            tooltip: {
                                //valueSuffix: ' km/h'
                            }
                        }]
                }
                );
            }
        });
    });
    $('#list_subsidiaries_id').trigger('change');
});