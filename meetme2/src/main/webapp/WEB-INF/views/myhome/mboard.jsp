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
		<div id="colorlib-main">
			<section class="ftco-section" style="padding-top: 10px;">
				<div class="container">
					<div class="row">
						<div>
							<div class="row">
								<div class="col-md-12">
									<div class="blog-entry ftco-animate">
										<div id="write"></div>
									</div>
								</div>
								<c:set var="num" value="${listcount-(page-1)*10}" />
								<c:forEach var="b" items="${boardlist}">
									<div class="col-md-12">
										<div class="blog-entry ftco-animate">
										<c:if test="${!empty b.BOARD_PHOTO }">
											<img  class="img"
											 src="resources/upload${b.BOARD_PHOTO}">
										</c:if>
											<div class="text pt-2 mt-3">
												<span class="category mb-1 d-block">날짜</span>
												<h3 class="mb-4">${b.BOARD_TITLE}</h3>
												<p class="mb-4">${b.BOARD_CONTENT}</p>
												<div class="meta-wrap d-md-flex align-items-center">
													<div class="half order-md-last text-md-right">
														<a href="BoardModifyView.mh?id=${user_id1}&num=${b.BOARD_NUM }">
															<button type=button id=modify_btn class='btn float-right p-3 px-xl-4 py-xl-3'>수정하기</button>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="row mt-5">
								<div class="col">
									<div class="block-27">
										<ul>
											<c:if test="${page <= 1}">
												<li><a href="#">&lt;</a></li>
											</c:if>
											<c:if test="${page > 1}">
												<li><a href="mboard.mh?id=<%=id%>&page=${page-1 }">&lt;</a></li>
											</c:if>


											<!-- <li class="active"><span>1</span></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#">5</a></li> -->
											<c:forEach var="a" begin="${startpage }" end="${endpage }">
												<c:if test="${a == page }">
													<li class="page-item"><a class="page-link" href="#">${a}</a>
													</li>
												</c:if>
												<c:if test="${a != page }">
													<li class="page-item"><a
														href="mboard.mh?id=<%=id%>&page=${a }" class="page-link">${a }</a>
													</li>
												</c:if>
											</c:forEach>

											<c:if test="${page >= maxpage }">
												<li><a href="#">&gt;</a></li>
											</c:if>
											<c:if test="${page < maxpage}">
												<li><a href="mboard.mh?id=<%=id%>&page=${page+1}">&gt;</a></li>
											</c:if>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- END-->
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
				if (varName.toUpperCase() == paramName.toUpperCase()) {
					returnValue = parameters[i].split('=')[1];
					return decodeURIComponent(returnValue);
				}
			}
		};
		console.log("getParameters('id')>>>>>"+getParameters('id'));
		if (getParameters('id') == "${user_id1}"){
			$("#write")
					.append(
							"<button type=button id=write_btn class='btn float-right p-3 px-xl-4 py-xl-3'>글 쓰 기</button>");
		}

		$('#write_btn').click(function() {
			location.href = "BoardWrite.mh?id=" + "${user_id1}";
		});
	</script>
</body>
</html>