<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="resources/css2/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/css2/animate.css">
<link rel="stylesheet" href="resources/css2/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css2/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/css2/magnific-popup.css">
<link rel="stylesheet" href="resources/css2/aos.css">
<link rel="stylesheet" href="resources/css2/ionicons.min.css">
<link rel="stylesheet" href="resources/css2/bootstrap-datepicker.css">
<link rel="stylesheet" href="resources/css2/jquery.timepicker.css">
<link rel="stylesheet" href="resources/css2/flaticon.css">
<link rel="stylesheet" href="resources/css2/icomoon.css">
<link rel="stylesheet" href="resources/css2/style.css">
<script src="resources/js2/jquery-3.2.1.min.js"></script>
<script src="resources/js/myhome.js"></script>

<script>
	$(document)
			.ready(
					function() {
						var getParameters = function(paramName) {
							// 리턴값을 위한 변수 선언
							var returnValue;

							// 현재 URL 가져오기
							var url = location.href;

							// get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
							var parameters = (url.slice(url.indexOf('?') + 1,
									url.length)).split('&');

							// 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return
							for (var i = 0; i < parameters.length; i++) {
								var varName = parameters[i].split('=')[0];
								if (varName.toUpperCase() == paramName
										.toUpperCase()) {
									returnValue = parameters[i].split('=')[1];
									return decodeURIComponent(returnValue);
								}
							}
						};

						if (getParameters('id') == "${user_id1}"){
							$("#navi").append(
									"<li><a href='mmessage.mh?id="
											+ "${user_id1}" + "&page=send'>메시지</a></li>");
							$("#navi").append(
									"<li><a href='mprofile.mh?id="
											+ "${user_id1}" + "'>프로필</a></li>");
						}
						if (location.pathname == "/me/mmain.mh") {
							$('li:nth-child(1)').addClass("colorlib-active");
							$('li:nth-child(1)').siblings().removeClass(
									"colorlib-active");
						} else if (location.pathname == "/me/mboard.mh") {
							$('li:nth-child(2)').addClass("colorlib-active");
							$('li:nth-child(2)').siblings().removeClass(
									"colorlib-active");
						} else if (location.pathname == "/me/mevent.mh") {
							$('li:nth-child(3)').addClass("colorlib-active");
							$('li:nth-child(3)').siblings().removeClass(
									"colorlib-active");
						} else if (location.pathname == "/me/mmessage.mh") {
							$('li:nth-child(4)').addClass("colorlib-active");
							$('li:nth-child(4)').siblings().removeClass(
									"colorlib-active");
						} else if (location.pathname == "/me/mprofile.mh") {
							$('li:nth-child(5)').addClass("colorlib-active");
							$('li:nth-child(5)').siblings().removeClass(
									"colorlib-active");
						}

						$
								.ajax({
									type : "post",
									url : "follower.mh",
									data : {
										"id" : $("#id").val()
									},
									dataType : "json",
									success : function(rdata) {
										output = '';
										$(rdata)
												.each(
														function() {
															output += "<option value='"+this.user_id+"'>"
																	+ this.user_name
																	+ "</option>"
														})
										$("#follows").append(output);
									}
								})

					});
</script>
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		int user_num = (int) session.getAttribute("user_num1");
		
		Connection dbconn;
		Connection dbconn2;
		Statement stmt;
		Statement stmt2;
		ResultSet rs;
		ResultSet rs2;
		String myhome_bgm;
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String sql = "select * from mm_user where user_id='" + id + "'";
		dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SCOTT", "TIGER");
		stmt = dbconn.createStatement();
		rs = stmt.executeQuery(sql);
		rs.next();
		user_num = rs.getInt("user_num");

		Class.forName("oracle.jdbc.driver.OracleDriver");
		String sql2 = "select * from mm_myhome where user_num='" + user_num + "'";
		dbconn2 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SCOTT", "TIGER");
		stmt2 = dbconn2.createStatement();
		rs2 = stmt2.executeQuery(sql2);

		rs2.next();
		myhome_bgm = rs2.getString("myhome_bgm"); 
	%>
	<input type="hidden" name="id" id="id" value="<%=id%>">
	<aside id="colorlib-aside" role="complementary"
		class="js-fullheight text-center">
		<h1 id="colorlib-logo">
			<a href="mmain.mh?id=<%=id%>">Meet Me<span>.</span></a>
		</h1>
		<nav id="colorlib-main-menu" role="navigation">
			<ul id="navi">
				<li><a href="mmain.mh?id=<%=id%>">홈</a></li>
				<li><a href="mboard.mh?id=<%=id%>">게시판</a></li>
				<li><a href="mevent.mh?id=<%=id%>&page=all">이벤트</a></li>
			</ul>
		</nav>
		<div class="colorlib-footer">
			<ul>
				<audio src="resources/bgm/<%=myhome_bgm%>" controls autoplay loop
				 style="width:100%">
				</audio>
			</ul>
			<ul>
				<select name=follows id=follows onchange="mh_popup(this.value)">
					<option value="" selected>이웃목록</option>
				</select>
			</ul>
		</div>
	</aside>
	<!-- END COLORLIB-ASIDE -->


</body>
</html>