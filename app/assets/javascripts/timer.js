$(document).on('page:change',function() {

  var tick = function(time) {
    $(".result-wait-time-number").each(function(){
      var element = $(this);
      var value = parseInt(element.text(), 10);
      if (value < 1) return;
      element.text(value - 1)
    });
  };

  setInterval(tick, 10000);

});

