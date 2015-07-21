// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $('.test-me').hide();
	$(".nav-toggle").click(function(){
    $(".test-me").slideToggle();
	});
});
