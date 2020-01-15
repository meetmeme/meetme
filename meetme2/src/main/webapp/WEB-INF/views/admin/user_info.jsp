<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.table {
		width : 100%;
		text-align: center;
	}
	#back {
		text-align: center;
	}
</style>
<body data-target="#nino-navbar" data-spy="scroll">
<jsp:include page="header.jsp" />
<body>
	<div class="container">
		<table class="table table-striped">
			<tr>
				<td>아이디</td>
				<td>${userinfo.user_id }</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>${userinfo.user_pass }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${userinfo.user_name }</td>
			</tr>
			<tr>
				<td>나이</td>
				<td>${userinfo.user_age }</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${userinfo.user_gender}</td>
			</tr>
			<tr>
				<td>이메일 주소</td>
				<td>${userinfo.user_email }</td>
			</tr>
		</table>
	</div>
</body>
</html>