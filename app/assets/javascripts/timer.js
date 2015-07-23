$(document).on('page:change',function() {
  queryResultsTimers();
});

function queryResultsTimers() {
  $('.search-form').on('click', '.home-search', function(e){
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
