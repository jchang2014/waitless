$(document).ready(function() {
  $('.search-form').on('click', '.home-search', function(e){
    //change counter to total wait time
    var counter = 15;

    var timer = setInterval(function() {
      waitTimer(counter);
    },1000);

    var waitTimer = function(time) {
      if (counter > 0) {
        var firstQueryResult = document.getElementsByClassName("result-wait-time-number")[0];
        firstQueryResult.innerHTML = time;
      }
      counter -= 1;
    };
  });
});

