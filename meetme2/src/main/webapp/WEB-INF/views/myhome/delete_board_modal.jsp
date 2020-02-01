<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--게시글 삭제 모달 -->
<div class="modal fade" id="layerpop3">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- header -->
			<div class="modal-header">
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">×</button>
				<!-- header title -->
				<h4 class="modal-title">게시글 삭제 하기</h4>
			</div>
			<!-- body -->
			<div class="modal-body ui-front">
				<form name="msgform" action="BoardDeleteAction.mh" method="post">
					<div class="form-group">
						<b class="articleDesc">진짜 삭제하시겠습니까?</b><br>
					</div>
					<br>
					<div class="clearfix form-group">
						<button type="submit" class="btn btn-primary">삭제</button>
						<button type="button" class="btn btn-info" data-dismiss="modal">취소</button>
					</div>
					
					<input type="hidden" name="num" value="${param.num}">
				</form>
			</div>
		</div>
	</div>
</div>