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
		<c:if test="${userCount>0}">
			
			<table>
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
						<td>${u.user_id}</td>
						<td>${u.report_content}</td>
						<td>${u.report_date}</td>
						<td><a href="user_alert.ad?user_num=${u.user_num}&report_num=${u.report_num}">경고</a></td>
						<td><a href="report_delete.ad?user_id=${u.user_id}">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
	
	<div class="eventReport">
		<c:if test="${eventCount>0}">
			<table>
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
						<td>${e.event_title}</td>
						<td>${e.report_content}</td>
						<td>${e.report_date}</td>
						<td><a href="user_alert.ad?user_num=${e.user_num}&report_num=${u.report_num}">경고</a></td>
						<td><a href="report_delete.ad?event_num=${e.event_num}">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
	

	
	
</body>
</html>