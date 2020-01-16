$(function(){
	$('input[type=file]').on('change', preview);

	function preview(e) {
		console.log("Test")

		//선택한 그림의 File 객체를 취득
		var file = e.target.files[0]; //File객체 리스트에서 첫번째 File객체를 가져옵니다.
		//file.type:파일의 형식(MIME타입 - 예) text/html)
		if (!file.type.match('image.*')) {//파일 타입이 image인지 확인합니다.
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		//파일을 읽기 위한 객체 생성
		var reader = new FileReader();

		//DataURL 형식으로 파일을 읽어옵니다.
		//읽어온 결과는 reader객체의 result 속성에 저장됩니다.
		reader.readAsDataURL(file);

		//읽기에 성공했을 때 실행되는 이벤트 핸들러
		reader.onload = function(e) {
			//result:읽기 결과가 저장됩니다.
			//result.result 또는 e.target.result
			$("img").attr('src', e.target.result);
		}//reader.onload end
	}
	
	
	
	function updateinfo(){
		$.ajax({
			url:link,
			data:{"MOVIE_ID" : $("#MOVIE_ID").val()},
			dataType:"json",
			success:function(rdata){
				var list=rdata;
				console.log('list:'+list);
					$("#poster").attr('src', '');
					$("#poster").attr('src', 'https://image.tmdb.org/t/p/w300/'+rdata.results[0].poster_path);
					$("#hidden_postser").val(rdata.results[0].poster_path);
			},
			error:function(request, status, error){
				console.log('수정 실패');
			},
			complete:function(){
				console.log('수정 완료');
			}
		})	//ajax end
	}//function end
	

})