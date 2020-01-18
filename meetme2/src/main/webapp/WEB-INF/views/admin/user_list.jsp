<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<jsp:include page="../main/header.jsp" />

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

	<div class="container userdiv">
	<form action = "user_list.ad" class="search_form">
		<div class="search">
			<select class="search_field" name="search_field">
				<option value="0" selected>회원번호</option>
				<option value="1">아이디</option>
				<option value="2">이름</option>
			</select>
			<input name="search_word" type="text" class="searchbox" placeholder="Search" value="${search_word }">
			<button class="searchbtn" type="submit">검색</button>
		</div>
	</form>
	<c:if test="${listcount > 0}">
			<table class="table table-striped user_table">
			<caption class="user_caption">회원목록</caption>
				<tr>
					<th colspan="4"><font size="3">회원 수 : ${listcount}</font></th>
				<tr>
				<tr>
					<td width="25%"><div>회원번호</div></td>
					<td width="25%"><div>아이디</div></td>
					<td width="25%"><div>이름</div></td>
					<td width="25%"><div>삭제</div></td>
				</tr>
				<c:set var="num"  value="${listcount-(page-1)*5}" />
				<c:forEach var="u"  items="${userlist}">
					<tr>
						<td>${u.user_num}</td>
						<td><a href="user_info.ad?user_id=${u.user_id}">${u.user_id}</a></td>
						<td>${u.user_name}</td>
						<td><a href="user_delete.ad?user_id=${u.user_id}" id="delete">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
			</c:if>
		</div>
	<div class="center-block">
		<div class="row">
			<div class="col">
				<ul class="pagination">
					<c:if test="${page<=1}">
						<li class="page-item">
						<a class="page-link current"  href="#">이전&nbsp;</a>
						</li>
					</c:if>
					<c:if test="${page > 1}">
						<li class="page-item">
							<a href="user_list.ad?page=${page-1}&search_field=${search_field}&search_word=${search_word}" class="page-link">이전</a>&nbsp;
						</li>
					</c:if>
					
					<c:forEach var="a" begin="${startpage}" end="${endpage}">
						<c:if test="${a==page}">
							<li class="page-item">
								<a class="page-link current" href="#">${a}</a>
							</li>
						</c:if>
						<c:if test="${a != page}">
							<li class="page-item">
								<a href="user_list.ad?page=${a}&search_field=${search_field}&search_word=${search_word}" class="page-link">${a}</a>
							</li>
						</c:if>
					</c:forEach>
					
					<c:if test="${page>=maxpage}">
						<li class="page-item">
							<a class="page-link current" href="#">&nbsp;다음</a>
						</li>
					</c:if>
					<c:if test="${page<maxpage}">
						<li class="page-item">
							<a href="user_list.ad?page=${page+1}&search_field=${search_field}&search_word=${search_word}"  class="page-link"> &nbsp;다음</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	
	<script>
		$(document).ready(function(){
			$("#delete").click(function(){
				var answer = confirm('정말 삭제하시겠습니까?');
				console.log(answer); //취소를 클릭한 경우 - false
				if(!answer){	//취소를 클릭한 경우
					event.preventDefault();
				}
			})
			var selectedValue = '${search_field}';
			if(selectedValue != '-1')
				$("#viewcount").val(selectedValue);
			
			console.log(selectedValue);
			
			$("button").click(function(){
				if($("input").val()==''){
					alert("검색어를 입력하세요");
					return false;
				}
			});
			
			
		});
	</script>
</body>
</html>