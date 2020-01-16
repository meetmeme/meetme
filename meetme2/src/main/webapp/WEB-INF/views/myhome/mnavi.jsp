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
<script src="resources/js2/jquery-3.2.1.min.js"></script>

<script>
	$(document).ready(function() {
		var id_arr = new Array();
		id_arr = document.location.href.split("?");
		console.log("dd>>>" + id_arr[1]);
		console.log("dd2>>>" + "${userinfo.user_id}");
		if (id_arr[1]=="${userinfo.user_id}")
			$("#navi").append("<li><a href='mprofile.mh?"+"${user_id1}"+"'>프로필</a></li>");

		
		if (location.pathname == "/me/mmain.mh") {
			$('li:nth-child(1)').addClass("colorlib-active");
			$('li:nth-child(1)').siblings().removeClass("colorlib-active");
		} else if (location.pathname == "/me/mboard.mh") {
			$('li:nth-child(2)').addClass("colorlib-active");
			$('li:nth-child(2)').siblings().removeClass("colorlib-active");
		} else if (location.pathname == "/me/mevent.mh") {
			$('li:nth-child(3)').addClass("colorlib-active");
			$('li:nth-child(3)').siblings().removeClass("colorlib-active");
		} else if (location.pathname == "/me/mguest.mh") {
			$('li:nth-child(4)').addClass("colorlib-active");
			$('li:nth-child(4)').siblings().removeClass("colorlib-active");
		} else if (location.pathname == "/me/mprofile.mh") {
			$('li:nth-child(5)').addClass("colorlib-active");
			$('li:nth-child(5)').siblings().removeClass("colorlib-active");
		}

	});
</script>
<title>Insert title here</title>
</head>
<body>
	<aside id="colorlib-aside" role="complementary"
		class="js-fullheight text-center">
		<h1 id="colorlib-logo">
			<a href="mmain.mh?${userinfo.user_id}">Meet Me<span>.</span></a>
		</h1>
		<nav id="colorlib-main-menu" role="navigation">
			<ul id="navi">
				<li><a href="mmain.mh?${userinfo.user_id}">홈</a></li>

				<li><a href="mboard.mh?${userinfo.user_id}">게시판</a></li>
				<li><a href="mevent.mh?${userinfo.user_id}">이벤트</a></li>
				<li><a href="mguestbook.mh?${userinfo.user_id}">방명록</a></li>
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