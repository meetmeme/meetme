<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 
	<title>Mogo | OnePage Responsive Theme</title>
	
	<!-- favicon -->
    <link rel="shortcut icon" href="resources/images/ico/favicon.jpg">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="resources/images/ico/apple-touch-icon-57-precomposed.png">
	
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/materialdesignicons.min.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/jquery.mCustomScrollbar.min.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/prettyPhoto.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/unslider.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/template.css" />
	
	<!-- javascript -->
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>	
	<script type="text/javascript" src="resources/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.prettyPhoto.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.hoverdir.js"></script>
	<script type="text/javascript" src="resources/js/modernizr.custom.97074.js"></script>
	<script type="text/javascript" src="resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="resources/js/unslider-min.js"></script>
	<script type="text/javascript" src="resources/js/template.js"></script>
	
</head>


	<!-- Header
    ================================================== -->
	<header id="nino-header">
		<div id="nino-headerInner">					
			<nav id="nino-navbar" class="navbar navbar-default" role="navigation">
				<div class="container">

					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nino-navbar-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="main.net">Meet Me</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="nino-menuItem pull-right">
						<div class="collapse navbar-collapse pull-left" id="nino-navbar-collapse">
							<ul class="nav navbar-nav">
								<c:if test="${empty user_id}">
									<li><a href="login.net">login</a></li>
									<li><a href="join.net">join</a></li>
								</c:if>
								<c:if test="${user_id=='admin'}">
									<li><a href="#">admin</a></li>
								</c:if>
								<c:if test="${!empty user_id}">
									<li><a href="#">myhome</a></li>
									<li><a href="logout.net">logout</a></li>
								</c:if>
							</ul>
						</div><!-- /.navbar-collapse -->
						<ul class="nino-iconsGroup nav navbar-nav">
							<li><a href="#" class="nino-search"><i class="mdi mdi-magnify nino-icon"></i></a></li>
						</ul>
					</div>
				</div><!-- /.container-fluid -->
			</nav>

			<section id="nino-slider" class="carousel slide container" data-ride="carousel">
				
				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<h2 class="nino-sectionHeading">
							<span class="nino-subHeading">The real world is calling</span>
						</h2>
					</div>
					
				</div>

				
			</section>
		</div>
	</header><!--/#header-->

		
</html>