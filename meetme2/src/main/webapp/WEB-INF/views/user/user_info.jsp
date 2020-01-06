<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<style>
	.table {
		width : 100%;
		text-align: center;
	}
	#back {
		text-align: center;
	}
</style>
<title>회원관리 시스템 관리자모드(회원정보))</title>
</head>
<body>
	<div class="container">
		<table class="table table-striped">
			<tr>
				<td>아이디</td>
				<td>${memberinfo.id }</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>${memberinfo.password }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${memberinfo.name }</td>
			</tr>
			<tr>
				<td>나이</td>
				<td>${memberinfo.age }</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${memberinfo.gender}</td>
			</tr>
			<tr>
				<td>이메일 주소</td>
				<td>${memberinfo.email }</td>
			</tr>
		</table>
		<div id="back"><a href='member_list.net' >리스트로 돌아가기</a></div>
	</div>
</body>
</html>