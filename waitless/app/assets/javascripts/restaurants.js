$(document).ready(function() {
  queryResults();
});

function queryResults() {
  console.log("starting query");
  $('.search-form').on('click', '.home-search', function(e){
    e.preventDefault();
    var mapRequest = $.ajax({
      url: "/restaurants",
      action: "get",
      dataType: "JSON",
      data: $('#search-form').serialize()
    }); //end getJSON
    mapRequest.done(function(data){
      updateMap(data);

    });//end done
    mapRequest.fail(function(error){
      alert("sorry your search yielded no results");
    });//end fail

  var htmlRequest = $.ajax({
    url: "/restaurants",
    action: "get",
    dataType: "html",
    data: $('#search-form').serialize()
  });
  htmlRequest.done(function(response){
    console.log('inside htmlRequest ajax call');

    $('.restaurant-results').remove();
    $('.search-text').remove();

    $('.body-wrapper').append(response);

    var textResponse = "<div class='search-text'><p align=center>You can view your search results below</p></div>";
    $('.home-explore').append(textResponse);

    $('input#search').val('');
    $('input#location').val('');
  });

  }); //end search-form

} //end queryResults

//Google maps
function updateMap(markers) {
  var userLoc = new google.maps.LatLng(markers[0].latitude, markers[0].longitude);
  var mapOptions = {
    zoom: 15,
    center: userLoc
  };

  var infoWindow = new google.maps.InfoWindow();
  var mapDiv = document.getElementById('map-canvas');
  var map = new google.maps.Map(mapDiv, mapOptions);

  for(var i = 0; i < markers.length; i++) {
    var spot = markers[i];
    var latLng = new google.maps.LatLng(spot.latitude, spot.longitude);
    var marker = new google.maps.Marker({
      position: latLng,
      map: map
    });
    (function (marker, spot) {
      google.maps.event.addListener(marker, "click", function() {
          infoWindow.setContent(
            spot.name +
            "<br /> " +
            spot.location[0] +
            "<br /> " +
            "Current wait time: ");
          infoWindow.open(map, marker);
      });
    })(marker, spot);
  }// end for loop
};


