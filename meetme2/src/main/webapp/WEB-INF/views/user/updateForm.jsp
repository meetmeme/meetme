<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="resources/css/joinForm.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){

	var checkmail = true;
	
	$('form').submit(function(){
	
		if(!$.isNumeric($("input[name='age']").val())){
			alert('나이는 숫자를 입력하세요.');
			$("input[name='age']").val('');
			$("input[name='age']").focus();
			return false;
		}
		
		if(!checkmail){
			alert("email 형식을 확인하세요.");
			$("input:eq(6)").focus();
			return false;
		}
	})
	
	$("input:eq(3)").on('keyup', function(){
		var age= $("input:eq(3)").val();
		
		if(isNaN(age) == true){
			alert('숫자만 입력 가능합니다.');
			return;
		}
	});
	
	$("input:eq(6)").on('keyup', function(){
		
		$("#email_message").empty();
		var pattern = /\w+@\w+[.]\w{3}/;
		//+ : 무조건 글자 1개 이상
		var email = $("input:eq(6)").val();
		
		if(!pattern.test(email)){
			$("#email_message").css('color','red').html("이메일 형식이 맞지 않습니다.");
			checkmail = false;
		} else {
			$("#email_message").css('color','green').html("이메일 형식에 맞습니다.");
			checkmail = true;
		}//if
	});//keyup
	
	var pandan = '${memberinfo.gender}';
	if(pandan=='남'){
		$("input:radio").eq(0).attr('checked','checked');
	}else {
		$("input:radio").eq(1).attr('checked','checked');
	}
	$(".cancelbtn").click(function(){
		history.back();
	});
	
});
</script>
<title>회원관리 시스템 회원수정 페이지</title>

</head>
<body>
	<form name="updateform" action="updateProcess.net" method="post">
		<h1>정보수정 페이지</h1>
		<hr>
		<b>아이디</b>
   		<input type=text name=id  maxLength=12 value="${id }" readOnly>
   		
 		<b>비밀번호</b>
   		<input type=password name=password value="${memberinfo.password }" required>
   		
   		<b>이름</b>
   		<input type=text name=name value="${memberinfo.name }" maxlength=15 required>
   		
   		<b>나이</b>
   		<input type=text name=age maxlength=2 value="${memberinfo.age }" required>
   		
   		<b>성별</b>
   		<div>
   		<input type=radio name=gender value=남 id="m" ><span>남자</span>
   		<input type=radio name=gender value=여 id="w"><span>여자</span>
         </div>
         
         <b>이메일 주소</b>
         <input type=text name=email value="${memberinfo.email }"  required><span id="email_message"></span>
         
         <div class="clearfix">
         	<button type=submit class=submitbtn>정보수정</button>
         	<button type=reset class=cancelbtn>다시작성</button>
         </div>                
	</form>
</body>
</html>