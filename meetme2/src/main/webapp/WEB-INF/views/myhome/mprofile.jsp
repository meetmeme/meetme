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
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<style>
#edit_img{
	position:relative;
	top:-20px;
	left:230px;
	color:black;
	border-radius:30%;
	background:white;
	width:30px;
	height:30px;
}

#edit_btn{
	background : none;
	text-align: right;
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

						<h2 class="h4 font-weight-bold">기본 프로필</h2>

						<div class="row block-9">
							<div class="col-md-6 order-md-last pr-md-5">
								<form action="#">
									<div class="row d-flex mb-5 contact-info">
										<div class="col-md-12 mb-4"></div>
										<div class="col-md-12 mb-4"><button id="edit_btn"><span class="glyphicon glyphicon-pencil"></span></button>  Name: ${userinfo.user_name}</div>
										<div class="col-md-12 mb-4"><button id="edit_btn"><span class="glyphicon glyphicon-pencil"></span></button>  Gender: ${userinfo.user_gender}</div>
										<div class="col-md-12 mb-4"><button id="edit_btn"><span class="glyphicon glyphicon-pencil"></span></button>  Age: ${userinfo.user_age}</div>
										<div class="col-md-12 mb-4"><button id="edit_btn"><span class="glyphicon glyphicon-pencil"></span></button>  Address: ${userinfo.user_city}</div>
										<div class="col-md-12 mb-4"><button id="edit_btn"><span class="glyphicon glyphicon-pencil"></span></button>  Hobby: 등산, 독서</div>
									</div>
								</form>
							</div>

							<div class="col-md-4">
								<input type="file" name="uploadfile" accept="image/gif, image/jpeg, image/png" style="display: none;">
								<img alt="poster" src="resources/upload/${userinfo.user_original}" id="image"
									class="img-thumbnail img-responsive"
									style="width: 100%; margin-top: 10px;">
								<button id="edit_img"><span class="glyphicon glyphicon-camera"></span></button>
							</div>
						</div>
						<hr>
						<h2 class="h4 font-weight-bold">미니홈피 프로필</h2>
						<br>
						<div class="col-md-6 order-md-last pr-md-5">
							<form action="#">
								<div class="row d-flex mb-5 contact-info">
									<div class="col-md-12 mb-3"><button id="edit_btn"><span class="glyphicon glyphicon-music"></span></button>  BGM: 트와이스-Cheer Up</div>
									<div class="col-md-12 mb-3"><button id="edit_btn"><span class="glyphicon glyphicon-pencil"></span></button>  Introduce: ${mhinfo.myhome_intro}</div>
								</div>
							</form>

						</div>
					</div>
				</section>

			</div>
			<!-- END COLORLIB-MAIN -->
		</div>
		<!-- END COLORLIB-PAGE -->

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
</body>
</html>