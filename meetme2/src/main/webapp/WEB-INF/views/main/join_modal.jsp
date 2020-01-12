<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 회원가입 모달 -->
	<div class="modal fade" id="layerpop2" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- 닫기(x) 버튼 -->
	        <button type="button" class="close" data-dismiss="modal">×</button>
	        <!-- header title -->
	        <h4 class="modal-title">JOIN</h4>
	        <img src='resources/image/backicon.png' class="backbtn2">
	        <img src='resources/image/backicon.png' class="backbtn3">
	        <!-- <div>아이콘 제작자 <a href="https://www.flaticon.com/kr/authors/roundicons" title="Roundicons">Roundicons</a> from <a href="https://www.flaticon.com/kr/" title="Flaticon">www.flaticon.com</a></div>-->
	        
	      </div>
	      <!-- body -->
	      <div class="modal-body">
	            <form id="join" name="joinform" action="joinProcess.net" method="post"  enctype="multipart/form-data">
					<div id="join1">
						<div class="form-group">
						<b>아이디</b>
				   		<input class="form-control" type="text" name="user_id"  placeholder="Enter Id"  maxLength=12 required>
				   		<span id="message"></span>
				   		</div>
				   		
				   		<div class="form-group">
				 		<b>비밀번호</b>
				   		<input class="form-control" type="password" name="user_pass" placeholder="Enter password" required>
				   		</div>
				   		
				   		<div class="form-group">
				   		<b>이름</b>
				   		<input class="form-control" type="text" name="user_name" placeholder="Enter name" maxlength=15 required>
				   		</div>
				   		
				   		<div class="form-group">
				   		<b>나이</b>
				   		<input class="form-control" type="text" name="user_age" maxlength=2 placeholder="Enter age" required>
				   		</div>
				   		
				   		<div class="form-group">
				   		<b>성별</b>
				   		<div>
				             <input type="radio" name="user_gender" value="남 " checked><span>남자</span>
				             <input type="radio" name="user_gender" value="여" ><span>여자</span>
				         </div>
				   		</div>
				   		
				   		<div class="form-group">
				   		<b>지역</b>
				   		<input class="form-control" type="text" name="user_city" placeholder="Enter city" maxlength=30>
				   		</div>
				   		
				   		<div class="form-group">
				   		<b>이메일 주소</b>
				         <input class="form-control" type="text" name="user_email" placeholder="Enter email" required><span id="email_message"></span>
				   		</div>
				   		
				   		<div class="clearfix form-group">
				         	<button type="button" class="btn btn-primary nextbtn1">다음</button>
				        </div>
			        </div>
			        
			        <!-- 이미지 설정 -->
			       
			        <div id="join2">
						<div class="imgcontainer">
							<div class="imgcontainer">
								<label>
									<input type="file" name="uploadfile" accept="image/gif, image/jpeg, image/png"
									style="display:none;">
									<img src="resources/image/default.png" alt="Avatar" class="avatar">
								</label>
							</div>
						</div>
						<p>상단의 이미지를 클릭 해 회원님만의 특별한 이미지를 설정해주세요!</p>
						<div class="clearfix form-group">
				         	<button type="button" class="btn btn-primary nextbtn2">다음</button>
				        </div>
			        </div>
			         
			        <!-- 흥미분야 선택 -->
			        <div id="join3">
						<div>
							<div class="category">
								<c:forEach var="cat" items="${category}">
									<p class="cat_p">
										<img class="category_img" src="resources/image/category/${cat.CATEGORY_NAME}.png" alt="${cat.CATEGORY_NUM}">
										<input type="hidden" class="sel_category"  name="sel_category"> 
										<br><span class="cap1">${cat.CATEGORY_NAME}</span> 
									</p>
								</c:forEach>
							</div>
						</div>
						
						<div class="clearfix form-group">
			         		<button type="submit" class="btn btn-primary submitbtn">회원가입</button>
			        	</div>		        
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
