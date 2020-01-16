<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	<c:if test="${userCount>0}">
		<div>
			<table>
				<caption>회원 신고목록</caption>
				<tr>
					<td>신고자</td>
					<td>ID</td>
					<td>신고날짜</td>
					<td>경고</td>
					<td>삭제</td>
				</tr>
				<c:forEach var="u" items="${userReport}">
					<tr>
						<td>${u.reporter_id}</td>
						<td><a onclick="reportDetail1('${u.report_num}')" data-target="#layerpop" data-toggle="modal">${u.user_id}</a></td>
						<td>${u.report_date}</td>
						<td><a href="user_alert.ad?user_num=${u.user_num}">경고</a></td>
						<td><a href="user_delete.ad?user_id=${u.user_id}">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</c:if>
	
	<c:if test="${eventCount>0}">
		<div>
			<table>
				<caption>이벤트 신고목록</caption>
				<tr>
					<td>신고자</td>
					<td>이벤트</td>
					<td>신고날짜</td>
					<td>경고</td>
					<td>삭제</td>
				</tr>
				<c:forEach var="e" items="${eventReport}">
					<tr>
						<td>${e.reporter_id}</td>
						<td><a onclick="reportDetail2('${e.report_num}')" data-target="#layerpop2" data-toggle="modal">${e.event_title}</a></td>
						<td>${e.report_date}</td>
						<td><a href="user_alert.ad?user_num=${e.user_num}">경고</a></td>
						<td><a href="event_delete.ad?event_num=${e.event_num}">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</c:if>
	<div class="modal fade" id="layerpop" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- 닫기(x) 버튼 -->
	        <button type="button" class="close" data-dismiss="modal">×</button>
	        <!-- header title -->
	        <h4 class="modal-title">신고 내용</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body">
	      	<div id="content">
	      			
	      	</div>
	      </div>
	     </div>
	    </div>
	   </div>
	   
	   <div class="modal fade" id="layerpop2" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- 닫기(x) 버튼 -->
	        <button type="button" class="close" data-dismiss="modal">×</button>
	        <!-- header title -->
	        <h4 class="modal-title">신고 내용</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body">
	      	<div id="content2">
	      			
	      	</div>
	      </div>
	     </div>
	    </div>
	   </div>
	
	<script>
		function reportDetail1(num){
			<c:forEach var="u" items="${userReport}">
				if("${u.report_num}"==num){
					var str = document.getElementById("content");
					str.innerHTML = "${u.report_content}";
				}
			</c:forEach>
		}
		
		function reportDetail2(num){
			<c:forEach var="e" items="${eventReport}">
				if("${e.report_num}"==num){
					var str = document.getElementById("content2");
					str.innerHTML = "${e.report_content}";
				}
			</c:forEach>
		}
	</script>
	
	
</body>
</html>