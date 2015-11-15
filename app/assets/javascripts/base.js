
/*	Set lng and lat for cities to put pins on	*/
var cities = [
	{lat: 37.7833, lng: -122.4167}, // San Francisco, USA
	{lat: 51.5072, lng: 0.1275}, // London, England
	{lat: 35.6691, lng: 139.6012} // Tokyo, Japan
	];

/*	initialized the map variable 	*/
var map;

/*	Creates the map 	*/
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 37.7833, lng: -112.4167},
    zoom: 3
  });
  /*	Calls the setPins function 	*/
  setPins();
  marker.addListener('click', linkToCities);
}

/*	Sets a pin for each city in the cities array. Is called inside the initMap function 	*/
function setPins() {
	for (var i=0; i<cities.length; i++) {
		var marker = new google.maps.Marker({
		  position: cities[i],
		  url: '/cities',
		  animation: google.maps.Animation.DROP,
		  map: map,
		});
	}
}

// Sets the pins down in a succession, not all at once.
// function dropPins() {
//   for (var i =0; i < cities.length; i++) {
//     setTimeout(function() {
//       setPins();
//     }, i * 200);
//   }
// }

function linkToCities() {
	console.log('Clicked a marker');
}

$(document).ready(function(){

	// To initialize tooltips for city pages when not logged in
	$(function () {$('[data-toggle="tooltip"]').tooltip();});

/*	only calls init map if there is an element in the DOM with id='map' 	*/
	if (document.getElementById('map')) {
		initMap();
	}

});