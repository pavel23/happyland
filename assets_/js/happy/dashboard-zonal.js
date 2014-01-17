$(function() {
    var setGauge = function(_obj_container, _gauge_config, _gauge_data, _gauge_name, _gauge_bgcolor) {
        $(_obj_container).highcharts({
            chart: {
                type: 'gauge',
                backgroundColor: _gauge_bgcolor,
                //borderColor: _gauge_bgcolor,
                plotBackgroundColor: null,
                plotBackgroundImage: null,
                borderWidth: 0,
                plotShadow: false
            },
            credits: {
                enabled: false
            },
            legend: {
                enabled: true
            },
            exporting: {
                enabled: true
            },
            title: {
                text: _gauge_name,
                style: {
                    fontWeight: 'bold',
                    font: '18px "Helvetica Neue",Helvetica,Arial,sans-serif',
                    color: '#FFF'
                }
            },
            pane: {
                startAngle: -90,
                endAngle: 90,
                background: [{
                        backgroundColor: {
                            linearGradient: {x1: 0, y1: 0, x2: 0, y2: 1},
                            stops: [
                                [0, '#FFF'],
                                [1, '#333']
                            ]
                        },
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
                        // default gauge background
                    }, {
                        backgroundColor: _gauge_bgcolor,
                        borderWidth: 0,
                        outerRadius: '105%',
                        innerRadius: '103%'
                    }]
            },
            // the value axis
            yAxis: {
                min: 0,
                max: 150,
                minorTickInterval: 'auto',
                minorTickWidth: 1,
                minorTickLength: 5,
                minorTickPosition: 'inside',
                minorTickColor: '#666',
                tickPixelInterval: 30,
                tickWidth: 2,
                tickPosition: 'inside',
                tickLength: 15,
                tickColor: '#666',
                labels: {
                    step: 1,
                    rotation: 'auto'
                },
                title: {
                    text: _gauge_config.gauge_title
                },
                plotBands: [{
                        from: 100,
                        to: 150,
                        color: '#55BF3B' // green
                    }, {
                        from: 95,
                        to: 100,
                        color: '#DDDF0D' // yellow
                    }, {
                        from: 0,
                        to: 95,
                        color: '#DF5353' // red
                    }]
            },
            series: [{
                    name: _gauge_config.tooltip_title,
                    data: [_gauge_data],
                    tooltip: {
                        valueSuffix: ' %'
                    }
                }]
        }
        );
    };

    var setRadializeColors=function() {
        // Radialize the colors
        Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function(color) {
            return {
                radialGradient: {cx: 0.5, cy: 0.3, r: 0.7},
                stops: [
                    [0, color],
                    [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
                ]
            };
        });
    }
    setRadializeColors();
    var setPieChart = function(_obj_container, _pie_data) {
        // Build the chart
        $(_obj_container).highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: 'Browser market shares at a specific website, 2010'
            },
            credits: {
                enabled: false
            },
            tooltip: {
        	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        color: '#000000',
                        connectorColor: '#000000',
                        formatter: function() {
                            return '<strong>' + number_format(this.percentage, 2, '.') + ' %</strong><br />S/.' + number_format(this.point.y, 2, '.');
                        }
                    },
                    showInLegend: false//true
                }
            },
            series: [{
                type: 'pie',
                name: 'Browser share',
                data: _pie_data
            }]
        });
    }

    $.ajax({
        async: false,
        url: $('#data-gauge-url').val(),
        dataType: 'json',
        method: 'POST',
        data: {n_year: 2013},
        success: function(gauge_data) {
            var gauge_config = {
                gauge_title: 'Vta. Real/Ppto',
                tooltip_title: 'Covertura Presupuestal',
            }
            setGauge($('#gauge_zonal1'), gauge_config, gauge_data[0].ppto_avg, gauge_data[0].name, '#46B8DA');
            setGauge($('#gauge_zonal2'), gauge_config, gauge_data[1].ppto_avg, gauge_data[1].name, '#EEA236');
            setGauge($('#gauge_zonal3'), gauge_config, gauge_data[2].ppto_avg, gauge_data[2].name, '#4CAE4C');

            console.log(gauge_data[1].pie);
            setPieChart($('#pie_zonal1'), gauge_data[0].pie);
            setPieChart($('#pie_zonal2'), gauge_data[1].pie);
            setPieChart($('#pie_zonal3'), gauge_data[2].pie);
        }

    });
    
    $("#myTable").tablesorter(); 

});