<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
    <head>
        <meta charset="utf-8">
        <title>Meet Me | ${event.EVENT_TITLE}</title>
    	<meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 
Flex Template 
http://www.templatemo.com/tm-406-flex
-->
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        <script src="http://maps.googleapis.com/maps/api/js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBwlNqAEil52XRPHmSVb4Luk18qQG9GqcM&sensor=false&language=ko"></script> 
        
        <link rel="stylesheet" href="resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/css/font-awesome.css"  type='text/css'>
        <link rel="stylesheet" href="resources/css/animate.css">
        <link rel="stylesheet" href="resources/css/templatemo_misc.css">
        <link rel="stylesheet" href="resources/css/templatemo_style.css">
        <link rel="stylesheet" href="resources/css/event.css">

		<script src="resources/js/event/map.js"></script>
        <script src="resources/js/event/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
        
    </head>
    <body>
    
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
                                <img src="resources/${event.EVENT_SAVE}" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>${event.EVENT_TITLE}</h2><br>
                                    <h4>${event.EVENT_DATE} ${event.EVENT_TIME}</h4>
                                    <p>#해시태그 #검색되게</p>                                    
                                </div>
                            </li>
                           
                           <%-- 
                           
                           <c:forEach var="pic" items="${pic}">       
                            <li>
                                <div class="overlay"></div>
                                <img src="resources/${pic.EVENT_PHOTO}" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>${event.EVENT_TITLE}</h2><br>
                                    <h4>${event.EVENT_DATE} ${event.EVENT_TIME}</h4>
                                    <p>#해시태그 #검색되게</p>                                    
                                </div>
                            </li>
                           </c:forEach> 
                            --%>
                           
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
		</div>
		<div class="row">
           <c:forEach var="user" items="${user}">               
               <div class="team-member col-md-3 col-sm-6">
                   <div class="member-thumb">
                    <img src="resources/${user.user_save}" alt="">
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
		                       		<span class="fa icon fa-clock" ></span>
		                       		<span class="wtext">${event.EVENT_TIME}</span>
		                       	</div>
		                       	<div id="where">
		                       		<span class="fa icon fa-map-marker" ></span>
		                       		<span class="wtext">${event.EVENT_LOCATION}</span>
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
   			<div id="footPrice" class="footcon">
   				 ${event.EVENT_PRICE}
   			</div>
   			<div id="footBtn" class="footcon">
				<button class="attend" type="submit">참석</button>
   			</div>
  	 		<a href="#" id="nino-scrollToTop">Go to Top</a>     
        </div>
        
        <script src="resources/js/event/vendor/jquery-1.11.0.min.js"></script>
        <script>window.jQuery || document.write('<script src="resources/js/event/vendor/jquery-1.11.0.min.js"><\/script>')</script>
        <script src="resources/js/event/bootstrap.js"></script>
        <script src="resources/js/event/plugins.js"></script>
        <script src="resources/js/event/main.js"></script>

        <!-- Google Map -->
        <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
        <script src="resources/js/event/vendor/jquery.gmap3.min.js"></script>
        
        <!-- Google Map Init-->
        <script type="text/javascript">
            jQuery(function($){
                $('#map_canvas').gmap3({
                    marker:{
                        address: '37.769725, -122.462154' 
                    },
                        map:{
                        options:{
                        zoom: 15,
                        scrollwheel: false,
                        streetViewControl : true
                        }
                    }
                });

                /* Simulate hover on iPad
                 * http://stackoverflow.com/questions/2851663/how-do-i-simulate-a-hover-with-a-touch-in-touch-enabled-browsers
                 --------------------------------------------------------------------------------------------------------------*/ 
                $('body').bind('touchstart', function() {});
            });
        </script>
        <!-- templatemo 406 flex -->
    </body>
</html>