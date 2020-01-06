<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="resources/css2/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/css2/animate.css">
<link rel="stylesheet" href="resources/css2/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css2/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/css2/magnific-popup.css">
<link rel="stylesheet" href="resources/css2/aos.css">
<link rel="stylesheet" href="resources/css2/ionicons.min.css">
<link rel="stylesheet" href="resources/css2/bootstrap-datepicker.css">
<link rel="stylesheet" href="resources/css2/jquery.timepicker.css">
<link rel="stylesheet" href="resources/css2/flaticon.css">
<link rel="stylesheet" href="resources/css2/icomoon.css">
<link rel="stylesheet" href="resources/css2/style.css">

<title>Insert title here</title>
</head>
<body>
	<aside id="colorlib-aside" role="complementary"
		class="js-fullheight text-center">
		<h1 id="colorlib-logo">
			<a href="index.html">Meet Me<span>.</span></a>
		</h1>
		<nav id="colorlib-main-menu" role="navigation">
			<ul>
				<li class="colorlib-active"><a href="mmain.mh?${user_id}">홈</a></li>
				<li><a href="mprofile.mh">프로필</a></li>
				<li><a href="mboard.mh">게시판</a></li>
				<li><a href="mevent.mh">이벤트</a></li>
				<li><a href="mguestboot.mh">방명록</a></li>
			</ul>
		</nav>

		<div class="colorlib-footer">
			<p>
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				Copyright &copy;
				<script>
					document.write(new Date().getFullYear());
				</script>
				All rights reserved | This template is made with <i
					class="icon-heart" aria-hidden="true"></i> by <a
					href="https://colorlib.com" target="_blank">Colorlib</a>
			<ul>
				<select name=neighbor id=neighbor onchange="neighbor()">
					<option value="" selected>이웃목록</option>
					<option value="1">김현윤</option>
					<option value="2">주혜원</option>
					<option value="3">이소희</option>
					<option value="4">홍찬미</option>
				</select>
			</ul>
		</div>
	</aside>
	<!-- END COLORLIB-ASIDE -->


</body>
</html>