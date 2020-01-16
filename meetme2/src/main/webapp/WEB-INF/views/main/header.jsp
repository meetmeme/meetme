<%@ page language="java" contentType="text/html; charset=utf-8"
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
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet" type="text/css" href="resources/css/join.css" />
<link rel="stylesheet" type="text/css" href="resources/css/modal.css" />

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

<script src="resources/js/join.js"></script>
<script src="resources/js/remember.js"></script>


</head>


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
								<li><a href="#" data-target="#layerpop" data-toggle="modal">login</a><br />
								</li>
								<li><a href="#" data-target="#layerpop2"
									data-toggle="modal">join</a></li>
							</c:if>
							<c:if test="${!empty user_id1}">
								<li><a href="#">Create New Group</a></li>
								<li><a id="userMenuBox"><img
										class="header_profilePic img-circle" alt=""
										src="resources/images/profile.png"></a> <!-- 사용자 팝업 메뉴 -->
									<div id=userPopupmenu>
										<ul>
											<c:if test="${user_id1=='admin'}">
												<li><a href="dash.ad">admin</a></li>
											</c:if>
											<c:if test="${!empty user_id1}">
												<li><a href="#" onClick="mh_popup('${user_id1}')">myhome</a></li>
												<li><a href="#" data-target="#darkModalForm"
													data-toggle="modal" id='noticeModal'>notification</a></li>
												<li><a href="#" data-target="#layerpop3"
													data-toggle="modal">message</a></li>
												<li><a href="logout.net">logout</a></li>
											</c:if>
										</ul>
									</div></li>
							</c:if>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
					<ul class="nino-iconsGroup nav navbar-nav">
						<li><a href="#" class="nino-search"><i
								class="mdi mdi-magnify nino-icon"></i></a></li>
					</ul>
				</div>
			</div>
			<!-- /.container-fluid -->
		</nav>

		<c:if test="${!empty HeaderComment}">
			<section id="nino-slider" class="carousel slide container"
				data-ride="carousel">

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<h2 class="nino-sectionHeading">
							<span class="nino-subHeading">${HeaderComment}</span>
						</h2>
					</div>
				</div>
			</section>
		</c:if>
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
			<!-- <form action="#" method="get"> -->
 			<form action="searchEvent.sc" method="post">
				<input type="text" autocomplete="off" placeholder="검색어" name="searchKeyword"
					id="searchEventKeyword" class="form-control nino-searchInput">
				<input type="text" placeholder="해시태그"
					class="form-control nino-searchInput searchHashtag" name="searchHashtag"> <select
					name="searchCategory" id="search-category" class="form-control">
					<option value="all">ALL</option>
					<c:forEach var="cat" items="${category}">
						<option value="${cat.CATEGORY_NUM}">${cat.CATEGORY_NAME}</option>
					</c:forEach>
				</select> <br> <br> 
				<input type="text" id="search-dateRange" class="form-control" value="2020/01/01 - 2020/01/10" />
				<input type=hidden name="search-dateStart" id="search-dateStart" value="2020-01-01">
				<input type=hidden name="search-dateEnd" id="search-dateEnd" value="2020-01-10">
				<br> <br> <input type=submit value="search"
					class="form-control btn_submit">
			</form>
		</div>
		<div id="search-minihome" class="search-Div">
			<form action="searchMinihome.sc" method="post">
				<input type="text" autocomplete="off" placeholder="검색어"
					id="searchMinihomeKeyword" class="form-control nino-searchInput">
				<input type="text" placeholder="해시태그"
					class="form-control nino-searchInput searchHashtag"> <input
					type="text" autocomplete="off" placeholder="닉네임" id="searchUser"
					class="form-control nino-searchInput"> <br> <br>
				<input type=submit value="search" class="form-control btn_submit">
			</form>
		</div>
		<i class="mdi mdi-close nino-close"></i>
	</div>
	<!--/#nino-searchForm-->
	<input type="hidden" value="${note}" id=note>
</header>
<!--/#header-->

<!-- 모달 -->
<jsp:include page="login_modal.jsp" />
<jsp:include page="join_modal.jsp" />
<jsp:include page="message_modal.jsp" />
<jsp:include page="notice_modal.jsp" />


<!-- 자동완성 script -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script>
	$(function() {
	$(window).on('load', function() {
		if($('#note').val())
			$('#darkModalForm').modal('show');
	});

		$('input[id="search-dateRange"]').daterangepicker(
				{
					locale : {
						format : "YYYY/MM/DD"
					},
					opens : 'left'
				},
				function(start, end, label) {
					console.log(start +" - "+end);
					$('#search-dateStart').val(start.format('YYYY-MM-DD'));
					$('#search-dateEnd').val(end.format('YYYY-MM-DD'));
					console.log("A new date selection was made: "
							+ start.format('YYYY-MM-DD') + ' to '
							+ end.format('YYYY-MM-DD'));
				});
		/* 검색 자동완성 */
		$('.searchHashtag').autocomplete({
			source : function(request, response) {
				$.ajax({
					type : 'get',
					url : 'getHashtag.wd',
					dataType : 'json',
					data : {
						'param' : $('.searchHashtag').val()
					},
					success : function(data) {
						response($.map(data, function(item) {
							return {
								label : item,
								value : item,
								test : item
							}
						}) //end map
						)
					} //end success
				}); //end ajax
			}, //end source
			select : function(event, ui) {
				/* console.log('2 : ' + ui);//사용자가 오토컴플릿이 만들어준 목록에서 선택을 하면 반환되는 객체
				console.log('3 : ' + ui.item.label); //김치 볶음밥label
				console.log('4 : ' + ui.item.value); //김치 볶음밥
				console.log('5 : ' + ui.item.test); //김치 볶음밥test */
			},//end select
			focus : function(event, ui) {
				return false; //한글 에러 방지
			},
			minLength : 1,
			autoFocus : true,
			classes : {
				"ui-autocomplete" : "highlight"
			},
			delay : 500,
			position : {
				my : "right top",
				at : "right bottom"
			},
			close : function(event) { //자동완성창 닫아질때 호출
				console.log(event);
			}
		});
	});

	//MESSAGE 친구 자동완성
	$('#receiver').autocomplete({
		source : function(request, response) {
			$.ajax({
				type : 'get',
				url : 'getFriends.cm',
				dataType : 'json',
				data : {
					'param' : $('#receiver').val()
				},
				success : function(data) {
					response($.map(data, function(item) {
						return {
							label : item.user_name + '<' + item.user_id + '>',
							value : item.user_id,
							test : item.user_num
						}
					}) //end map
					)
				} //end success
			}); //end ajax
		}, //end source
		select : function(event, ui) {
			$('#receiver_num').val(ui.item.test);
			/*  console.log('2 : ' + ui);//사용자가 오토컴플릿이 만들어준 목록에서 선택을 하면 반환되는 객체
			console.log('3 : ' + ui.item.label); //김치 볶음밥label
			console.log('4 : ' + ui.item.value); //김치 볶음밥
			console.log('5 : ' + ui.item.test); //김치 볶음밥test  */
		},//end select
		focus : function(event, ui) {
			return false; //한글 에러 방지
		},
		minLength : 1,
		autoFocus : true,
		classes : {
			"ui-autocomplete" : "highlight"
		},
		delay : 500,
		position : {
			my : "right top",
			at : "right bottom"
		},
		close : function(event) { //자동완성창 닫아질때 호출
			console.log(event);
		}
	});

	$('#userPopupmenu').hide();
	$('#userMenuBox').click(function() {
		$('#userPopupmenu').toggle();
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

	$(window).scroll(function() {
		if ($('#userPopupmenu').attr("style").indexOf('none') < 0) {
			$('#userPopupmenu').hide();
		}
	})
</script>