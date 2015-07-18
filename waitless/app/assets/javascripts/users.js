$( document ).ready(function() {
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
