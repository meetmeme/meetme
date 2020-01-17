<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<style>
	.table {
		width : 100%;
		text-align: center;
	}
	#back {
		text-align: center;
	}
</style>

<jsp:include page="../main/header.jsp" />

<body data-target="#nino-navbar" data-spy="scroll">
<body>

	<div class="container admin_out">
		<nav class="admin_nav" id="nino-navbar" class="navbar navbar-default" role="navigation">
			<ul id="admin_ul" class="nav navbar-nav">
				<li><a href="dash.ad">대시보드</a></li>
				<li><a href="user_list.ad">회원관리</a></li>
				<li><a href="report.ad">신고관리</a></li>
			</ul>
		</nav>
	</div>
	
	<div class="container userinfo_div">
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