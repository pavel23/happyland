$(function() {
    //console.log($('input=checkbox .parent_read'));
    $('input[type=checkbox] .parent_read').on( 'click', function(){
      console.log($(this));  
    });
    
});