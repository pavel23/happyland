/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(function() {
    var config = {
        '.chosen-select': {},
        '.chosen-select-deselect': {allow_single_deselect: true},
        '.chosen-select-no-single': {disable_search_threshold: 10},
        '.chosen-select-no-results': {no_results_text: 'Oops, nothing found!'},
        '.chosen-select-width': {width: "95%"}
    }
    for (var selector in config) {
        $(selector).chosen(config[selector]);
    }
    
    
    $('#set_permission_by_module').on('click', function(e) {
        e.preventDefault();
        var $this = $(this);
        $('.chosen-select').trigger('chosen:updated');
        var JsonObjChosen   = $('.chosen-select').val();
            JsonObjChosen   = JSON.parse('[' + JsonObjChosen + ']');

        $.post(
                $this.attr('href'), 
                {'permission_filter': JsonObjChosen}, 
                function(dataResponse, textStatus, jqXHR){
                    var modalPermission = (function() {
                    var elem,
                        hideHandler,
                        that = {};
                        that.init = function(options) {
                            elem = $(options.selector);
                        };
                        that.show = function(text) {
                            clearTimeout(hideHandler);
                            elem.find("span").html(text);
                            elem.delay(200).fadeIn().delay(4000).fadeOut();
                        };
                    return that;
                    });
                    bootbox.dialog({
                        ajax:true,
                        message: dataResponse,
                        title: "Asignar Permisos por Módulo",
                        buttons: {
                            success: {
                                label: "Asignar!",
                                className: "btn-success",
                                callback: function() {
                                    $.post(
                                            $('#formpermission').attr('action'), 
                                            $('#formpermission').serialize(), 
                                            function(dataResponse, textStatus, jqXHR){
                                                //console.log($('.form-horizontal').serialize());
                                                console.log(dataResponse);
                                            });
                                    
                                }
                            },
                            danger: {
                                label: "Cancelar!",
                                className: "btn-danger",
                                callback: function() {
                                    modalPermission.show("uh oh, look out!");
                                }
                            }/*,
                            main: {
                                label: "Click ME!",
                                className: "btn-primary",
                                callback: function() {
                                    modalPermission.show("Primary button");
                                }
                            }*/
                        }
                    });
                }).done(function() {
                    console.log("second success");
                }).fail(function() {
                    console.log("error");
                }).always(function() {
                    console.log("finished");
               });

    });


});