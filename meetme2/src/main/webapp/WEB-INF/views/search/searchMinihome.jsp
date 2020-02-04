<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp" />
<body data-target="#nino-navbar" data-spy="scroll">
	
	<div class=bodyMin>
		<hr>
		<!-- search keyword
    ================================================== -->
		<section id=searchKeywordShow>
			<div class="container center">
				<div layout="row">
					<div class="item">
						<div class="text">Keyword</div>
						<c:if test="${empty searchKey.keyword}">
							<div class="number">-</div>
						</c:if>
						<c:if test="${!empty searchKey.keyword}">
							<div class="number">${searchKey.keyword}</div>
						</c:if>
					</div>
					<div class="item">
						<div class="text">Hashtag</div>
						<c:if test="${empty searchKey.searchHashtag}">
							<div class="number">-</div>
						</c:if>
						<c:if test="${!empty searchKey.searchHashtag}">
							<div class="number">${searchKey.searchHashtag}</div>
						</c:if>
					</div>
					<div class="item">
						<div class="text">Name or ID</div>
						<c:if test="${empty searchKey.searchUser}">
							<div class="number">-</div>
						</c:if>
						<c:if test="${!empty searchKey.searchUser}">
							<div class="number">${searchKey.searchUser}</div>
						</c:if>
					</div>
				</div>
			</div>
		</section>
		<!--/#search keyword-->
		<hr>
		<!-- minihome result -->
		<div class=bodySubMinMain>
			<!-- Story About Us
    ================================================== -->
			<section id="nino-story">
				<div class="container">
					<h2 class="nino-sectionHeading">
						<span class="nino-subHeading">Minihome</span>
					</h2>
					<p class="nino-sectionDesc"></p>
					<div class="sectionContent">
						<div class="row nino-hoverEffect">
							<c:if test="${empty minihome}">
								<p class=center>검색 결과가 없습니다.</p>
							</c:if>
							<c:if test="${!empty minihome}">
								<c:forEach var="home" items="${minihome}">
									<div class="col-md-4 col-sm-4">
										<div class="item">
											<a class="overlay" onClick="mh_popup('${home.user_id}')"
												title="go to ${home.user_id}'s minihome"> <span
												class="content"> <i class="mdi mdi-airplay nino-icon"></i>
													${home.user_name} <br>
												<span>(${home.user_id})</span>
											</span> <img src="resources/upload${home.user_save}" alt="">
											</a>
										</div>
										<p>${home.user_name}</p>

									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</section>
			<!--/#nino-story-->
		</div>

		<hr>

		<!-- post result -->
		<div class=bodySubMin>
			<!-- What We Do  ================================================== -->
			<section id="nino-whatWeDo">
				<div class="container">
					<h2 class="nino-sectionHeading">
						<span class="nino-subHeading">Posts</span>
					</h2>
					<p class="nino-sectionDesc">Look who's talking about issue you
						searched</p>
					<div class="sectionContent">
						<div class="row">
							<c:if test="${empty posts}">
								<p class=center>검색 결과가 없습니다.</p>
							</c:if>
							<c:if test="${!empty posts}">
								<c:forEach var="post" items="${posts}">
									<div class="col">
										<div class="panel-group" id="accordion" role="tablist"
											aria-multiselectable="true">
											<div class="panel panel-default">
												<div class="panel-heading" role="tab" id="headingThree">
													<h4 class="panel-title">
														<a class="collapsed" role="button" data-toggle="collapse"
															data-parent="#accordion" href="#collapse${post.BOARD_NUM}"
															aria-expanded="false" aria-controls="collapse${post.BOARD_NUM}">
															<i class="mdi mdi-chevron-up nino-icon arrow"></i> <i
															class="mdi mdi-laptop-mac nino-icon"></i> ${post.BOARD_TITLE} <span class="small">by ${post.BOARD_ID}</span>
														</a>
													</h4>
												</div>
												<div id="collapse${post.BOARD_NUM}" class="panel-collapse collapse cursor"
													role="tabpanel" aria-labelledby="headingThree" onclick="return board_popup('${post.BOARD_ID}');">
													<div class="panel-body">${post.BOARD_CONTENT}</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</section>
			<!--/#nino-whatWeDo-->

		</div>

		<hr>

		<!-- event result -->
		<div class=bodySubMin>
			<!-- Testimonial
    ================================================== -->
			<section class="nino-testimonial">
				<div class="container">
					<h2 class="nino-sectionHeading">
						<span class="nino-subHeading">Events</span>
					</h2>
					<div class="nino-testimonialSlider">
						<c:if test="${empty events}">
							<p class=center>검색 결과가 없습니다.</p>
						</c:if>
						<c:if test="${!empty events}">
							<ul>
								<c:forEach var="event" items="${events}">
									<li onclick="return searchEventLoginCheck('${event.EVENT_NUM}');">
										<div layout="row">
											<div class="nino-symbol fsr cursor">
												<img
													src="resources/upload/event${event.EVENT_SAVE}" alt="" class="square">
											</div>
											<div>
												<p class="quote cursor">${event.EVENT_CONTENT}</p>
												<span class="number cursor">${event.EVENT_DATE}</span><br> <span
													class="quote cursor"><strong>${event.EVENT_TITLE}</strong></span>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</c:if>
					</div>
				</div>
			</section>
			<!--/#nino-testimonial-->
		</div>
		<hr>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>