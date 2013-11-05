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
        console.log($('#formprofile[modules]'));
    });


    var Example = (function() {
        "use strict";
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
    }());

    bootbox.dialog({
        message: "I am a custom dialog",
        title: "Custom title",
        buttons: {
            success: {
                label: "Success!",
                className: "btn-success",
                callback: function() {
                    Example.show("great success");
                }
            },
            danger: {
                label: "Danger!",
                className: "btn-danger",
                callback: function() {
                    Example.show("uh oh, look out!");
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

});