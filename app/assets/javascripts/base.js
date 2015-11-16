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

/*	only calls init map if there is an element in the DOM with id='map' 	*/
	if (document.getElementById('map')) {
		initMap();
	}

	if (document.getElementById('city-skw-pages')) {
		var curPage = 1;
		var numOfPages = $(".skw-page").length;
		var animTime = 1000;
		var scrolling = false;
		var pgPrefix = ".skw-page-";

		function pagination() {
		  scrolling = true;

		  $(pgPrefix + curPage).removeClass("inactive").addClass("active");
		  $(pgPrefix + (curPage - 1)).addClass("inactive");
		  $(pgPrefix + (curPage + 1)).removeClass("active");

		  setTimeout(function() {
		    scrolling = false;
		  }, animTime);
		}

		function navigateUp() {
		  if (curPage === 1) return;
		  curPage--;
		  pagination();
		}

		function navigateDown() {
		  if (curPage === numOfPages) return;
		  curPage++;
		  pagination();
		}

		$(document).on("mousewheel DOMMouseScroll", function(e) {
		  if (scrolling) return;
		  if (e.originalEvent.wheelDelta > 0 || e.originalEvent.detail < 0) {
		    navigateUp();
		  } else { 
		    navigateDown();
		  }
		});

		$(document).on("mousewheel DOMMouseScroll", function(e) {
		  if (scrolling) return;
		  if (e.originalEvent.wheelDelta > 0 || e.originalEvent.detail < 0) {
		    navigateUp();
		  } else { 
		    navigateDown();
		  }
		});

		var chevronDown = document.getElementsByClassName('icon-chevron-down');
		var chevronUp = document.getElementsByClassName('icon-chevron-up');

		$(chevronDown).on("click", function(e) {
			e.preventDefault();
		  navigateDown();
		});

		$(chevronUp).on("click", function(e) {
			e.preventDefault();
		  navigateUp();
		});

		$(document).on("keydown", function(e) {
		  if (scrolling) return;
		  if (e.which === 38) {
		    navigateUp();
		  } else if (e.which === 40) {
		    navigateDown();
		  }
		});
	}

});