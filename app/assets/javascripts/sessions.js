// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('page:change',function(){
  $('.nav-menu').hide();
	$(".nav-toggle").click(function(){
    $(".nav-menu").slideToggle();
	});
});
