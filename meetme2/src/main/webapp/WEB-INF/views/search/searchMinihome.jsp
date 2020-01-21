<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<body data-target="#nino-navbar" data-spy="scroll">
	<jsp:include page="../main/header.jsp" />
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
									<div class="col-md-6">
										<div class="panel-group" id="accordion" role="tablist"
											aria-multiselectable="true">
											<div class="panel panel-default">
												<div class="panel-heading" role="tab" id="headingThree">
													<h4 class="panel-title">
														<a class="collapsed" role="button" data-toggle="collapse"
															data-parent="#accordion" href="#collapseThree"
															aria-expanded="false" aria-controls="collapseThree">
															<i class="mdi mdi-chevron-up nino-icon arrow"></i> <i
															class="mdi mdi-laptop-mac nino-icon"></i> web design
														</a>
													</h4>
												</div>
												<div id="collapseThree" class="panel-collapse collapse"
													role="tabpanel" aria-labelledby="headingThree">
													<div class="panel-body">context.</div>
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
									<li href="event.main?event=${event.EVENT_NUM}">
										<div layout="row">
											<div class="nino-symbol fsr">
												<img
													src="resources${event.EVENT_SAVE}" alt="" class="square">
											</div>
											<div>
												<p class="quote">${event.EVENT_CONTENT}</p>
												<span class="number">${event.EVENT_DATE}</span><br> <span
													class="name">${event.EVENT_TITLE}</span>
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