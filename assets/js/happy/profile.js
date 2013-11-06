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
        $('.chosen-select').trigger('chosen:updated');
        var $this = $(this);
        var $obj_chosen = $('.chosen-select');
            
        $.ajax({
            url: $this.attr('href'),
            contentType: 'application/json; charset=utf-8',
            data: {'permission_filter': $obj_chosen.val()},
            method: 'POST',
            success: function(modalResponseAjax) {
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
                    message: modalResponseAjax,
                    title: "Asignar Permisos por Módulo",
                    buttons: {
                        success: {
                            label: "Asignar!",
                            className: "btn-success",
                            callback: function() {
                                modalPermission.show("great success");
                            }
                        },
                        danger: {
                            label: "Cancelar!",
                            className: "btn-danger",
                            callback: function() {
                                modalPermission.show("uh oh, look out!");
                            }
                        },
                        main: {
                            label: "Click ME!",
                            className: "btn-primary",
                            callback: function() {
                                Example.show("Primary button");
                            }
                        }
                    }
                });
            }
        });
    });




});