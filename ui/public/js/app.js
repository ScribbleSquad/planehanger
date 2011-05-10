var app ={
    status: function(message){
      $('#ajax-loader').css('visibility', 'visible'); 
      $('#ajax-message').text(message);
    },
    
    hideStatus: function(){
        $('#ajax-loader').css('visibility', 'hidden');
    },
    
    hookUpAjax: function(){
      $('#stage').ajaxError(function(request, settings) {
        //stuff to do when an AJAX call returns an error;    
        app.status("An error has occured!");
      });
      
      $('#stage').ajaxStart(function() {
        //stuff to do when an AJAX call is started and no other AJAX calls are in progress;  
        app.status('request has started!');
      });
             
      
      $('#stage').ajaxStop(function() {
        //stuff to do when all AJAX calls have completed;
        app.hideStatus();
      });      
      
      $('#stage').ajaxSuccess(function() {
        // executes whenever an AJAX request completes successfully 
        app.hideStatus();
      });
      
      $('#stage').ajaxSend(function(request, settings) {
        //stuff to do before an AJAX request is sent;
        app.status('Loading....')
      });
    },                       
    
    setup: function(){
      app.hideStatus();  
    }
       
    
};
$(function() {
    app.hookUpAjax();  
    app.setup();     
});