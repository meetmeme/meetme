<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 회원 탈퇴 모달 -->
<div class="modal fade" id="layerpop3">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- header -->
			<div class="modal-header">
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">×</button>
				<!-- header title -->
				<h4 class="modal-title">탈퇴하기</h4>
			</div>
			<!-- body -->
			<div class="modal-body ui-front">
				<form name="msgform" action="leave.mh" method="post">
					<div class="form-group">
						<b class="articleDesc">비밀번호 확인.</b> <input class="form-control"
							type="password" id="password" name="password"><br>
					</div>
					<br>
					<div class="clearfix form-group">
						<button type="submit" class="btn btn-primary submitbtn">탈퇴하기</button>
					</div>
					
					<input type=hidden name=user_id value="${user_id1 }" >
				</form>
			</div>
		</div>
	</div>
</div>