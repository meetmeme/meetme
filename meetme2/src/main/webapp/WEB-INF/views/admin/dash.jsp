<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<jsp:include page="header.jsp" />
<body data-target="#nino-navbar" data-spy="scroll">


<canvas id="myChart"></canvas>

<script type="text/javascript">

	var ctx = document.getElementById('myChart').getContext('2d');
	data = {
		    datasets: [{
		        data: [10, 20, 30]
		    }],

		    // These labels appear in the legend and in the tooltips when hovering different arcs
		    labels: [
		        'Red',
		        'Yellow',
		        'Blue'
		    ]
		};
	// For a pie chart
	var myPieChart = new Chart(ctx, {
	    type: 'pie',
	    data: data,
	    options: {}
	});
	
	
</script>
</body>
</html>