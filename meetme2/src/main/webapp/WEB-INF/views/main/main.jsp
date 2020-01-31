<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<script src="resources/js/main.js"></script>
<body data-target="#nino-navbar" data-spy="scroll">
	<jsp:include page="header.jsp" />

	<input type="hidden" id=userIdCache value="${user_id1}">
	<!-- Testimonial
    ================================================== -->
	<section class="nino-testimonial bg-white">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">events</span> Interesting Events
			</h2>
			<div class="nino-testimonialSlider">
				<ul>
					<c:if test="${empty event}">
						<li>
							<div layout="row" class="verticalCenter cursor"
									onclick="return searchEvent_main()">
									<div class="nino-avatar fsr">
										<img class="img-circle img-thumbnail square"
											src="https://source.unsplash.com/random/300x300" alt="">
									</div>
									<div>
										<p class="quote">
											<strong>"</strong>관심 카테고리의 이벤트가 없습니다. 😥<strong>"</strong>
										</p>
									</div>
								</div>
						</li>
					</c:if>
					<c:if test="${!empty event}">
						<c:forEach var="event" items="${event}">
							<li>
								<div layout="row" class="verticalCenter cursor"
									onclick="location.href='event.main?event=${event.EVENT_NUM}'">
									<div class="nino-avatar fsr">
										<img class="img-circle img-thumbnail square"
											src="resources${event.EVENT_ORIGINAL}" alt="">
									</div>
									<div>
										<p class="quote">
											<strong>"</strong>${event.EVENT_CONTENT}<strong>"</strong>
										</p>
										<span class="number">${event.EVENT_DATE}</span><br> <span
											class="quote"><strong>${event.EVENT_TITLE}</strong></span>
									</div>
								</div>
							</li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
		</div>
	</section>
	<!--/#nino-testimonial-->


	<!-- category
    ================================================== -->
	<section id="nino-portfolio">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">category</span> Browse events by
				category
			</h2>
			<p class="nino-sectionDesc">Attend local events to meet people,
				try something new, or do more of what you love</p>
		</div>
		<div class="sectionContent">
			<ul class="nino-portfolioItems">
				<c:forEach var="cat" items="${category}">
					<li class="item"><a class="nino-prettyPhoto"
						title="Let's see what events are in ${cat.CATEGORY_NAME}"
						href="category.sc?category=${cat.CATEGORY_NAME}"> <img
							src="resources/image/category_main/${cat.CATEGORY_NAME}.jpg" />
							<div class="overlay">
								<div class="content">
									<i class="mdi mdi-cube-outline nino-icon"></i>
									<h4 class="title">${cat.CATEGORY_NAME}</h4>
									<span class="desc"></span>
								</div>
							</div>
					</a></li>
				</c:forEach>
			</ul>
		</div>
	</section>
	<!--/#nino-portfolio-->



	<!-- Our Team
    ================================================== -->
	<section id="nino-ourTeam">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">M&Ms</span> Explore people
			</h2>
			<p class="nino-sectionDesc">
				See who could be your colleague!<br>
			</p>
			<div class="sectionContent">
				<div class="row nino-hoverEffect">
					<c:forEach var="user" items="${RandomUser}">
						<c:if
							test="${user.user_id != 'admin' && user.user_id != user_id1}">
							<div class="col-md-4 col-sm-4">
								<div class="item">
									<div class="overlay"
										onClick="minihome('${user.user_id}','0','0','mh_popup')"
										title="go to ${user.user_name}'s minihome">
										<div class="content">
											<a class="nino-icon"
												onclick="minihome('0','${user.user_num}','${user.user_name}','follow')"
												title="follow ${user.user_name}!"><i
												class="mdi mdi-bookmark-plus-outline"></i></a>
										</div>
										<img class="Rectangle"
											src="resources/upload${user.user_original}">
									</div>
								</div>
								<div class="info">
									<h4 class="name">${user.user_name}</h4>
									<span class="regency">(${user.user_id})</span><br>
								</div>
								<br>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<!--/#nino-ourTeam-->
	<jsp:include page="footer.jsp" />
</body>
</html>