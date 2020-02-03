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
											href="mevent.mh?id=<%=id%>&page=all">전체</a> <a
											class="flex-sm-fill text-sm-center nav-link"
											href="mevent.mh?id=<%=id%>&page=expected">참여예정</a> <a
											class="flex-sm-fill text-sm-center nav-link"
											href="mevent.mh?id=<%=id%>&page=past" tabindex="-1"
											aria-disabled="true">과거</a>
									</nav>
								</div>
								<c:if test="${!empty eventlist}">
								<c:forEach var="e" items="${eventlist}">
									<div class="col-md-6">
										<div class="blog-entry ftco-animate">
											<a href="#" class="img img-2"
												style="background-image: url(resources${e.EVENT_SAVE});"></a>
											<div class="text text-2 pt-2 mt-3">
												<span class="category mb-3 d-block"><a href="#">Event</a></span>
												<h3 class="mb-4">
													<a href="#">${e.EVENT_TITLE}</a>
												</h3>
												<p class="mb-4">${e.EVENT_CONTENT}</p>
												<div class="author mb-4 d-flex align-items-center">
													<a href="#" class="img"
														style="background-image: url(resources/upload${e.user_photo});"></a>
													<div class="ml-3 info">
														<span>Written by</span>
														<h3>
															<a href="#">${e.user_name}</a>, <span>${e.EVENT_DATE}</span>
														</h3>
													</div>
												</div>
												<div class="meta-wrap align-items-center">
													<div class="half">
														<p>
															<a href="#" class="btn py-2"
															onclick="event_popup('${e.EVENT_NUM}')">이벤트 상세보기 </a>
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								</c:if>
								<c:if test="${empty eventlist}">
								<br><br><br><br><br><br><br><br><br><br><br><br><br>
								<div style="text-align: center;margin:0 auto"><h2>참여 이벤트 정보가 없습니다.</h2></div>
								</c:if>
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

					if (getParameters('page') == "all") {
						$('a:nth-child(1)').addClass("active");
						$('a:nth-child(1)').siblings().removeClass(
								"colorlib-active");
					} else if (getParameters('page') == "expected") {
						$('a:nth-child(2)').addClass("active");
						$('a:nth-child(2)').siblings().removeClass(
								"colorlib-active");
					} else if (getParameters('page') == "past") {
						$('a:nth-child(3)').addClass("active");
						$('a:nth-child(3)').siblings().removeClass(
								"colorlib-active");
					}
				})
	</script>
</body>
</html>