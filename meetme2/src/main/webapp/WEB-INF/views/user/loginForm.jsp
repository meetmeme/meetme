<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<jsp:include page="../main/header.jsp" />
<title>로그인</title>
<script>
	$(function(){
		$(".join").click(function(){
			location.href="join.net";
		});
	});
</script>
</head>
<body>
	<div class="container">
		<form name="loginform" action="loginProcess.net" method="post">
		
			<h1 class="articleTitle">LOGIN</h1>
			<hr>
			<div class="form-group">
				<b class="articleDesc">ID</b>
				<input class="form-control" type="text" name="user_id" placeholder="Enter id" required
				value="${saveid}">
				<br>
			</div>
			<div class="form-group">
				<b class="articleDesc">PASSWORD</b>
				<input class="form-control" type="password" name="user_pass" placeholder="Enter password" required>
			</div>
			<div>
				<input type="checkbox" name="u" class="articleDesc">Remember me
			</div>
			<br>
			<div class="clearfix form-group">
				<button type="submit" class="btn btn-primary submitbtn">로그인</button>
				<button type="button" class="btn btn-danger join">회원가입</button>
			</div>
		</form>
	</div>
</body>
</html>