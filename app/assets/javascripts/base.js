/*	Set lng and lat for San Francisco and London	*/
var cities = [{lat: 37.7833, lng: -122.4167}, {lat: 51.5072, lng: 0.1275}];

/*	initialized the map variable 	*/
var map;

/*	Creates the map 	*/
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 37.7833, lng: -122.4167},
    zoom: 2
  });
  /*	Calls the setPins function 	*/
  setPins();
}

/*	Sets a pin for each city in the cities array. Is called inside the initMap function 	*/
function setPins() {
	for (var i=0; i<cities.length; i++) {
		var marker = new google.maps.Marker({
		  position: cities[i],
		  map: map,
		});
	}
}

$(document).ready(function(){

	if (document.getElementById('map')) {
		initMap();
	}

});