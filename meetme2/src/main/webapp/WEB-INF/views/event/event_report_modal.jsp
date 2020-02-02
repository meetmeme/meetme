<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 신고 모달 -->
<div class="modal fade" id="layerpop3">
	<div class="modal-dialog" style="left:50px">
		<div class="modal-content">
			<!-- header -->
			<div class="modal-header">
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">×</button>
				<!-- header title -->
				<h4 class="modal-title">신고하기</h4>
			</div>
			<!-- body -->
			<div class="modal-body ui-front">
				<form action="eventReport.event" method="post" >
					<div class="form-group">
						<b class="articleDesc">신고자</b> 
						<input class="form-control"	type="text" id="reporter" name="reporter"
							value="${user_name1 }" readonly="readonly"><br>
					</div>
					<div class="form-group">
						<b class="articleDesc">신고사유</b>
						<textarea rows="10" cols="10" class="form-control"
							name="Content" placeholder="신고사유를 작성하세요!" required></textarea>
					</div>
					<br>
					<div class="clearfix form-group">
						<button type="submit" class="btn btn-primary submitbtn">SEND</button>
					</div>
					
					<input type=hidden name="event_num" value="${event.EVENT_NUM}" >
				</form>
			</div>
		</div>
	</div>
</div>