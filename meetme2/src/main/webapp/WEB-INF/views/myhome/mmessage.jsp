<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<title>Elen - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="/WEB-INF/views/myhome/mnavi.jsp" />
<jsp:include page="/WEB-INF/views/myhome/message_modal2.jsp" />
<!-- 자동완성 script -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
	<%
		String id = request.getParameter("id");
	%>
	<input type="hidden" name="id" value="<%=id%>">
	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>

		<div id="colorlib-main">
			<section class="ftco-section" style="padding-top: 10px;">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="row">
								<div class="col-md-12" style="padding-bottom: 10px;">
									<nav class="nav nav-pills flex-column flex-sm-row">
										<a class="flex-sm-fill text-sm-center nav-link"
											href="mmessage.mh?id=<%=id%>&page=send">보낸메시지</a> <a
											class="flex-sm-fill text-sm-center nav-link"
											href="mmessage.mh?id=<%=id%>&page=receive">받은메시지</a>
									</nav>
								</div>
								<c:forEach var="m" items="${messagelist}">
									<c:if test="${page eq 'send'}">
										<div class="col-md-6">
											<div class="blog-entry ftco-animate">
												<span>to : </span><span>${m.receiver_name }</span> <a href="#"
													data-target="#layerpop3"
													data-toggle="modal">message</a>
													<input type="hidden" value="${m.RECEIVER_ID}">
												<p class="mb-4">${m.CONTENT}</span>
												<p>
													<span>${m.SENT_DATE}</span>
												</p>
												<span>from : ${user.user_name}</span>
											</div>
										</div>
									</c:if>
									<c:if test="${page eq 'receive'}">
										<div class="col-md-6">
											<div class="blog-entry ftco-animate">
												<span>to : ${user.user_name}</span>
												<p class="mb-4">${m.CONTENT}</span>
												<p>
													<span>${m.SENT_DATE}</span>
												</p>
												<span>from : </span><span>${m.sender_name }</span> <a href="#"
													data-target="#layerpop3" data-toggle="modal">message</a>
													<input type="hidden" value="${m.SENDER_ID}">
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
							<!-- END-->
						</div>

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

	<jsp:include page="/WEB-INF/views/myhome/mscript.jsp" />

	<script>
		$(document).ready(
				function() {

					var getParameters = function(paramName) {
						// 리턴값을 위한 변수 선언
						var returnValue;

						// 현재 URL 가져오기
						var url = location.href;

						// get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
						var parameters = (url.slice(url.indexOf('?') + 1,
								url.length)).split('&');

						// 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return
						for (var i = 0; i < parameters.length; i++) {
							var varName = parameters[i].split('=')[0];
							if (varName.toUpperCase() == paramName
									.toUpperCase()) {
								returnValue = parameters[i].split('=')[1];
								return decodeURIComponent(returnValue);
							}
						}

					};

					if (getParameters('page') == "send") {
						$('a:nth-child(1)').addClass("active");
						$('a:nth-child(1)').siblings().removeClass(
								"colorlib-active");
					} else if (getParameters('page') == "receive") {
						$('a:nth-child(2)').addClass("active");
						$('a:nth-child(2)').siblings().removeClass(
								"colorlib-active");
					}
					
					$('a').on('click',function(){
						name = $(this).prev().text();
						user_num = $(this).next().val();
						console.log(user_num);
						$("#receiver").val(name);
						$("#receiver_num").val(user_num);
					})

				})
	</script>
</body>
</html>