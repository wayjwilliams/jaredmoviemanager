// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-tablesorter
//= require jquery-ui
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).ready(function() {
    $("body").css("display", "none");
 
    $("body").fadeIn(750);
 
    $("a:not(.target)").click(function(event){
        event.preventDefault();
        linkLocation = this.href;
        $("body").fadeOut(750, redirectPage);      
    });
         
    function redirectPage() {
        window.location = linkLocation;
    }
});
$(document).ready(function() {
    $("body").css("display", "none");
 
    $("body").fadeIn(250);
 
    $("a:not(.target)").click(function(event){
        event.preventDefault();
        linkLocation = this.href;
        $("body").fadeOut(500, redirectPage);      
    });
         
    function redirectPage() {
        window.location = linkLocation;
    }
});