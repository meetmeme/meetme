<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp" />

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
			<form action="setPassword.net" class="nino-sbscribeForm center"
				onsubmit="return checkPw()" method="post">
				<h2 class="nino-sectionHeading">새로운 비밀번호</h2>
				<div class="input-group input-group-lg center full-width">
					<input type="password" class="form-control full-width" name="user_pass"
						placeholder="Enter Password" id="setpassword">
				</div>
				<h2 class="nino-sectionHeading">비밀번호 확인</h2>
				<div class="input-group input-group-lg center full-width">
					<input type="password" class="form-control full-width"
						placeholder="Check Password" id="setpasswordch">
				</div>
				<input type="hidden" name=user_email value="${user_email}">
				<input type="hidden" name=user_num value="${user_num}">
				<br><br>
				<input type="submit" class="form-control full-width" value="비밀번호 변경">
			</form>

		</div>
	</section>
	<!--/#nino-portfolio-->

	<jsp:include page="../main/footer.jsp" />

</body>
</html>