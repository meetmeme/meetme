<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>마이홈 - 메인</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
	
<script src="resources/js/myhomefollow.js"></script>
<jsp:include page="/WEB-INF/views/myhome/mnavi.jsp" />
<style>
#follow {
	position: relative;
	top: 300px;
	font-size: 20px;
}
</style>
</head>
<body>
	<%
		String id = request.getParameter("id");
	%>
	<input type="hidden" name="id" value="<%=id%>">
	<div id="colorlib-page">

		<div id="colorlib-main">
			<div class="hero-wrap hero-wrap-2 js-fullheight"
				style="background-image: url(resources/images2/whitespace.jpg);"
				data-stellar-background-ratio="0.5">

				<div
					class="js-fullheight d-flex justify-content-center align-items-center">
					<div class="col-md-8 text text-center">
						<div class="img mb-4"
							style="background-image: url(resources/upload/${m_info.user_save};"></div>
						<div class="desc">
							<h2 class="subheading">Hello I'm</h2>
							<h1 class="mb-4">${m_info.user_id}</h1>
							<p class="mb-4">${mh_info.myhome_intro}</p>
							<ul class="ftco-social mt-3">

							</ul>
						</div>
					</div>
					<div id="follow">
						<a href="#" id="follow_btn" style="background: none; border: none;"
							onclick="follow('${m_info.user_num}','${m_info.user_name}')"
							title="follow ${m_info.user_name}!"><label>
							<span class="glyphicon glyphicon-heart"> follow</span></label>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/myhome/mscript.jsp" />

</body>
</html>