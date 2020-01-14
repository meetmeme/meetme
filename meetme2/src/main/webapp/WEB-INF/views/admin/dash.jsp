<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<jsp:include page="header.jsp" />
<style>
	
	.pie
	{
		padding-top : 20px;
		display : block;
		margin : 0;
		width : 50%;
	}
	#pie_title {
		padding-left : 10px;
	}
	
</style>
<body data-target="#nino-navbar" data-spy="scroll">
	
	<div id="nums">
		<c:forEach var="c" items="${categoryList}">
			<input type="hidden" value="${c.CATEGORY_NUM}" class="cat_num">
		</c:forEach>
	</div>
	
	<c:forEach var="c" items="${categoryList}">
		<input type="hidden" value="${c.CATEGORY_NAME}" class="cat_name">
	</c:forEach>
	
	<c:forEach var="ca" items="${categoryCount}">
		<input type="hidden" value="${ca}" class="inter_count">
	</c:forEach>
	
	
	<div class="pie">
		<h2 id="pie_title">회원 흥미분야 통계</h2>
		<canvas id="myChart"></canvas>
	</div>
	
	
	<script type="text/javascript">
	
		var ctx = document.getElementById('myChart').getContext('2d');
		
		var cat_num = document.getElementsByClassName('cat_num');
		var cat_name = document.getElementsByClassName('cat_name');
		var inter_count = document.getElementsByClassName('inter_count');
		
		var nums = document.getElementById("nums");
		var n = nums.childElementCount;
		
		var arr = new Array();
		for(var i=0; i<n; i++){
			arr[i] = inter_count[i].value;
		}
		
		var nameArr = new Array();
		for(var i=0;i<n;i++){
			
			nameArr[i] = cat_name[i].value;
			
		}
		
		// For a pie chart
		var myPieChart = new Chart(ctx, {
			type: 'pie',
			  data: {
			    labels: [nameArr[0],nameArr[1],nameArr[2],nameArr[3],nameArr[4],nameArr[5],nameArr[6],nameArr[7],nameArr[8],nameArr[9]],
			    datasets: [{
			      backgroundColor: [
			        "#2ecc71",
			        "#3498db",
			        "#95a5a6",
			        "#9b59b6",
			        "#f1c40f",
			        "#e74c3c",
			        "#34495e",
			        "#21610B",
			        "#F781BE",
			        "#DF7401"		        
			      ],
			      data: arr
			    }]
			  },
			  options: {
	              legend: {
	            	  maintainAspectRatio: false,
	                   display: true,
	                   position: 'left',
	                   labels: {
	                           fontSize: 12,
	                           fontFamily: 'sans-serif',
	                           fontColor: '#000000',
	                           fontStyle: 'bold'
	                               }
	                   }
	      		 }
		});
	
		
	</script>
</body>
</html>