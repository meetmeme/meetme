<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<jsp:include page="../main/header.jsp" />

<body data-target="#nino-navbar" data-spy="scroll">
	
	<div id="nums">
		<c:forEach var="c" items="${categoryList}">
			<input type="hidden" value="${c.CATEGORY_NUM}" class="cat_num">
		</c:forEach>
	</div>
	
	<c:forEach var="c" items="${categoryList}">
		<input type="hidden" value="${c.CATEGORY_NAME}" class="cat_name">
	</c:forEach>
	
	<c:forEach var="ca" items="${categoryCount}">
		<input type="hidden" value="${ca}" class="inter_count">
	</c:forEach>
	
	<c:forEach var="bo" items="${boardCount}">
		<input type="hidden" value="${bo}" class="board_count">
	</c:forEach>
	
	<c:forEach var="day" items="${dayCount}">
		<input type="hidden" value="${day}" class="day_count">
	</c:forEach>
	
	<c:forEach var="f" items="${follows}">
		<input type="hidden" value="${f.user_id}" class="follow_id">
		<input type="hidden" value="${f.c}" class="follow_count">
	</c:forEach>
	
	
	
	<div class="container admin_out">
		<nav class="admin_nav" id="nino-navbar" class="navbar navbar-default" role="navigation">
			<ul id="admin_ul" class="nav navbar-nav">
				<li><a href="dash.ad">대시보드</a></li>
				<li><a href="user_list.ad">회원관리</a></li>
				<li><a href="report.ad">신고관리</a></li>
			</ul>
		</nav>
	</div>
	
	<div class="dashdiv">
		<div class="line">
			<h2 class="line_title">일별 게시물 총 갯수</h2>
			<canvas id="myLineChart"></canvas>
		</div>
		
		<div class="pie">
			<h2 class="pie_title">회원 흥미분야 통계</h2>
			<canvas id="myChart"></canvas>
		</div>
		
		
	</div>
	
	<div class="dashdiv2">
		
		<div class="bar">
			<h2 class="bar_title">월별 게시물 총 갯수</h2>
			<canvas id="myBarChart"></canvas>
		</div>
		
		<div class="horizontal">
			<h2 class="horizontal_title">팔로워 최다 회원 리스트</h2>
			<canvas id="myHorizontalChart"></canvas>
		</div>
	</div>
	
	
	<script type="text/javascript" src="resources/js/dash.js"></script>
</body>
</html>