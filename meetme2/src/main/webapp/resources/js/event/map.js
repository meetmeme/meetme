jQuery(document).ready(function($) {

	var kh = new google.maps.LatLng(37.568015, 126.983033);
	
	function initialize()
	{
	  var mapProp = {
			  center: kh,
			  zoom:18,
			  mapTypeId: google.maps.MapTypeId.ROADMAP
	  };
	  var map = new google.maps.Map(document.getElementById("map_canvas"),mapProp);
	  
	  var marker = new google.maps.Marker({
		  position:kh,
		  title : "We'll meet here"
		  });
		 
		marker.setMap(map);
	}
	 
	google.maps.event.addDomListener(window, 'load', initialize);



});
