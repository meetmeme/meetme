<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 메세지 모달 -->
<div class="modal fade" id="layerpop3">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- header -->
			<div class="modal-header">
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">×</button>
				<!-- header title -->
				<h4 class="modal-title">MESSAGE</h4>
			</div>
			<!-- body -->
			<div class="modal-body ui-front">
				<form name="msgform" action="sendMsg.cm" method="post" onsubmit="return check()">
					<div class="form-group">
						<b class="articleDesc">To.</b> <input class="form-control"
							type="text" id="receiver" name="receiver"
							readonly="readonly"><br>
					</div>
					<div class="form-group">
						<b class="articleDesc">MESSAGE</b>
						<textarea rows="10" cols="10" class="form-control"
							name="msgContent" placeholder="Message the Good news!" required></textarea>
					</div>
					<br>
					<div class="clearfix form-group">
						<button type="submit" class="btn btn-primary submitbtn">SEND</button>
					</div>
					
					<input type=hidden name=user_num value="${user_num1 }" >
					<input type=hidden name=receiver_num id=receiver_num >
				</form>
			</div>
		</div>
	</div>
</div>