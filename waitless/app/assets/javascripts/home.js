$(document).on("page:change", function() {
	//Yelp search ajax function
	// $('form').on('submit', function() {
	// 	event.preventDefault();

	// 	formData = $('#search-form').serialize();


	// 	var request = $.ajax({
	// 		url: '/restaurants',
	// 		type: 'GET',
	// 		data: formData
	// 	});

	// 	request.done(function(response){
	// 		console.log("done");
	// 		for(i=0;i<response.length;i++) {
	// 			$('.results-list').append("<p>"+'name: '+response[i][0]+"</p>");
	// 			$('.results-list').append("<p>"+'location: '+response[i][1]+"</p>");
	// 			$('.results-list').append("<img src='"+response[i][2]+"'>");
	// 		};
	// 	});

	// });


	//Google maps geolocation functions
	if (navigator.geolocation) {
    console.log('Geolocation is supported!');
    var success = function(position){
      var lat = position.coords.latitude;
      var longit = position.coords.longitude;
      createMap(lat, longit);
    };
    var fail = function(message){
      alert('using default location');
      var lat = 37.7849162;
      var longit = -122.39799699999999;
      createMap(lat, longit);
    };
    navigator.geolocation.getCurrentPosition(success, fail);

  } else {
    console.log('Geolocation is not supported.');
    var lat = 37.7849162;
    var longit = -122.39799699999999;
    createMap(lat, longit);
  }
});

var map;
var infowindow;

//Google maps function definition
function createMap(lat, longit) {
  var userLoc = new google.maps.LatLng(lat, longit);

  var mapOptions = {
    zoom: 15,
    center: userLoc
  };

  var mapDiv = document.getElementById('map-canvas');
  map = new google.maps.Map(mapDiv, mapOptions);

    //Add wolfjob restaurant
  var request = {
    location: userLoc,
    radius: 400,
    types: ['restaurant']
  };

  infowindow = new google.maps.InfoWindow();
  var service = new google.maps.places.PlacesService(map);
  service.nearbySearch(request, callback);
};

function callback(results, status) {
  if (status == google.maps.places.PlacesServiceStatus.OK) {
    //change results.length to <= 10 to narrow down
    for (var i = 0; i < results.length; i++) {
      createMarker(results[i]);
    }
  }
}

function createMarker(place) {
  var placeLoc = place.geometry.location;
  var marker = new google.maps.Marker({
    map: map,
    position: place.geometry.location
  });

  //fake wait time
  var waitTime = "20 minutes wait";

  google.maps.event.addListener(marker, 'click', function() {
    infowindow.setContent(
      place.name +
      '<br />' +
      place.vicinity +
      '<br />' +
      waitTime +
      '<br />' +
      '<a href="restaurants/show">' + "Put partial here" + '</a>')
;
    infowindow.open(map, this);
  });
};