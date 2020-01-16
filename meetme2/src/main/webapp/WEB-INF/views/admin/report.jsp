<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<body data-target="#nino-navbar" data-spy="scroll">
<jsp:include page="admin_header.jsp" />
	<div class="container admin_out">
		<nav class="admin_nav" id="nino-navbar" class="navbar navbar-default" role="navigation">
			<ul id="admin_ul" class="nav navbar-nav">
				<li><a href="dash.ad">대시보드</a></li>
				<li><a href="user_list.ad">회원관리</a></li>
				<li><a href="report.ad">신고관리</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>