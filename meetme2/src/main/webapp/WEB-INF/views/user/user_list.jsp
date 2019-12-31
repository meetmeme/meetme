<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>
<style>
	div{
		text-align: center;
	}
	.center-block {
		display: flex;
		justify-content: center; /*가운데정렬*/
	}
	table caption {
		caption-side : top;
		text-align: center;
	}
	li .current {
		background: #faf7f7;
	}
</style>
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
		
		$("button").click(function(){
			if($("input").val()==''){
				alert("검색어를 입력하세요");
				return false;
			}
		})
		
		//성별의 경우 placeholder 나타나도록합니다.
		$("#viewcount").change(function(){
			selectedValue = $(this).val();
			$("input").val('');
			if(selectedValue == '3'){
				$("input").attr("placeholder","여 또는 남을 입력하세요");
			}
		})
	})
</script>
</head>
<body>

	<div class="container">
	<form action = "member_list.net">
		<div class="input-group">
			<select id="viewcount" name="search_field">
				<option value="0" selected>아이디</option>
				<option value="1">이름</option>
				<option value="2">나이</option>
				<option value="3">성별</option>
			</select>
			<input name="search_word" type="text" class="form-control" placeholder="Search" value="${search_word }">
			<button class="btn btn-primary" type="submit">검색</button>
		</div>
	</form>
	<c:if test="${listcount > 0}">
			<table class="table table-striped">
			<caption>회원목록</caption>
				<tr>
					<th colspan="2">MVC 게시판 - 회원 정보 list</th>
					<th colspan="1"><font size="3">회원 수 : ${listcount}</font></th>
				<tr>
				<tr>
					<td width="33.3%"><div>아이디</div></td>
					<td width="33.3%"><div>이름</div></td>
					<td width="33.3%"><div>삭제</div></td>
				</tr>
				<c:set var="num"  value="${listcount-(page-1)*5}" />
				<c:forEach var="m"  items="${memberlist}">
					<tr>
						<td><a href="member_info.net?id=${m.id}">${m.id }</a></td>
						<td>${m.name }</td>
						<td><a href="member_delete.net?id=${m.id}" id="delete">삭제</a></td>
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
							<a href="member_list.net?page=${page-1}&search_field=${search_field}&search_word=${search_word}" class="page-link">이전</a>&nbsp;
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
								<a href="member_list.net?page=${a }&search_field=${search_field}&search_word=${search_word}" class="page-link">${a}</a>
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
							<a href="member_list.net?page=${page+1}&search_field=${search_field}&search_word=${search_word}"  class="page-link"> &nbsp;다음</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	
</body>
</html>