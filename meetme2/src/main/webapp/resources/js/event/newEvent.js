
jQuery(document).ready(function($) {
	
	var picker = new Pikaday({ 
		 field: document.getElementById('event_date'),
		 format: 'yyyy-MM-dd',
		 toString(date, format) {
		   let day = ("0" + date.getDate()).slice(-2);
		   let month = ("0" + (date.getMonth() + 1)).slice(-2);
		   let year = date.getFullYear();
		   return `${year}-${month}-${day}`;
		 }
		});

	$("#event_time").timepicker({
		step: 30,           			//시간간격 : 30분
		timeFormat: "A h:i" ,   		// AM 시간:분 으로표시
		closeOnWindowScroll : true, 	// 스크롤 내리면 선택기 닫기
		minTime : "12:00 am",			// 기본 시간
		

	});
	
	$("#event_people").focusout(function(){
		if($("#event_people").val()<2){
			alert("최소 인원은 2명 입니다.");
			$("#event_people").val('');
		};
	});
	
//	$("#event_cost").focusout(function(){
//		console.log($("#event_cost").val());
//		var cost = $("#event_cost").val();
//		$("#event_cost").val(cost.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
//	});
	
	$("#event_location").keyup(function(){
		initAutocomplete();
	});
	
	var placeSearch, autocomplete;
	function initAutocomplete() {
	  // Create the autocomplete object, restricting the search to geographical
	  // location types.
	  autocomplete = new google.maps.places.Autocomplete(
	                                      (document.getElementById('event_location')),{types: ['geocode']});
	  // When the user selects an address from the dropdown, populate the address
	  // fields in the form.
	  autocomplete.addListener('place_changed', fillInAddress);
	}
	function fillInAddress() {
	  // Get the place details from the autocomplete object.
	  var place = autocomplete.getPlace();
	    document.getElementById("lat").value=place.geometry.location.lat();
	    document.getElementById("lng").value=place.geometry.location.lng();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
			
});