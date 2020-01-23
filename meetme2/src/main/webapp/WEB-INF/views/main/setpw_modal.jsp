<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 로그인 모달 -->
	<div class="modal fade" id="layerpop5" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- 닫기(x) 버튼 -->
	        <button type="button" class="close" data-dismiss="modal">×</button>
	        <!-- header title -->
	        <h4 class="modal-title">Forgot Your Password?</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body">
	            <form name="loginform" action="setPasswordRequest.net" method="post">
	            <p>Enter your email address below, <br>and we'll email you instructions on how to change your password.</p>
					<div class="form-group">
						<b class="articleDesc">Email address</b>
						<input class="form-control" type="text" name="email" placeholder="Enter email" required
						value="${saveid}">
						<br>
					</div>
					<br>
					<div class="clearfix form-group">
						<button type="submit" class="btn btn-primary submitbtn">비밀번호 찾기</button>
					</div>
				</form>
	      </div>
	      <!-- Footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
