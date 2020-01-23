<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp" />

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAeltxv7nKepg24QdvqCG60cnwT9H5U5pY&libraries=places" async defer></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.6.1/pikaday.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.6.1/css/pikaday.css">

<link rel="stylesheet" href="resources/css/jquery.timepicker.css">
<script src="resources/js/event/jquery.timepicker.min.js"></script>

<script src="resources/js/event/newEvent.js"></script>
<link rel="stylesheet" href="resources/css/newEvent.css?after">




<body data-target="#nino-navbar" data-spy="scroll">
	
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
				<h2 class="nino-sectionHeading">title</h2>
       			<div class="input-group input-group-lg">
					<input type="text" class="form-control" id="event_title" name="event_title" placeholder="Enter title" required>
				</div>
				
				<h2 class="nino-sectionHeading">detail</h2>
       			<div class="input-group input-group-lg">
					<textarea rows="20" class="form-control" cols="120" id="event_detail" name="event_detail" placeholder="Enter event detail" required></textarea>
				</div>
				
				<h2 class="nino-sectionHeading">when</h2>
       			<div class="input-group input-group-lg">
					<input id="event_date" name="event_date" class="form-control" type="date" required>
					<input class="form-control" type="text" name="event_time" value="" placeholder="time"  id="event_time" required>
				</div>
				
				<h2 class="nino-sectionHeading">where</h2>
       			<div class="input-group input-group-lg">
					<input type="text" class="form-control" name="event_location" id="event_location" placeholder="Enter place" required>
				</div>
				<input class="field" id="lat" /> <input class="field" id="lng" />

				
				<h2 class="nino-sectionHeading">how many people</h2>
       			<div class="input-group input-group-lg">
					<input type="number" class="form-control" name="event_people" id="event_people" required>
				</div>
				
				<h2 class="nino-sectionHeading">cost(￦)</h2>
       			<div class="input-group input-group-lg">
					<input type="number" class="form-control" name="event_cost" id="event_cost" value="0">
				</div>
				
				<h2 class="nino-sectionHeading">Related photos</h2>
       			<div class="input-group input-group-lg">
					<input type="text" class="form-control" name="event_title" placeholder="Enter title" required>
				</div>
				
				<h2 class="nino-sectionHeading">hash tags</h2>
       			<div class="input-group input-group-lg">
					<input type="text" class="form-control" name="event_title" placeholder="Enter title" required>
				</div>
				
       			<div class="input-group input-group-lg">
					<input type="hidden" class="form-control" name="event_title" placeholder="Enter title" required>
					<!-- user_num 넘기기 -->
				</div>
				<br>
				<div class="input-group input-group-lg">
					<button type="submit" class="submit">create</button>
				</div>				
       		</form>
       		
       		<br>
       		<br>
		</div>
	</section>	<!--/#nino-portfolio-->
	
	<jsp:include page="../main/footer.jsp" />
</body>
</html>