
jQuery(document).ready(function($) {
	
	var picker = new Pikaday({ 
		 field: document.getElementById('datepicker'),
		 format: 'yyyy-MM-dd',
		 toString(date, format) {
		   let day = ("0" + date.getDate()).slice(-2);
		   let month = ("0" + (date.getMonth() + 1)).slice(-2);
		   let year = date.getFullYear();
		   return `${year}-${month}-${day}`;
		 }
		});

	$("#time").timepicker({
		step: 30,           			//시간간격 : 30분
		timeFormat: "A h:i" ,   		// AM 시간:분 으로표시
		closeOnWindowScroll : true, 	// 스크롤 내리면 선택기 닫기
		minTime : "12:00 am",			// 기본 시간
		

	});

			
});