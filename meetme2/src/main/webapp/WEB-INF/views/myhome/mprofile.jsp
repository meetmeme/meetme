<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>마이홈 - 프로필</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="/WEB-INF/views/myhome/mnavi.jsp" />
<script src="resources/js/myhomeinfo.js"></script>
<jsp:include page="/WEB-INF/views/myhome/leave_modal.jsp" />


<style>
#edit_label {
	position: relative;
	top: -20px;
	left: 230px;
	border-radius: 30%;
	width: 30px;
	height: 30px;
	background: white;
}

#edit_img {
	color: black;
	border-radius: 30%;
	background: white;
}

#edit_btn {
	background: none;
	text-align: right;
}

#edit_input, #gender {
	float: right;
	width: 220px;
}

input, textarea {
	background: none;
}
</style>
</head>
<body>
	<%
		Connection dbconn;
		Statement stmt;
		ResultSet rs;
		String user_gender;
		String id = request.getParameter("id");

		String sql = "select * from mm_user where user_id='" + id + "'";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SCOTT", "tiger");
		stmt = dbconn.createStatement();
		rs = stmt.executeQuery(sql);

		rs.next();
		user_gender = rs.getString("user_gender");
	%>
	<div id="colorlib-page">
		<div id="colorlib-main" style="font: 10px;">
			<div class="hero-wrap hero-wrap-2 js-fullheight"
				style="background-image: url(resources/images2/whitespace.jpg);"
				data-stellar-background-ratio="0.5">
				<div class="overlay"></div>

				<section class="ftco-section contact-section"
					style="padding-top: 30px;">
					<form action="updateProfile.mh" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="user_id" value="${userinfo.user_id}">
						<input type="hidden" name="user_num" value="${userinfo.user_num}">
						<input type="hidden" name="myhome_num"
							value="${mhinfo.myhome_num}">
						<div class="container">

							<h2 class="h4 font-weight-bold">기본 프로필</h2>
							<div class="row block-9">
								<div class="col-md-4">
									<img alt="my_img" src="resources/upload${userinfo.user_save}"
										id="image" class="img-thumbnail img-responsive"
										style="width: 100%; margin-top: 10px;"> <label
										id="edit_label"><input type="file" name="uploadfile"
										accept="image/gif, image/jpeg, image/png"
										style="display: none;"> <a href="#" id="edit_img">
											<span class="glyphicon glyphicon-camera"></span>
									</a></label>
								</div>
								<div class="col-md-1 order-md-last pr-md-4"></div>
								<div class="col-md-6 order-md-last pr-md-4"
									style="height: 300px;">

									<div class="row d-flex mb-5 contact-info">
										<div class="col-md-12 mb-4"></div>
										<div class="col-md-12 mb-4">
											Name: <input type="text" name="user_name" id="edit_input"
												value="${userinfo.user_name}">
										</div>
										<div class="col-md-12 mb-4">
											Password: <input type="password" name="user_pass"
												id="edit_input" value="${userinfo.user_pass}">
										</div>
										<div class="col-md-12 mb-4">
											Email: <input type="text" name="user_email" id="edit_input"
												value="${userinfo.user_email}">
										</div>
										<div class="col-md-12 mb-4">
											Gender: <span id="gender"><input type="radio"
												name="user_gender" value="남 "
												<%if (user_gender.equals("남")) {%> checked="checked" <%}%>><span>남자</span>
												<input type="radio" name="user_gender" value="여"
												<%if (user_gender.equals("여")) {%> checked="checked" <%}%>><span>여자</span>
											</span>
										</div>
										<div class="col-md-12 mb-4">
											Age: <input type="text" name="user_age" id="edit_input"
												value="${userinfo.user_age}">
										</div>
										<div class="col-md-12 mb-4">
											Address: <input type="text" name="user_city" id="edit_input"
												value="${userinfo.user_city}">
										</div>
										<div class="col-md-12 mb-4">
											Interests:
											<c:forEach var="c" items="${categoryList}" varStatus="status">
												<label><input type=checkbox name=category id=family
													value=${status.count}>${c.CATEGORY_NAME}</label>
											</c:forEach>

										</div>
									</div>

								</div>

								<div class="col-md-4 order-md-last pr-md-4">
									<h2 class="h4 font-weight-bold">미니홈피 프로필</h2>
									<br>
									<div class="row d-flex mb-5 contact-info">
										<div class="col-md-12 mb-3">
											BGM: <select name=myhome_bgm id=myhome_bgm>
												<c:forEach items="${bgm}" var="bgm">
													<option value="${bgm.BGM_NAME}">${bgm.BGM_NAME}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-md-12 mb-3">
											Introduce:
											<textarea name="myhome_intro" rows="6" class="form-control">${mhinfo.myhome_intro}</textarea>
										</div>
									</div>
								</div>
								<div class="col-md-4 order-md-last pr-md-8" style="top: 220px; left:200px;">
									<div class="form-group" style="text-align: center;">
										<button type=submit class="btn btn-info">수정</button>
										<button type=reset class="btn" style="background: #f8e77f">취소</button>
										<button type=button id="leave" class="btn btn-primary"
											data-target="#layerpop3" data-toggle="modal">탈퇴</button>
									</div>
								</div>

							</div>
						</div>
					</form>
				</section>
			</div>
			<!-- END COLORLIB-MAIN -->
		</div>
		<!-- END COLORLIB-PAGE -->
	</div>
	<jsp:include page="/WEB-INF/views/myhome/mscript.jsp" />
	<script>
		//interests 표시
		var list = new Array();
		<c:forEach items="${user_interests}" var="item">
		list.push("${item.category_num}");
		</c:forEach>
		$('input:checkbox[name="category"]').each(function() {
			for (var i = 0; i < list.length; i++) {
				if (this.value == list[i]) { //값 비교
					this.checked = true; //checked 처리
				}
			}
		})
		var list2 = new Array();
		<c:forEach items="${bgm}" var="item2">
		list2.push("${item2.BGM_NAME}");
		</c:forEach>
		var bgm='${mhinfo.myhome_bgm}';
		$('select[name="myhome_bgm"]').each(function() {
			for (var i = 0; i < list2.length; i++) {
				 if (bgm == list2[i]) { //값 비교
					 $("#myhome_bgm").val(list2[i]).prop("selected", true);
				} 
			}
		})
		
		
	</script>
</body>
</html>