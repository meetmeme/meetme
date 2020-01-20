<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/js/main.js"></script>
<body data-target="#nino-navbar" data-spy="scroll">
	<jsp:include page="../main/header.jsp" />
	 <link rel="stylesheet" href="resources/css/event.css">

	<!-- category
    ================================================== -->
	<section id="nino-portfolio">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">M&M</span>
			</h2>
		</div>
		<div class="sectionContent">
			<form action="" class="nino-subscribeForm">
				<h2 class="nino-sectionHeading"><span class="nino-subHeading">title</span></h2>
       			<div class="input-group input-group-lg">
					<input type="text" class="form-control" name="event_title" placeholder="Enter title" required>
				</div>
				
				<h2 class="nino-sectionHeading"><span class="nino-subHeading">detail</span></h2>
       			<div class="input-group input-group-lg">
					<input type="text" class="form-control" name="event_title" placeholder="Enter title" required>
				</div>
				
				<h2 class="nino-sectionHeading">when</h2>
       			<div class="input-group input-group-lg">
					<input type="text" class="form-control" name="event_title" placeholder="Enter title" required>
				</div>
				
				<h2 class="nino-sectionHeading">where</h2>
       			<div class="input-group input-group-lg">
					<input type="text" class="form-control" name="event_title" placeholder="Enter title" required>
				</div>
				
				<h2 class="nino-sectionHeading">how many people</h2>
       			<div class="input-group input-group-lg">
					<input type="text" class="form-control" name="event_title" placeholder="Enter title" required>
				</div>
				
				<h2 class="nino-sectionHeading">cost</h2>
       			<div class="input-group input-group-lg">
					<input type="text" class="form-control" name="event_title" placeholder="Enter title" required>
				</div>
				
				<h2 class="nino-sectionHeading">Related photos</h2>
       			<div class="input-group input-group-lg">
					<input type="text" class="form-control" name="event_title" placeholder="Enter title" required>
				</div>
				
       			<div class="input-group input-group-lg">
					<input type="hidden" class="form-control" name="event_title" placeholder="Enter title" required>
					<!-- user_num 넘기기 -->
				</div>
				
				
       		</form>
       		
       		
       		
       		
			
		</div>
	</section>	<!--/#nino-portfolio-->
	
	
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
						rel="prettyPhoto[gallery1]" title="Development Mobile"
						href="resources/image/category_main/${cat.CATEGORY_NAME}.jpg">
							<img src="resources/image/category_main/${cat.CATEGORY_NAME}.jpg" />
							<div class="overlay">
								<div class="content">
									<i class="mdi mdi-cube-outline nino-icon"></i>
									<h4 class="title">${cat.CATEGORY_NAME}</h4>
									<span class="desc">무슨 내용을 넣을까요?</span>
								</div>
							</div>
					</a></li>
				</c:forEach>
			</ul>
		</div>
	</section>	<!--/#nino-portfolio-->
	
	
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
						rel="prettyPhoto[gallery1]" title="Development Mobile"
						href="resources/image/category_main/${cat.CATEGORY_NAME}.jpg">
							<img src="resources/image/category_main/${cat.CATEGORY_NAME}.jpg" />
							<div class="overlay">
								<div class="content">
									<i class="mdi mdi-cube-outline nino-icon"></i>
									<h4 class="title">${cat.CATEGORY_NAME}</h4>
									<span class="desc">무슨 내용을 넣을까요?</span>
								</div>
							</div>
					</a></li>
				</c:forEach>
			</ul>
		</div>
	</section>	<!--/#nino-portfolio-->



  <!-- Our Team
    ================================================== -->
	<section id="nino-ourTeam">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">M&Ms</span> Explore people
			</h2>
			<p class="nino-sectionDesc">
				See who will be your colleague!<br>				 
			</p>
			<div class="sectionContent">
				<div class="row nino-hoverEffect">
					<c:forEach var="user" items="${RandomUser}">
					<div class="col-md-4 col-sm-4">
						<div class="item">
							<div class="overlay" onClick="mh_popup('${user.user_id}')" title="go to ${user.user_id}'s minihome">
								<div class="content">
									<a href="#" class="nino-icon" title="follow ${user.user_id}!"><i class="mdi mdi-bookmark-plus-outline"></i></a>
								</div>
								<img src="resources/${user.user_save}">
							</div>
						</div>
						<div class="info">
							<h4 class="name">${user.user_id}</h4>
							<span class="regency">${user_user_name}</span>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section><!--/#nino-ourTeam-->


	<jsp:include page="../main/footer.jsp" />
</body>
</html>