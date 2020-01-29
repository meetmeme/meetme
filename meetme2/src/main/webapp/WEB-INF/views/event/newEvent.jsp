<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp" />



<script src="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.6.1/pikaday.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.6.1/css/pikaday.css">

<link rel="stylesheet" href="resources/css/jquery.timepicker.css">
<script src="resources/js/event/jquery.timepicker.min.js"></script>

<script src="resources/js/event/newEvent.js"></script>
<link rel="stylesheet" href="resources/css/newEvent.css">

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBBCJ1vbVWbRvoI0UuQBbhS_MLsJNEksyE&libraries=places,geometry&callback=initMap" async defer ></script>


<body data-target="#nino-navbar" data-spy="scroll">
<%
String id = "";
try{
	Cookie[] cookies = request.getCookies();                 // 요청에서 쿠키를 가져온다.
	if(cookies!=null){                                                    // 쿠키가 Null이 아닐때,
		for(int i=0; i<cookies.length; i++){                        // 쿠키를 반복문으로 돌린다.
			if(cookies[i].getName().equals("userInputId")){            // 쿠키의 이름이 id 일때
			id=cookies[i].getValue();                        // 해당 쿠키의 값을 id 변수에 저장한다.
			}
		}	
	}
}catch(Exception e){}
%>	
	<!-- category
    ================================================== -->
	<section id="nino-portfolio">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">M&M</span> 
			</h2>
		</div>
		<div class="sectionContent">
			<form action="createEvent.event" method="POST" class="nino-subscribeForm" enctype="multipart/form-data">
				<input type="hidden" name="user_id" value="<%=id%>">
				
				<h2 class="nino-sectionHeading">title</h2>
       			<div class="input-group input-group-lg">
					<input type="text" class="form-control"  name="EVENT_TITLE" placeholder="Enter title" required>
				</div>
				
				<h2 class="nino-sectionHeading">category</h2>
       			<div class="input-group input-group-lg">
					<select class="form-control" id="category_num" name="CATEGORY_NUM" required>
						<c:forEach var="c" items="${category}">
							<option value="${c.CATEGORY_NUM}">${c.CATEGORY_NAME}</option>		
						</c:forEach>	
					</select>
				</div>
				
				<h2 class="nino-sectionHeading">detail</h2>
       			<div class="input-group input-group-lg">
					<textarea rows="20" class="form-control" cols="120"  id="event_content" name="event_detail" placeholder="Enter event detail" required></textarea>
				</div>
				
				<h2 class="nino-sectionHeading">when</h2>
       			<div class="input-group input-group-lg">
					<input id="event_date" name="EVENT_DATE" class="form-control" type="date" required>
					<input class="form-control" type="text" name="EVENT_TIME" value="" placeholder="time"  id="event_time" required>
				</div>
				
				<h2 class="nino-sectionHeading">where</h2>
       			<div class="input-group input-group-lg">
					<input type="text" class="form-control" name="EVENT_LOCATION" id="address" placeholder="Enter place ex)서울 중구 남대문로 120 대일빌딩 3층 D강의장" required>
					<button id="mapSearch" type="button" value="Geocode">search</button>
				</div>
				<br>
				<input type="hidden" class="field" name="EVENT_LAT" id="lat" /> <input type="hidden" class="field" name="EVENT_LNG"  id="lng" />

				
    			<div id="google-map">
    			</div>


				
				<h2 class="nino-sectionHeading">how many people</h2>
       			<div class="input-group input-group-lg">
					<input type="number" class="form-control" name="EVENT_MAX" id="event_max" required>
				</div>
				
				<h2 class="nino-sectionHeading">event_price(￦)</h2>
       			<div class="input-group input-group-lg">
					<input type="number" class="form-control" name="EVENT_PRICE" id="event_price" value="0">
				</div>
				
				<h2 class="nino-sectionHeading">Related photos</h2>
       			<div class="input-group input-group-lg">
					<input multiple="multiple" type="file" id="upload" name="upload">
					<span id="filevalue"></span>
				</div>
				
				<h2 class="nino-sectionHeading">hash tags</h2>
       			<div class="input-group input-group-lg">
					<input type="text" class="form-control" name="row_hashtag" placeholder="Enter hash tags ex)#meetme #meet #event" required>
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