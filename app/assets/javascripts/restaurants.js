$(document).on('page:change',function() {
  queryResults();
  mapSearchUpdate();
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
      console.log(data);
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
    $('.home-wrapper').remove();
    $('.body-wrapper').append(response);
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
            "Current wait time: " +
            spot.wait_time +
            " minutes" );
          infoWindow.open(map, marker);
      });
    })(marker, spot);
  }// end for loop
};

// NAV BAR HOMEPAGE
var mapSearchUpdate = function() {
  console.log("starting query");
  $('.home-search-bar').on('click', '.nav-form-button', function(event){
    event.preventDefault();
    var mapRequest = $.ajax({
      url: "/restaurants",
      action: "get",
      dataType: "JSON",
      data: $('#nav-form').serialize()
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
    data: $('#nav-form').serialize()
  });
  htmlRequest.done(function(response){
    console.log('inside htmlRequest ajax call');
    $('.restaurant-results').remove();
    $('.home-wrapper').remove();
    $('.body-wrapper').append(response);
    $('input#search').val('');
    $('input#location').val('');
  });

  }); //end search-form
}; //end queryResults
