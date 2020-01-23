<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 로그인 모달 -->
	<div class="modal fade" id="layerpop" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- 닫기(x) 버튼 -->
	        <button type="button" class="close" data-dismiss="modal">×</button>
	        <!-- header title -->
	        <h4 class="modal-title">LOGIN</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body">
	            <form name="loginform" action="loginProcess.net" method="post">
					<div class="form-group">
						<b class="articleDesc">ID</b>
						<input class="form-control" type="text" name="user_id1" placeholder="Enter id" required
						value="${saveid}">
						<br>
					</div>
					<div class="form-group">
						<b class="articleDesc">PASSWORD</b>
						<input class="form-control" type="password" name="user_pass1" placeholder="Enter password" required>
					</div>
					<div>
						<input type="checkbox" name="u" class="articleDesc" id="idSaveCheck">Remember me
						<a class=right href="#" data-target="#layerpop5" data-toggle="modal">Forgot your password?</a>
					</div>
					<br>
					<div class="clearfix form-group">
						<button type="submit" class="btn btn-primary submitbtn">로그인</button>
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
