$(document).on("page:change", function() {
	//Yelp search ajax function
	$('#search-form').on('submit', function() {
		event.preventDefault();

		formData = $('#search-form').serialize();


		var request = $.ajax({
			url: '/restaurants',
			type: 'GET',
			data: formData
		});

		request.done(function(response){
			console.log("done");
			for(i=0;i<response.length;i++) {
				$('.results-list').append("<p>"+'name: '+response[i][0]+"</p>");
				$('.results-list').append("<p>"+'location: '+response[i][1]+"</p>");
				$('.results-list').append("<img src='"+response[i][2]+"'>");
			};
		});

	});


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


//Google maps function definition
function createMap(lat, longit) {
  var userLoc = new google.maps.LatLng(lat, longit);

  var mapOptions = {
    zoom: 15,
    center: userLoc
  };

  var mapDiv = document.getElementById('map-canvas');
  var map = new google.maps.Map(mapDiv, mapOptions);

  var marker = new google.maps.Marker({
    position: userLoc,
    map: map
  });
};
