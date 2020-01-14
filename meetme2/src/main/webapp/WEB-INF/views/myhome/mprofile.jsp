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
										<div class="col-md-12 mb-3">Name: 홍찬미</div>
										<div class="col-md-12 mb-3">Gender: 여</div>
										<div class="col-md-12 mb-3">Birthday: 1991.05.09</div>
										<div class="col-md-12 mb-3">Address: 서울시 종로구</div>
										<div class="col-md-12 mb-3">Hobby: 등산, 독서</div>
									</div>
								</form>

							</div>

							<div class="col-md-3">
								<img alt="poster" src="resources/images2/author.jpg" id="poster"
									class="img-thumbnail img-responsive"
									style="width: 100%; margin-top: 10px;">
							</div>
						</div>
						<h2 class="h4 font-weight-bold">미니홈피 프로필</h2>
						<div class="col-md-6 order-md-last pr-md-5">
							<form action="#">
								<div class="row d-flex mb-5 contact-info">
									<div class="col-md-12 mb-3">BGM: 트와이스-Cheer Up</div>
									<div class="col-md-12 mb-3">Introduce: ㄴr는 ㄱr끔 눈물을 흘린다.</div>
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