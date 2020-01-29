$(function(){
	var id=$("#id").val();

	//글자수 50개 제한하는 이벤트
	$('.content').on('input',function(){
		length = $(this).val().length;
		if(length > 50){
			length = 50;
			content = content.substring(0,length);
		}
		$('.float-left').text(length + "/50");
	})//content on input
	
	$('.write_comment').on('click',function(){
		buttonText = $(this).text(); //버튼의 라벨로 add할지 update할지
		content = $(this).parent().find("textarea").val();
		board_num = $(this).next().val();
		comment_num = $(this).
		board_user_num = $(this).next().next().val();
		user_id = $(this).next().next().next().val();
		$(".float-left").text('총 50자까지 가능합니다.');
		if(buttonText == "등록"){ //댓글을 추가하는 경우, buttonText가 "등록"일 경우
			console.log("동작하니???")
			url = "CommentAdd.mh";
			data = {"content" : content,
					"id" : user_id,
					"board_num" : board_num,
					"board_user_num" : board_user_num};
		}else { //댓글을 수정하는 경우
			url = "CommentUpdate.mh";
			data = {"COMMENT_NUM" : num, "COMMENT_CONTENT" : content};
			$(".write_comment").text("등록"); // 버튼글자 등록으로 변경
		}
		$.ajax({
			type : "post",
			url : url,
			data : data,
			success : function(result){
				$(".content").val('');
				if(result == 1){
					location.href="mboard.mh?id="+user_id
				}
			}
		})//ajax
	})//#write click event
	//수정누르면 그 에 맞는 num을 보낼꺼임
	$(".comment").on('click', '.update', function(){
		before = $(this).parent().prev().text(); //선택한 내용을 가져옵니다.
		$(this).parent().parent().parent().parent().prev().focus().val(before);
		num = $(this).next().next().val(); //수정할 댓글번호를 저장합니다.
		//num = this기준 다음다음의 값을 가져옴
		$(".write_comment").text("수정완료"); //등록버튼의 라벨을 '수정완료'로 변경합니다.
		$(this).parent().parent().css('background','lightgray');
	})
	
	$(".comment").on('click', '.remove', function(){
		var num = $(this).next().val(); //댓글번호
		//num = this의 다음 value값 = this의 다음값은 댓글의 번호가 hidden으로 들어가있음
		
		$.ajax({
			type : "post",
			url : "CommentDelete.mh",
			data : {"num" : num },
			success : function(result){
				if(result == 1){
					location.href="mboard.mh?id="+id
				}
			}
		})
	})
})
