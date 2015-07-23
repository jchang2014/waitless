$(document).on('page:change',function() {
  queryResultsTimers();
  restaurantTimer();
});

function queryResultsTimers() {
  //$('form#nav-form').on('submit', function(e){
  $('.home-search-bar').on('click', '.nav-form-button', function(event){
    console.log('inside timer');


    //change counter to total wait time
    var counter = 15;

    var timer = setInterval(function() {
      waitTimer(counter);
    },5000);

    var waitTimer = function(time) {
      if (counter > 0) {
        var queryResults = document.getElementsByClassName("result-wait-time-number");
        for (var i = 0; i < queryResults.length; i++){
          queryResults[i].innerHTML = time;
        }
      }
      counter -= 1;
    };
  });
}

function restaurantTimer() {

  var timerElem = document.getElementsByClassName("result-wait-time-number")[0].innerHTML;
  var restaurantTimer = document.getElementsByClassName("result-wait-time-number")[0];

  var timer = setInterval(function() {
    waitTimer(timerElem);
  },1000);

  var waitTimer = function(time) {
    if (timerElem > 0) {
      restaurantTimer.innerHTML = time;
    }
    timerElem -= 1;
  };

}