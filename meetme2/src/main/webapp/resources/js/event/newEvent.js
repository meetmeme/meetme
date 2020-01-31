
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
	
	$("#event_max").focusout(function(){
		if($("#event_max").val()<2){
			alert("최소 인원은 2명 입니다.");
			$("#event_max").val('');
		};
	});
	
//	$("#event_cost").focusout(function(){
//		console.log($("#event_cost").val());
//		var cost = $("#event_cost").val();
//		$("#event_cost").val(cost.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
//	});
			
	$('form').submit(function() {
		if ($("#upload").text() == '') {
			alert("사진을 최소 1장 등록해주세요");
			return false;
		}
	});
	
	
});

/**
 * Google Map API 주소의 callback 파라미터와 동일한 이름의 함수이다.
 * Google Map API에서 콜백으로 실행시킨다.
 */

function initMap() {
    console.log('Map is initialized.');

    /**
     * 맵을 설정한다.
     * 1번째 파라미터 : 구글 맵을 표시할 위치. 여기서는 #google-map
     * 2번째 파라미터 : 맵 옵션.
     *      ㄴ zoom : 맵 확대 정도
     *      ㄴ center : 맵 중심 좌표 설정
     *              ㄴ lat : 위도 (latitude)
     *              ㄴ lng : 경도 (longitude)
     */
    var map = new google.maps.Map(document.getElementById('google-map'), {
        zoom: 12.5,
        center: {
            lat: 37.568, 
            lng: 126.983
        }
    });

    /**
     * Google Geocoding. Google Map API에 포함되어 있다.
     */
    var geocoder = new google.maps.Geocoder();

    // submit 버튼 클릭 이벤트 실행
    document.getElementById('mapSearch').addEventListener('click', function() {
        console.log('submit 버튼 클릭 이벤트 실행');

        // 여기서 실행
        geocodeAddress(geocoder, map);
    });

    /**
     * geocodeAddress
     * 
     * 입력한 주소로 맵의 좌표를 바꾼다.
     */
    function geocodeAddress(geocoder, resultMap) {
        console.log('geocodeAddress 함수 실행');

        // 주소 설정
        var address = document.getElementById('address').value;

        /**
         * 입력받은 주소로 좌표에 맵 마커를 찍는다.
         * 1번째 파라미터 : 주소 등 여러가지. 
         *      ㄴ 참고 : https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingRequests
         * 
         * 2번째 파라미터의 함수
         *      ㄴ result : 결과값
         *      ㄴ status : 상태. OK가 나오면 정상.
         */
        geocoder.geocode({'address': address}, function(result, status) {
            console.log(result);
            console.log(status);

            if (status === 'OK') {
                // 맵의 중심 좌표를 설정한다.
                resultMap.setCenter(result[0].geometry.location);
                // 맵의 확대 정도를 설정한다.
                resultMap.setZoom(18);
                // 맵 마커
                var marker = new google.maps.Marker({
                    map: resultMap,
                    position: result[0].geometry.location
                });
                
                document.getElementById("lat").value=result[0].geometry.location.lat();
        	    document.getElementById("lng").value=result[0].geometry.location.lng();

                // 위도
                console.log('위도(latitude) : ' + marker.position.lat());
                // 경도
                console.log('경도(longitude) : ' + marker.position.lng());
            } else {
                alert('잘못된 주소입니다.');
                console.log("로드 못함 이유 : " + status);
            }
        });
    }
}


