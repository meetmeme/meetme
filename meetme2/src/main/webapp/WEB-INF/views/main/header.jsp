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
<title>Meet Me | Find your event And Record your memory</title>

<!-- favicon -->
<link rel="shortcut icon" href="resources/images/ico/favicon.jpg">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="resources/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="resources/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="resources/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="resources/images/ico/apple-touch-icon-57-precomposed.png">

<!-- css -->
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/materialdesignicons.min.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/jquery.mCustomScrollbar.min.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/prettyPhoto.css" />
<link rel="stylesheet" type="text/css" href="resources/css/unslider.css" />
<link rel="stylesheet" type="text/css" href="resources/css/template.css" />

<link rel="stylesheet" type="text/css"
	href="resources/css/join.css" />

<!-- javascript -->
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/isotope.pkgd.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.hoverdir.js"></script>
<script type="text/javascript"
	src="resources/js/modernizr.custom.97074.js"></script>
<script type="text/javascript"
	src="resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="resources/js/unslider-min.js"></script>
<script type="text/javascript" src="resources/js/template.js"></script>
<script src="resources/js/myhome.js"></script>

<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>

<script src="resources/js/join.js"></script>
<script src="resources/js/remember.js"></script>

<!-- Header
    ================================================== -->
<header id="nino-header">
	<div id="nino-headerInner">
		<nav id="nino-navbar" class="navbar navbar-default" role="navigation">
			<div class="container">

				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#nino-navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="main.index">Meet Me</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="nino-menuItem pull-right">
					<div class="collapse navbar-collapse pull-left"
						id="nino-navbar-collapse">
						<ul class="nav navbar-nav">
							<c:if test="${empty user_id1}">
								<li>
									<a href="#"  data-target="#layerpop" data-toggle="modal">login</a><br/>
								</li>
								<li>
									<a href="#"  data-target="#layerpop2" data-toggle="modal">join</a>
								</li>
							</c:if>
							<c:if test="${user_id1=='admin'}">
								<li><a href="#">admin</a></li>
							</c:if>
              				<c:if test="${!empty user_id1}">
									<li><a href="#" onClick="mh_popup('${user_id1}')">myhome</a></li>
								</c:if>
							<c:if test="${!empty user_id1}">
								<li><a href="#">Create New Group</a></li>
								<li><a href="logout.net">logout</a></li>
								<li><img class="header_profilePic img-circle" alt=""
									src="resources/images/our-blog/img-1.jpg" title="토글 넣을 예정">
								</li>
							</c:if>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
					<ul class="nino-iconsGroup nav navbar-nav">
						<li><a href="#" class="nino-search"><i class="mdi mdi-magnify nino-icon"></i></a></li>
					</ul>
				</div>
			</div>
			<!-- /.container-fluid -->
		</nav>

		<section id="nino-slider" class="carousel slide container"
			data-ride="carousel">

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
<!-- Search Form - Display when click magnify icon in menu
    ================================================== -->
<div id="nino-searchForm">
	<div class="search-Div">
		<input type="radio" id="searchType-event" name="searchType"
			value="event" checked="checked"> <label>Event | </label> <input
			type="radio" id="searchType-minihome" name="searchType"
			value="minihome"> <label>Mini Home</label>
	</div>
	<br> <br> <br>
	<div id="search-event" class="search-Div">
		<form action="">

			<input type="text" placeholder="검색어를 입력해주세요" id="searchEventKeyword"
				class="form-control nino-searchInput"> <select
				name="searchCategory" id="search-category" class="form-control">
				<option value="all">ALL</option>
				<c:forEach var="cat" items="${category}">
					<option value="${cat.CATEGORY_NUM}">${cat.CATEGORY_NAME}</option>
				</c:forEach>
			</select> <br> <br> <input type="text" id="search-dateRange"
				class="form-control" value="2020/01/01 - 2020/01/10" /> <input
				type=hidden name="search-dateStart" id="search-dateStart"> <input
				type=hidden name="search-dateEnd" id="search-dateEnd"> <br>
			<br> <input type=submit value="search"
				class="form-control btn_submit">
		</form>
	</div>
	<div id="search-minihome" class="search-Div">
		<form action="">
			<input type="text" placeholder="검색어" id="searchMinihomeKeyword"
				class="form-control nino-searchInput"> <input type="text"
				placeholder="해시태그" id="searchHashtag"
				class="form-control nino-searchInput" title="자동완성 넣을 예정"> <input
				type="text" placeholder="닉네임" id="searchUser"
				class="form-control nino-searchInput"> <br> <br> <input
				type=submit value="search" class="form-control btn_submit">
		</form>
	</div>
	<i class="mdi mdi-close nino-close"></i>
</div>
<!--/#nino-searchForm-->
</header>
<!--/#header-->
<!-- 로그인 모달 -->
	<div class="modal fade" id="layerpop" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- 닫기(x) 버튼 -->
	        <button type="button" class="close" data-dismiss="modal">×</button>
	        <!-- header title -->
	        <h4 class="modal-title">LOGIN</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body">
	            <form name="loginform" action="loginProcess.net" method="post">
					<div class="form-group">
						<b class="articleDesc">ID</b>
						<input class="form-control" type="text" name="user_id1" placeholder="Enter id" required
						value="${saveid}">
						<br>
					</div>
					<div class="form-group">
						<b class="articleDesc">PASSWORD</b>
						<input class="form-control" type="password" name="user_pass1" placeholder="Enter password" required>
					</div>
					<div>
						<input type="checkbox" name="u" class="articleDesc" id="idSaveCheck">Remember me
					</div>
					<br>
					<div class="clearfix form-group">
						<button type="submit" class="btn btn-primary submitbtn">로그인</button>
					</div>
				</form>
	      </div>
	      <!-- Footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
<!-- 회원가입 모달 -->
	<div class="modal fade" id="layerpop2" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- 닫기(x) 버튼 -->
	        <button type="button" class="close" data-dismiss="modal">×</button>
	        <!-- header title -->
	        <h4 class="modal-title">JOIN</h4>
	        <img src='resources/image/backicon.png' class="backbtn2">
	        <img src='resources/image/backicon.png' class="backbtn3">
	        <!-- <div>아이콘 제작자 <a href="https://www.flaticon.com/kr/authors/roundicons" title="Roundicons">Roundicons</a> from <a href="https://www.flaticon.com/kr/" title="Flaticon">www.flaticon.com</a></div>-->
	        
	      </div>
	      <!-- body -->
	      <div class="modal-body">
	            <form id="join" name="joinform" action="joinProcess.net" method="post">
					<div id="join1">
						<div class="form-group">
						<b>아이디</b>
				   		<input class="form-control" type="text" name="user_id"  placeholder="Enter Id"  maxLength=12 required>
				   		<span id="message"></span>
				   		</div>
				   		
				   		<div class="form-group">
				 		<b>비밀번호</b>
				   		<input class="form-control" type="password" name="user_pass" placeholder="Enter password" required>
				   		</div>
				   		
				   		<div class="form-group">
				   		<b>이름</b>
				   		<input class="form-control" type="text" name="user_name" placeholder="Enter name" maxlength=15 required>
				   		</div>
				   		
				   		<div class="form-group">
				   		<b>나이</b>
				   		<input class="form-control" type="text" name="user_age" maxlength=2 placeholder="Enter age" required>
				   		</div>
				   		
				   		<div class="form-group">
				   		<b>성별</b>
				   		<div>
				             <input type="radio" name="user_gender" value="남 " checked><span>남자</span>
				             <input type="radio" name="user_gender" value="여" ><span>여자</span>
				         </div>
				   		</div>
				   		
				   		<div class="form-group">
				   		<b>지역</b>
				   		<input class="form-control" type="text" name="user_city" placeholder="Enter city" maxlength=30>
				   		</div>
				   		
				   		<div class="form-group">
				   		<b>이메일 주소</b>
				         <input class="form-control" type="text" name="user_email" placeholder="Enter email" required><span id="email_message"></span>
				   		</div>
				   		
				   		<div class="clearfix form-group">
				         	<button type="button" class="btn btn-primary nextbtn1">다음</button>
				        </div>
			        </div>
			        
			        <!-- 이미지 설정 -->
			        <div id="join2">
						<div class="imgcontainer">
							<label>
								<input type="file" name="uploadfile" accept="image/gif, image/jpeg, image/png"
								style="display:none;">
								<img src="resources/image/default.png" alt="Avatar" class="avatar">
							</label>
						</div>
						<p>상단의 이미지를 클릭 해 회원님만의 특별한 이미지를 설정해주세요!</p>
						<div class="clearfix form-group">
				         	<button type="button" class="btn btn-primary nextbtn2">다음</button>
				        </div>
			        </div>
			        
			        <!-- 흥미분야 선택 -->
			        <div id="join3">
						<div>
							<div class="category">
								<c:forEach var="cat" items="${category}">
									<input type="checkbox" value="${cat.CATEGORY_NUM}" name="category" class="cat_num">${cat.CATEGORY_NAME}
								</c:forEach>
							</div>
						</div>
						<div class="clearfix form-group">
			         		<button type="submit" class="btn btn-primary submitbtn">회원가입</button>
			        	</div>		        
					</div>		          
			                        
				</form>
	      </div>
	      <!-- Footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>

<script>
	$(function() {
		$('input[id="search-dateRange"]').daterangepicker(
				{
					locale : {
						format : "YYYY/MM/DD"
					},
					opens : 'left'
				},
				function(start, end, label) {
					$('#search-dateStart').val(start.format('YYYY/MM/DD'));
					$('#search-dateEnd').val(end.format('YYYY/MM/DD'));
					console.log("A new date selection was made: "
							+ start.format('YYYY-MM-DD') + ' to '
							+ end.format('YYYY-MM-DD'));
				});
	});
	$('#search-minihome').hide();
	$('#searchType-minihome').click(function() {
		$('#search-minihome').show();
		$('#search-event').hide();
	});
	$('#searchType-event').click(function() {
		$('#search-event').show();
		$('#search-minihome').hide();
	});
	
	
</script>

