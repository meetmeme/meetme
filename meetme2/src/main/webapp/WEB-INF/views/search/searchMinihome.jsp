<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<body data-target="#nino-navbar" data-spy="scroll">
	<jsp:include page="../main/header.jsp" />
	<div class=bodyMin>
		<!-- minihome result -->
		<div class=bodySubMinMain>
			<!-- Story About Us
    ================================================== -->
			<section id="nino-story">
				<div class="container">
					<h2 class="nino-sectionHeading">
						<span class="nino-subHeading">Minihome</span>
					</h2>
					<p class="nino-sectionDesc">Lorem ipsum dolor sit amet,
						consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
						labore et dolore magna aliqua. Ut enim ad minim veniam, quis
						nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat.</p>
					<div class="sectionContent">
						<div class="row nino-hoverEffect">
							<div class="col-md-4 col-sm-4">
								<div class="item">
									<a class="overlay" href="#"> <span class="content">
											<i class="mdi mdi-airplay nino-icon"></i> Digital
									</span> <img src="resources/images/story/img-3.jpg" alt="">
									</a>
								</div>
							</div>
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
					<p class="nino-sectionDesc">Lorem ipsum dolor sit amet,
						consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
						labore et dolore magna aliqua. Ut enim ad minim veniam, quis
						nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
						consequat.</p>
					<div class="sectionContent">
						<div class="row">
							<div class="col-md-6">
								<div class="panel-group" id="accordion" role="tablist"
									aria-multiselectable="true">
									<div class="panel panel-default">
										<div class="panel-heading" role="tab" id="headingThree">
											<h4 class="panel-title">
												<a class="collapsed" role="button" data-toggle="collapse"
													data-parent="#accordion" href="#collapseThree"
													aria-expanded="false" aria-controls="collapseThree"> <i
													class="mdi mdi-chevron-up nino-icon arrow"></i> <i
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
						<ul>
							<li>
								<div layout="row">
									<div class="nino-symbol fsr">
										<i class="mdi mdi-comment-multiple-outline nino-icon"></i>
									</div>
									<div>
										<p class="quote">"Lorem ipsum dolor sit amet, consectetur
											adipiscing elit, sed do eiusmod tempor incididunt ut labore
											et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
											exercitation."</p>
										<span class="name">Jon Doe</span>
									</div>
								</div>
							</li>
							<li>
								<div layout="row">
									<div class="nino-symbol fsr">
										<i class="mdi mdi-comment-multiple-outline nino-icon"></i>
									</div>
									<div>
										<p class="quote">"Lorem ipsum dolor sit amet, consectetur
											adipiscing elit, sed do eiusmod tempor incididunt ut labore
											et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
											exercitation."</p>
										<span class="name">Jon Doe</span>
									</div>
								</div>
							</li>
						</ul>
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