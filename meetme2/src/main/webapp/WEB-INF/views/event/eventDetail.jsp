<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
    <head>
        <meta charset="utf-8">
        <title>Meet Me | ${event.EVENT_TITLE}</title>
    	<meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/css/font-awesome.css"  type='text/css'>
        <link rel="stylesheet" href="resources/css/animate.css">
        <link rel="stylesheet" href="resources/css/templatemo_misc.css">
        <link rel="stylesheet" href="resources/css/templatemo_style.css">
        <link rel="stylesheet" href="resources/css/event.css">		
        <script src="resources/js/event/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
      
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBBCJ1vbVWbRvoI0UuQBbhS_MLsJNEksyE" async defer ></script> 
 		<script src="resources/js/event/vendor/jquery-1.11.0.min.js"></script>
        <script>window.jQuery || document.write('<script src="resources/js/event/vendor/jquery-1.11.0.min.js"><\/script>')</script>
        <script src="resources/js/event/bootstrap.js"></script>
        <script src="resources/js/event/plugins.js"></script>
        <script src="resources/js/event/main.js"></script>        
        <script src="resources/js/event/vendor/jquery.gmap3.min.js"></script>
     <!--  Google Map Init -->      
         <script type="text/javascript">
          jQuery(function($){
                $('#map_canvas').gmap3({
                    marker:{
                        address: '${event.EVENT_LAT}, ${event.EVENT_LNG}' 
                    },
                        map:{
                        options:{
                        zoom: 18,
                        scrollwheel: false,
                        streetViewControl : true
                        }
                    }
                });

                $('body').bind('touchstart', function() {});
            }); 
        </script>
       
 	</head>
    <body>
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
<input type="hidden" name="user_id" value="<%=id%>">  
<jsp:include page="../main/header.jsp" />
        <div class="site-main" id="sTop">
            <div class="site-header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="social-icons">
                                <li><a href="#" class="fa fa-facebook"></a></li>
                                <li><a href="#" class="fa fa-twitter"></a></li>
                                <li><a href="#" class="fa fa-dribbble"></a></li>
                                <li><a href="#" class="fa fa-linkedin"></a></li>
                            </ul>
                        </div> <!-- /.col-md-12 -->
                    </div> <!-- /.row -->
                </div> <!-- /.container -->
            </div> <!-- /.site-header -->
            <div class="site-slider">
                <div class="slider">
                    <div class="flexslider">
                        <ul class="slides">     
                            <li>
                                <div class="overlay"></div>
                                <div class="sum"><img class="sumimg" src="resources/upload/event${event.EVENT_SAVE}" alt=""></div>
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>${event.EVENT_TITLE}</h2><br>
                                    <h4>${event.EVENT_DATE} ${event.EVENT_TIME}</h4>
                                    <p>
                                    	<c:forEach var="tag" items="${tag}">
                                    		<a class="tagSearch" href="hashtag.sc?hashtag=${tag.HASHTAG_TITLE}">#${tag.HASHTAG_TITLE} </a>                                	
                                    	</c:forEach>
                                    </p>                                    
                                </div>
                            </li>                           
                           <c:forEach var="gall" items="${gall}">       
                            <li>
                                <div class="overlay"></div>
                                <div class="sum"><img class="sumimg" src="resources//upload/event${gall.EVENT_GALLERY}" alt=""></div>
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>${event.EVENT_TITLE}</h2><br>
                                    <h4>${event.EVENT_DATE} ${event.EVENT_TIME}</h4>
                                    <p>
                                    	<c:forEach var="tag" items="${tag}">
                                    		<a class="tagSearch" href="hashtag.sc?hashtag=${tag.HASHTAG_TITLE}">#${tag.HASHTAG_TITLE} </a>                                	
                                    	</c:forEach>
                                    </p>                                   
                                </div>
                            </li>
                           </c:forEach> 
                           
                        </ul>
                    </div> <!-- /.flexslider -->
                </div> <!-- /.slider -->
            </div> <!-- /.site-slider -->
        </div> <!-- /.site-main -->


        <div class="content-section" id="services">
        	<div class="container">
				<h2 class="nino-sectionHeading">
					<span class="nino-subHeading">About</span> Details about Event
				</h2>
				<p class="nino-sectionDesc">Make sure it's the event you want.</p>
				 <div class="row">
                    <div class="heading-section col-md-12 text-center">
                        <p>${event.EVENT_CONTENT }</p>
                    </div> <!-- /.heading-section -->
                </div> <!-- /.row -->    
			</div>
        
        
		<div class="content-section" id="attendant">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Attendant</span> ${count} people will attended
			</h2>
			<p class="nino-sectionDesc">Check out who you're going to meet.</p>
		
			<div class="row">
           <c:forEach var="user" items="${user}">               
               <div class="team-member col-md-3 col-sm-6">
                   <div class="member-thumb">
                    <img src="resources/upload${user.user_save}" alt="">
                       <div class="team-overlay">
                           <h3>${user.user_name }</h3>
                           <ul class="social">
                           	<li><a href="#" onclick="mh_popup('${user.user_id}')" class="fa fa-user"></a></li>
                           </ul>
                       </div> <!-- /.team-overlay -->
                   </div> <!-- /.member-thumb -->
               </div> <!-- /.team-member -->
           </c:forEach>
         </div> <!-- /.row --> 
		</div>
		 
        </div> <!-- /#our-team -->
               

        <div class="content-section" id="location">
        	<div class="container">
				<h2 class="nino-sectionHeading">
					<span class="nino-subHeading">LOCATION</span> When & Where
				</h2>
				<p class="nino-sectionDesc">Be sure to keep track of time and place and have fun.</p>	
                <div class="row">
                    <div class="col-md-12">
                       <div class="googlemap-wrapper">
                            <div id="map_canvas" class="map-canvas"></div>
                     
	                       <div class="ww">
		                       	<div id="when">
		                       		<p class="fa icon fa-clock" ></p>
		                       		<p class="wtext">${event.EVENT_TIME}</p>
		                       	</div>
		                       	<div id="where">
		                       		<p class="fa icon fa-map-marker" ></p>
		                       		<p class="wtext">${event.EVENT_LOCATION}</p>
		                       	</div>
	                       </div>
                      </div> <!-- /.googlemap-wrapper -->
                    </div> <!-- /.col-md-12 -->
                </div> <!-- /.row -->               
            </div> <!-- /.container -->
        </div> <!-- /#contact -->
        
        
        
       
        <div class="content-section" id="comments">
        	<div class="container">
				<h2 class="nino-sectionHeading">
					<span class="nino-subHeading">Comments</span> Talk in the comments
				</h2>
				<p class="nino-sectionDesc">Share your information with people you're with in advance through comments</p>
				 <div class="row">
                    <div class="col-md-12">
                       <div class="googlemap-wrapper">
                            
                      </div> <!-- /.googlemap-wrapper -->
                    </div> <!-- /.col-md-12 -->
                </div> <!-- /.row -->  
			
			</div>
		</div>
        
        
      <div id="foot">        	
   			<div id="footText" class="footcon">
   			<input type="hidden" id="event_num" value="${event.EVENT_NUM}">
   				<span id="date">
   					${event.EVENT_DATE}
   				</span>
   				<span id="time">
   					${event.EVENT_TIME}
   				</span>
   				<br>
   				<span id="title">
   					${event.EVENT_TITLE}
   				</span>
   			</div>
   			<div id="footMax" class="footcon">
   				잔여석<br>
   				 ${remain}
   			</div>
   			<div id="footPrice" class="footcon">
   				가격(￦)<br>
   				<span id="price"> ${event.EVENT_PRICE}</span>
   			</div>
   			<div id="footBtn" class="footcon">
   			
   			<fmt:formatDate value="${now}" pattern="yyyyMMddhhmm" var="nowDate" />
			<fmt:formatDate value="${event.EVENT_DATE}" pattern="yyyyMMddHHmm" var="Date"/>
			
			<c:if test="${Date > nowDate}">		
				
			
   			<c:if test="${att==0}">
   				<c:if test="${remain>0}">
					<button id="attend" type="button">참석</button>
					
					<div id="eventModal" class="eventModal"> 
				      <div class="event-modal-content">
				        <span class="close" id="close">&times;</span>                                                               
				        <h2> 참석 하시겠어요? </h2><br>
				        <h4>${event.EVENT_TITLE}</h4>		   
		                <h4>${event.EVENT_DATE} ${event.EVENT_TIME}</h4>
		                
		                <c:if test="${event.EVENT_PRICE == 0 }">
		                	<h4>무료</h4><br>		                
		                	<button id="yes_free" type="submit" onclick="location.href='Attend.event?event=${event.EVENT_NUM}'">참석</button>
		                </c:if>
		                <c:if test="${event.EVENT_PRICE > 0}">
		                	<h4>${event.EVENT_PRICE}(원)</h4><br>		                
		                	<button id="yes_pay" type="submit" >결제</button>
		                	
		                	
		                </c:if>
				      </div>		 
				    </div>
				    
				    <div id="payModal" class="payModal">				    	
				      <div class="event-modal-content">
				        <span class="close" id="close">&times;</span>                                                               
				        <h2> 결제 </h2><br>
				        <h4>${event.EVENT_PRICE}</h4>		                   
		                <button id="cancel_event" type="submit" onclick="location.href='cancelAttend.event?event=${event.EVENT_NUM}'">취소</button>
		
				      </div>	
				    </div>
				    
				</c:if>
				<c:if test="${remain<1}">
					<button id="full" type="button">매진</button>
				</c:if>   			
   			</c:if>
   			<c:if test="${att>0}">
   				<button id="cancel" type="submit">참석취소</button>
   				<div id="eventModal" class="eventModal"> 
			      <div class="event-modal-content">
			        <span class="close" id="close">&times;</span>                                                               
			        <h2> 취소 하시겠어요? </h2><br>
			        <h4>${event.EVENT_TITLE}</h4>		   
	                <h4>${event.EVENT_DATE} ${event.EVENT_TIME}</h4><br>	                
	                <button id="cancel_event" type="submit" onclick="location.href='cancelAttend.event?event=${event.EVENT_NUM}'">취소</button>
	                
			      </div>		 
			    </div>   				
   			</c:if>
   			</c:if>
   			<c:if test="${Date <= nowDate}">
   				<button id="end" type="button">지난 이벤트</button>
   			</c:if>
   			
   			
   			 
   			
   			
			
   			</div>
  	 		<a href="#" id="nino-scrollToTop">Go to Top</a>     
        </div>
        
      
    </body>
</html>