<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Elen - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="/WEB-INF/views/myhome/mnavi.jsp" />
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="resources/js/myhomeinfo.js"></script>


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

#edit_input {
	float: right;
	width: 200px;
}

#myModal {
	display: none;
	left: -250px;
	justify-content: center;
}

.modal {
	justify-content: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
		left: 0;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

input, textarea {
	background: none;
}
</style>
</head>
<body>

	<div id="colorlib-page">
		<div id="colorlib-main">
			<div class="hero-wrap hero-wrap-2 js-fullheight"
				style="background-image: url(resources/images2/wooden-floor.jpg);"
				data-stellar-background-ratio="0.5">
				<div class="overlay"></div>

				<section class="ftco-section contact-section">
					<div class="container">
						<form action="#">

							<h2 class="h4 font-weight-bold">기본 프로필</h2>

							<div class="row block-9">
								<div class="col-md-4">
									<img alt="my_img"
										src="resources/upload/${userinfo.user_original}" id="image"
										class="img-thumbnail img-responsive"
										style="width: 100%; margin-top: 10px;"> <label
										id="edit_label"><input type="file" name="uploadfile"
										accept="image/gif, image/jpeg, image/png"
										style="display: none;"> <a href="#" id="edit_img">
											<span class="glyphicon glyphicon-camera"></span>
									</a></label>
								</div>
								<div class="col-md-1 order-md-last pr-md-5"></div>
								<div class="col-md-5 order-md-last pr-md-5">
									<div class="row d-flex mb-5 contact-info">
										<div class="col-md-12 mb-4"></div>
										<div class="col-md-12 mb-4">
											<button id="edit_btn" data-toggle="modal"
												data-target="#myModal">
												<span class="glyphicon glyphicon-pencil"></span>
											</button>
											Name: <input type="text" name="name" id="edit_input"
												value="${userinfo.user_name}">
										</div>
										<div class="col-md-12 mb-4">
											<button id="edit_btn">
												<span class="glyphicon glyphicon-pencil"></span>
											</button>
											Password: <input type="password" name="name" id="edit_input"
												value="${userinfo.user_pass}">
										</div>
										<div class="col-md-12 mb-4">
											<button id="edit_btn">
												<span class="glyphicon glyphicon-pencil"></span>
											</button>
											Gender: <input type="text" name="name" id="edit_input"
												value="${userinfo.user_gender}">
										</div>
										<div class="col-md-12 mb-4">
											<button id="edit_btn">
												<span class="glyphicon glyphicon-pencil"></span>
											</button>
											Age: <input type="text" name="name" id="edit_input"
												value="${userinfo.user_age}">
										</div>
										<div class="col-md-12 mb-4">
											<button id="edit_btn">
												<span class="glyphicon glyphicon-pencil"></span>
											</button>
											Address: <input type="text" name="name" id="edit_input"
												value="${userinfo.user_city}">
										</div>
										<div class="col-md-12 mb-4">
											<button id="edit_btn">
												<span class="glyphicon glyphicon-pencil"></span>
											</button>
											Interests: <label><input type=checkbox name=category
												id=outdoor value=1>등산</label> <label><input
												type=checkbox name=category id=technology value=2>기술</label>
											<label><input type=checkbox name=category id=family
												value=3>가족</label> <label><input type=checkbox
												name=category id=healthy value=4>건강</label> <label><input
												type=checkbox name=category id=sports value=5>운동</label> <label><input
												type=checkbox name=category id=study value=6>학습</label> <label><input
												type=checkbox name=category id=language value=7>언어</label> <label><input
												type=checkbox name=category id=photo value=8>사진</label> <label><input
												type=checkbox name=category id=music value=9>음악</label> <label><input
												type=checkbox name=category id=dance value=10>춤</label> <label><input
												type=checkbox name=category id=game value=11>게임</label> <label><input
												type=checkbox name=category id=pet value=12>애완동물</label> <label><input
												type=checkbox name=category id=DIY value=13>DIY</label>
										</div>
									</div>



								</div>

								<div class="col-md-9 order-md-last pr-md-5">
									<h2 class="h4 font-weight-bold">미니홈피 프로필</h2>
									<br>
									<div class="col-md-12 mb-3">
										<button id="edit_btn">
											<span class="glyphicon glyphicon-music"></span>
										</button>
										BGM: 트와이스-Cheer Up
									</div>
									<div class="col-md-12 mb-3">
										<button id="edit_btn">
											<span class="glyphicon glyphicon-pencil"></span>
										</button>
										Introduce:
										<textarea name="intro" rows="2" class="form-control">${mhinfo.myhome_intro}</textarea>
									</div>

								</div>
							</div>
							<div class="form-group" style="text-align: center;">
								<button type=submit class="btn btn-primary">수정</button>
								<button type=reset class="btn btn-info">취소</button>
							</div>
						</form>
					</div>
				</section>

			</div>
			<!-- END COLORLIB-MAIN -->
		</div>
		<!-- END COLORLIB-PAGE -->

		<!-- MODAL -->
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal body -->
					<div class="modal-body">
						<form name="ModiForm" action="NameUpdate.mh" method="post">
							<div class="form-group">
								<label for="name">Name 수정</label> <input type="text"
									class="form-control" placeholder="수정할 이름을 입력하세요" name="name"
									id="name">
							</div>
							<button type="submit" class="btn btn-primary" id="modal_submit">Submit</button>
							<button type="button" class="btn" data-dismiss="modal"
								style="background: #27AE60; color: white;">Close</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- loader -->
		<div id="ftco-loader" class="show fullscreen">
			<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
					stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
					stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/myhome/mscript.jsp" />
	<script>
	
    var list = new Array();
    <c:forEach items="${user_interests}" var="item">
    list.push("${item.category_num}");
    </c:forEach>
    $('input:checkbox[name="category"]').each(function() {
	    for(var i =0;i<list.length;i++){
	    	console.log(list[i]);
	    	if(this.value == list[i]){ //값 비교
	    		
	    		this.checked = true; //checked 처리
	     	}
	    }
    })
	</script>
</body>
</html>