<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html lang="en">
<body data-target="#nino-navbar" data-spy="scroll">
	<jsp:include page="../main/header.jsp" />
	<div class=bodyMin>
		<hr>
		<!-- search keyword
    ================================================== -->
		<section id=searchKeywordShow>
			<div class="container center">
				<div layout="row">
					<div class="item">
						<div class="text">Keyword</div>
						<c:if test="${empty searchKey.keyword}">
							<div class="number">-</div>
						</c:if>
						<c:if test="${!empty searchKey.keyword}">
							<div class="number">${searchKey.keyword}</div>
						</c:if>
					</div>
					<div class="item">
						<div class="text">Hashtag</div>
						<c:if test="${empty searchKey.searchHashtag}">
							<div class="number">-</div>
						</c:if>
						<c:if test="${!empty searchKey.searchHashtag}">
							<div class="number">${searchKey.searchHashtag}</div>
						</c:if>
					</div>
					<div class="item">
						<div class="text">Category</div>
						<div class="number">${searchKey.searchCategory}</div>
					</div>
					<div class="item">
						<div class="text">Date</div>
						<div class="number">${searchKey.search_dateStart}-
							${searchKey.search_dateEnd}</div>
					</div>
				</div>
			</div>
		</section>
		<!--/#search keyword-->
		<hr>
		<!-- event result -->
		<div class=bodySubMinMain>
			<!-- Latest Blog   ================================================== -->
			<section id="nino-latestBlog">
				<div class="container">
					<h2 class="nino-sectionHeading">
						<span class="nino-subHeading">Events</span>
					</h2>
					<div class="sectionContent">
						<div class="row">
							<c:if test="${!empty events}">
								<c:forEach var="event" items="${events}">
								<fmt:formatDate value="${now}" pattern="yyyyMMddhhmm" var="nowDate" />
								<fmt:formatDate value="${event.EVENT_DATE}" pattern="yyyyMMddHHmm" var="Date"/>
									<div class="col-md-4 col-sm-4">
										<article class="square_article">
											<div class="articleThumb square_search">
												<a href="event.main?event=${event.EVENT_NUM}">
												<img src="resources/upload/event${event.EVENT_ORIGINAL}" alt=""></a>
												<div class="date">
													<c:if test="${Date > nowDate}">
													<span class="number">${event.EVENT_DATE}</span> 
													</c:if>
													<c:if test="${Date <= nowDate}">
														<span class="number"><del class="gray"><i>${event.EVENT_DATE}</i></del></span> 
													</c:if>
												</div>
											</div>
											<h3 class="articleTitle">
												<a href="event.main?event=${event.EVENT_NUM}"><strong>${event.EVENT_TITLE}</strong></a>
											</h3>
											<p class="articleDesc">${event.EVENT_CONTENT}</p>
											<!-- <div class="articleMeta">
											<a href="#"><i class="mdi mdi-eye nino-icon"></i> 543</a> <a
												href="#"><i
												class="mdi mdi-comment-multiple-outline nino-icon"></i> 15</a>
										</div> -->
										</article>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${empty events}">
								<p class=center>검색 결과가 없습니다.</p>
							</c:if>
						</div>
					</div>
				</div>
			</section>
			<!--/#nino-latestBlog-->
		</div>

		<hr>



<%-- 		<!-- post result -->
		<div class=bodySubMin>
			<!-- What We Do  ================================================== -->
			<section id="nino-whatWeDo">
				<div class="container">
					<h2 class="nino-sectionHeading">
						<span class="nino-subHeading">Posts</span>
					</h2>
					<p class="nino-sectionDesc">Look who's talking about issue you
						searched</p>
					<div class="sectionContent">
						<div class="row">
							<c:if test="${empty posts}">
								<p class=center>검색 결과가 없습니다.</p>
							</c:if>
							<c:if test="${!empty posts}">
								<div class="col-md-6">
									<div class="panel-group" id="accordion" role="tablist"
										aria-multiselectable="true">
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="headingThree">
												<h4 class="panel-title">
													<a class="collapsed" role="button" data-toggle="collapse"
														data-parent="#accordion" href="#collapseThree"
														aria-expanded="false" aria-controls="collapseThree"> <i
														class="mdi mdi-chevron-up nino-icon arrow"></i> <i
														class="mdi mdi-laptop-mac nino-icon"></i> web design
													</a>
												</h4>
											</div>
											<div id="collapseThree" class="panel-collapse collapse"
												role="tabpanel" aria-labelledby="headingThree">
												<div class="panel-body">context.</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</section>
			<!--/#nino-whatWeDo-->
		</div> --%>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>