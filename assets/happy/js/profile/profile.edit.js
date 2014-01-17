$(function() {
    var $obj_checked_permission = $("input:radio[name='formprofile[access_permition]']");
        $obj_checked_permission.on('click', function(){
            var checked = $(this).attr('checked', true);
            if(checked && $(this).val()=='custom'){ 
              $('#module_profile_access_container').show();
            } else { 
              $('#module_profile_access_container').hide();
            }
        });
    
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
                                                console.log(dataResponse);
                                            });
                                }
                            },
                            danger: {
                                label: "Cancelar!",
                                className: "btn-danger",
                                callback: function() {
                                    console.log(modalPermission);
                                }
                            }
                        }
                    });
                }).done(function() {
                    var $frm_permission = $('#formpermission');
                     $frm_permission.find('.parent_read').on( 'click', function() {
                        $this = $(this);
                        $frm_permission.find('.child_read_' + $this.attr('module_id')).prop('checked', $this.is(':checked'));
                     });
                     $frm_permission.find('.parent_write').on( 'click', function() {
                        $this = $(this);
                        $frm_permission.find('.child_write_' + $this.attr('module_id')).prop('checked', $this.is(':checked'));
                     });
                     $frm_permission.find('.parent_download').on( 'click', function() {
                        $this = $(this);
                        $frm_permission.find('.child_download_' + $this.attr('module_id')).prop('checked', $this.is(':checked'));
                     });
                     $frm_permission.find('.child_read').on( 'click', function() {
                        $this = $(this);
                        //console.log('Mark --> ' + $( 'input:checked.child_read').length);
                        $frm_permission.find('.parent_read_' + $this.attr('parent_module_id')).prop('checked', false);
                     });
                     $frm_permission.find('.child_write').on( 'click', function() {
                        $this = $(this);
                        $frm_permission.find('.parent_write_' + $this.attr('parent_module_id')).prop('checked', false);
                     });
                     $frm_permission.find('.child_download').on( 'click', function() {
                        $this = $(this);
                        $frm_permission.find('.parent_download_' + $this.attr('parent_module_id')).prop('checked', false);
                     });
                     
                }).fail(function() {
                    console.log("error");
                }).always(function() {
                    console.log("finished");
               });
    });
});