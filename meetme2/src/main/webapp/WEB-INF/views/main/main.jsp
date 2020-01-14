<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<body data-target="#nino-navbar" data-spy="scroll">
<jsp:include page="header.jsp" />

   <!-- 관심 분야 이벤트 (없을 시 최근 이벤트를 보여줌)
    ================================================== -->
    <section id="nino-latestBlog">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">events</span>
				Interesting Events
			</h2>
			<div class="sectionContent">
				<div class="row">
				<c:forEach var="i" begin="0" end="2">
					<div class="col-md-4 col-sm-4">
						<article>
							<div class="articleThumb">
								<a href="#"><img src="resources/images/our-blog/img-1.jpg" alt=""></a>
								<div class="date">
									<span class="number">12</span>
									<span class="text">Jan</span>
								</div>
							</div>
							<h3 class="articleTitle"><a href="">event name</a></h3>
							<p class="articleDesc">
								흥미 분야 이벤트를 임박한 순서로 출력 흥미분야 없을 시 그냥 임박한 순서대로 출력
							</p>
							<div class="articleMeta">
								<a href="#"><i class="mdi mdi-eye nino-icon"></i> 1264</a>
								<a href="#"><i class="mdi mdi-comment-multiple-outline nino-icon"></i> 69</a>
							</div>
						</article>
					</div>
				</c:forEach>
				</div>
			</div>
    	</div>
    </section><!--/#nino-latestBlog-->
    
	<!-- category
    ================================================== -->
	<section id="nino-portfolio">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">category</span>
				Browse events by category
			</h2>
			<p class="nino-sectionDesc">
				Attend local events to meet people, try something new, or do more of what you love
			</p>
		</div>
		<div class="sectionContent">
			<ul class="nino-portfolioItems">
				<c:forEach var="cat" items="${category}">
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="resources/image/category_main/${cat.CATEGORY_NAME}.jpg">
						<img src="resources/image/category_main/${cat.CATEGORY_NAME}.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-cube-outline nino-icon"></i>
								<h4 class="title">${cat.CATEGORY_NAME}</h4>
								<span class="desc">무슨 내용을 넣을까요?</span>
							</div>
						</div>
					</a>
				</li>
				</c:forEach>
			</ul>
		</div>
	</section><!--/#nino-portfolio-->


    

 
<!-- minihome
    ================================================== -->
    <section id="nino-happyClient">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">M&Ms</span>
				Explore people
			</h2>
			<div class="sectionContent">
				<div class="row">
					<div class="col-md-6">
						<div layout="row" class="item">
							<div class="nino-avatar fsr">
								<img class="img-circle" src="resources/images/happy-client/img-1.jpg" alt="">
							</div>
							<div class="info">
								<h4 class="name">김현윤</h4>
								<span class="regency">Graphic Design</span>
								<p class="desc">
									Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo illo cupiditate temporibus sapiente, sint, voluptatibus tempora esse. Consectetur voluptate nihil quo nulla voluptatem dolorem harum nostrum
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div layout="row" class="item">
							<div class="nino-avatar fsr">
								<img class="img-circle" src="resources/images/happy-client/img-2.jpg" alt="">
							</div>
							<div class="info">
								<h4 class="name">이소희</h4>
								<span class="regency">Graphic Design</span>
								<p class="desc">
									Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo illo cupiditate temporibus sapiente, sint, voluptatibus tempora esse. Consectetur voluptate nihil quo nulla voluptatem dolorem harum nostrum
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div layout="row" class="item">
							<div class="nino-avatar fsr">
								<img class="img-circle" src="resources/images/happy-client/img-3.jpg" alt="">
							</div>
							<div class="info">
								<h4 class="name">주혜원</h4>
								<span class="regency">Graphic Design</span>
								<p class="desc">
									Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo illo cupiditate temporibus sapiente, sint, voluptatibus tempora esse. Consectetur voluptate nihil quo nulla voluptatem dolorem harum nostrum
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div layout="row" class="item">
							<div class="nino-avatar fsr">
								<img class="img-circle" src="resources/images/happy-client/img-4.jpg" alt="">
							</div>
							<div class="info">
								<h4 class="name">홍찬미</h4>
								<span class="regency">Graphic Design</span>
								<p class="desc">
									Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo illo cupiditate temporibus sapiente, sint, voluptatibus tempora esse. Consectetur voluptate nihil quo nulla voluptatem dolorem harum nostrum
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
    	</div>
    </section><!--/#nino-happyClient-->
   
	<jsp:include page="footer.jsp" />
</body>
</html>