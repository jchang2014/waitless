$(document).on('page:change',function() {

  // $('.home-search-bar').on('click', '.nav-form-button', function(event){
  //   console.log('inside timer');


  //   //change counter to total wait time
  //   var counter = 30;

  //   var timer = setInterval(function() {
  //     waitTimer(counter);
  //   },5000);

  //   var waitTimer = function(time) {
  //     if (counter > 0) {
  //       var queryResults = document.getElementsByClassName("result-wait-time-number");
  //       for (var i = 0; i < queryResults.length; i++){
  //         queryResults[i].innerHTML = time;
  //       }
  //     }
  //     counter -= 1;
  //   };
  // });


  var tick = function(time) {
    $(".result-wait-time-number").each(function(){
      var element = $(this);
      var value = parseInt(element.text(), 10);
      if (value < 1) return;
      element.text(value - 1)
    });
  };

  setInterval(tick, 1000 * 60);

});

