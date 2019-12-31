<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<jsp:include page="../main/header.jsp" />
<script>
$(document).ready(function(){
	var checkid = false;
	var checkmail = false;
	
	$('form').submit(function(){
		if(!checkid){
			alert('사용가능한 id로 입력하세요.');
			$("input[name='user_id']").val('').focus();
			$("#message").text('');
			return false;
		}
		if(!$.isNumeric($("input[name='age']").val())){
			alert('나이는 숫자를 입력하세요.');
			$("input[name='age']").val('');
			$("input[name='age']").focus();
			return false;
		}
		
		if(!checkmail){
			alert("email 형식을 확인하세요.");
			$("input[name='user_email']").focus();
			return false;
		}
	})
	
	$("input[name='user_id']").on('keyup', function(){
		
		$("#message").empty();
		var pattern = /^\w{5,12}$/;
		var id= $("input[name='user_id']").val();
		
		if(!pattern.test(id)){
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
	
});
</script>
<title>회원가입</title>
</head>
<body>
	<form name="joinform" action="joinProcess.net" method="post">
		<h1>회원가입 페이지</h1>
		<hr>
		<b>아이디</b>
   		<input type=text name=user_id  placeholder="Enter Id"  maxLength=12 required>
   		<span id="message"></span>
   		
 		<b>비밀번호</b>
   		<input type=password name=user_pass placeholder="Enter password" required>
   		
   		<b>이름</b>
   		<input type=text name=user_name placeholder="Enter name" maxlength=15 required>
   		
   		<b>이메일 주소</b>
         <input type=text name=user_email placeholder="Enter email" required><span id="email_message"></span>
   		
   		<b>성별</b>
   		<div>
             <input type=radio name=user_gender value=남  checked><span>남자</span>
             <input type=radio name=user_gender value=여 ><span>여자</span>
         </div>
   		
   		<b>나이</b>
   		<input type=text name=user_age maxlength=2 placeholder="Enter age" required>
   		
   		<b>지역</b>
   		<input type=text name=user_city placeholder="Enter city" maxlength=30>
   		
   		<b>사진</b>
   		<input type=text name=user_image>
         
         <div class="clearfix">
         	<button type=submit class=submitbtn>회원가입</button>
         	<button type=reset class=cancelbtn>다시작성</button>
         </div>                
	</form>
</body>
</html>