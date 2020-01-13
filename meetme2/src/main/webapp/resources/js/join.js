$(document).ready(function(){
	
	var checkid = false;
	var checkmail = false;
	
	$('#join2').hide();
	$('#join3').hide();
	$('.backbtn2').hide();
	$('.backbtn3').hide();

	$('.nextbtn2').click(function(){
		$('#join2').hide();
		$('#join3').show();
		$('.backbtn2').hide();
		$('.backbtn3').show();
	})
	$('.backbtn3').click(function(){
		$('#join3').hide();
		$('#join2').show();
		$('.backbtn2').show();
		$('.backbtn3').hide();
	})
	$('.backbtn2').click(function(){
		$('#join2').hide();
		$('#join1').show();
		$('.backbtn2').hide();
	})
	
	$('.nextbtn1').click(function(){
		
		if(!checkid){
			alert('사용가능한 id로 입력하세요.');
			$("input[name='user_id']").val('').focus();
			$("#message").text('');
			return false;
		}
		if($("input[name='user_pass']").val()==''){
			alert('비밀번호를 입력하세요.');
			$("input[name='user_pass']").focus();
			return false;
		}
		if($("input[name='user_name']").val()==''){
			alert('이름을 입력하세요.');
			$("input[name='user_name']").focus();
			return false;
		}
		if($("input[name='user_city']").val()==''){
			alert('이름을 입력하세요.');
			$("input[name='user_city']").focus();
			return false;
		}
		if(!$.isNumeric($("input[name='user_age']").val())){
			alert('나이는 숫자를 입력하세요.');
			$("input[name='user_age']").val('');
			$("input[name='user_age']").focus();
			return false;
		}
		if(!checkmail){
			alert("email 형식을 확인하세요.");
			$("input[name='user_email']").focus();
			return false;
		}
		
		$('#join1').hide();
		$('#join2').show();
		$('.backbtn2').show();
	})
	
	$("input[name='user_id']").on('keyup', function(){
		
		$("#message").empty();
		var pattern = /^\w{5,12}$/;
		var user_id= $("input[name='user_id']").val();
		
		if(!pattern.test(user_id)){
			$("#message").html("영문자 숫자 _로 5~12자 가능합니다.");
			$("#message").css('color','red');
			checkid=false;
			return;
		}
		
		$.ajax({
            url : "idcheck.net",
            data : {"user_id" : user_id},
            success : function(resp){
               if(resp == -1) {
                  $("#message").css('color','green').html("사용이 가능한 아이디입니다.");
                  checkid=true;
               } else {
                  $("#message").css('color','blue').html("사용중인 아이디입니다.");
                  checkid=false;
               }//if
            }//success
         });//ajax
	});//keyup
	
	$("input[name='user_age']").on('keyup', function(){
		var age= $("input[name='user_age']").val();
		
		if(isNaN(age) == true){
			alert('숫자만 입력 가능합니다.');
			return;
		}
	});
	
	$("input[name='user_email']").on('keyup', function(){
		
		$("#email_message").empty();
		var pattern = /\w+@\w+[.]\w{3}/;
		//+ : 무조건 글자 1개 이상
		var email = $("input[name='user_email']").val();
		
		if(!pattern.test(email)){
			$("#email_message").css('color','red').html("이메일 형식이 맞지 않습니다.");
			checkmail = false;
		} else {
			$("#email_message").css('color','green').html("이메일 형식에 맞습니다.");
			checkmail = true;
		}//if
	});//keyup
	
	
	$('input[name="uploadfile"]').on('change', preview);
    
    function preview(e){
       var file = e.target.files[0];   // File 객체 리스트에서 첫 번째 File 객체를 가져옵니다.
       
       // file.type : 파일의 형식(MIME타입 - 예)   text/html)
       if(!file.type.match('image.*')){   // 파일 타입이 image인지 확인합니다.
          alert("확장자는 이미지 확장자만 가능합니다.");
          return;
       }
    
       // 파일을 읽기 위한 객체 생성
       var reader = new FileReader();
       
       // DataURL 형식으로 파일을 읽어옵니다.
       // 읽어온 결과는 reader객체의 result 속성에 저장됩니다.
       reader.readAsDataURL(file);
       
       // 읽기에 성공했을 때 실행되는 이벤트 핸들러
       reader.onload = function(e){
          // result : 읽기 결과가 저장됩니다.
          // reader.result 또는 e.target.result
          $(".avatar").attr("src", e.target.result);
       }   // reader.onload end
    }   // function end
    
    $(".category_img").click(function() {
		if($(this).next().val()==''){
			$(this).next().val($(this).attr("alt"));
			$(this).css('opacity','0.5');
		} else{
			$(this).next().val('');
			$(this).css('opacity','1');
		}
	})
	
	
});