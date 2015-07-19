$(document).ready(function() {
  console.log('yoyoyo');
  queryResults();
});

function queryResults() {
  $('#search-form').on('click', '#search-button', function(e){
    e.preventDefault();

    var request = $.ajax({
      url: "/restaurants",
      action: "get",
      dataType: "JSON",
      data: $('#search-form').serialize()
    }); //end getJSON
    request.done(function(json){
      var markers = json.results;
      updateMap(markers);
    });//end done
    request.fail(function(error){
      alert("sorry your search yielded no results");
    });//end fail
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
          infoWindow.setContent(spot.name);
          infoWindow.open(map, marker);
      });
    })(marker, spot);
  }// end for loop
};

