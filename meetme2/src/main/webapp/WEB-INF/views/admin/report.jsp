<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../main/header.jsp" />
<link rel="stylesheet" type="text/css" href="resources/css/report.css" />

<body data-target="#nino-navbar" data-spy="scroll">
	<div class="container admin_out">
		<nav class="admin_nav" id="nino-navbar" class="navbar navbar-default" role="navigation">
			<ul id="admin_ul" class="nav navbar-nav">
				<li><a href="dash.ad">대시보드</a></li>
				<li><a href="user_list.ad">회원관리</a></li>
				<li><a href="report.ad">신고관리</a></li>
			</ul>
		</nav>
	</div>
	
	
	<div class="userReport">
	
		<div class="userlist">
			<h3>Black User List</h3>
			<ul>
				<c:forEach items="${userList}" var="list">
					<li>${list}<li>
				</c:forEach>
			</ul>
		</div>
		
		<div class="u">
			<c:if test="${userCount>0}">
				
				<table class="userTable">
					<caption>회원 신고목록 (${userCount}개)</caption>
					<tr>
						<td>신고자</td>
						<td>ID</td>
						<td>신고내용</td>
						<td>신고날짜</td>
						<td>경고</td>
						<td>삭제</td>
					</tr>
					<c:forEach var="u" items="${userReport}">
						<tr>
							<td>${u.reporter_id}</td>
							<td>${u.user_id}</td>	<!-- 유저 마이홈으로 이동 -->
							<td>${u.report_content}</td>
							<td>${u.report_date}</td>
							<td><button type="button" class="w1" onclick="location.href='user_alert.ad?user_num=${u.user_num}&report_num=${u.report_num}'">경고</button></td>
							<td><button type="button" class="d1" onclick="location.href='userDel.ad?user_num=${u.user_num}'">삭제</button></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
	
	</div>
	
	
	<div class="eventReport">
	
		<div class="eventlist">
			<h3>Black Event List</h3>
			<ul>
				<c:forEach items="${eventList}" var="list">
					<li>${list}<li>
				</c:forEach>
			</ul>
		</div>
		
		<div class="e">
			<c:if test="${eventCount>0}">
				<table class="eventTable">
					<caption>이벤트 신고목록 (${eventCount}개)</caption>
					<tr>
						<td>신고자</td>
						<td>이벤트</td>
						<td>신고내용</td>
						<td>신고날짜</td>
						<td>경고</td>
						<td>삭제</td>
					</tr>
					<c:forEach var="e" items="${eventReport}">
						<tr>
							<td>${e.reporter_id}</td>
							<td>${e.event_title}</td>	<!-- 해당 이벤트 페이지로 이동 -->
							<td>${e.report_content}</td>
							<td>${e.report_date}</td>
							<td><button type="button" class="w2" onclick="location.href='event_alert.ad?event_num=${e.event_num}&report_num=${e.report_num}'">경고</button></td>
							<td><button type="button" class="d2" onclick="location.href='eventDel.ad?event_num=${e.event_num}'">삭제</button></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
		
	</div>
	
	<script>
		var list1 = new Array(); 
		
		<c:forEach items="${userReport}" var="item">
			list1.push("${item.report_ck}");
		</c:forEach>
		
		var w1 = document.getElementsByClassName("w1");
		
		for(var i=0; i<list1.length;i++){
			if(list1[i]==1){
				w1[i].style.background = 'lightgrey';
			}
		}
		
		var list2 = new Array(); 
		
		<c:forEach items="${eventReport}" var="item">
			list2.push("${item.report_ck}");
		</c:forEach>
		
		var w2 = document.getElementsByClassName("w2");
		
		for(var i=0; i<list2.length;i++){
			if(list2[i]==1){
				w2[i].style.background = 'lightgrey';
			}
		}
	</script>
	
	
</body>
</html>