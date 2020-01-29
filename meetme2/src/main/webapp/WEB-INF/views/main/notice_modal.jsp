<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 알림 모달 -->
<div class="modal fade" id="darkModalForm" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog form-dark" role="document">
		<!--Content-->
		<div class="modal-content card card-image modal-bgImg">
			<div
				class="text-white rgba-stylish-strong py-5 px-5 z-depth-4 modal-bg">
				<!--Header-->
				<div class="modal-header text-center pb-4">
					<button type="button" class="close white-text" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class='closeNotice'>&times;</span>
					</button>
					<br>
					<h3 class="modal-title w-100 white-text font-weight-bold"
						id="myModalLabel">
						<strong>Meet Me! </strong> <a class="green-text font-weight-bold"><strong>
								NOTIFICATION</strong></a>
					</h3>
				</div>
				<!--Body-->
				<div class="modal-body" id=noticeModal>
					<!--Body-->
					<!-- script ajax로 내용 넣음 -->
				</div>
			</div>
		</div>
		<!--/.Content-->
	</div>
</div>
