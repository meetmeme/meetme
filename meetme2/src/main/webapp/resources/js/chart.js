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
	
		
		var board_count = document.getElementsByClassName('board_count');
		
		var arr2 = new Array();
		for(var i=0; i<12; i++){
			arr2[i] = board_count[i].value;
		}
		
		
		new Chart(document.getElementById("myBarChart"), {
		    type: 'bar',
		    data: {
		        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월','12월'],
		        datasets: [{
		            label: '마이홈피 총 게시글 수',
		            data: arr2,
		            borderColor: "rgba(255, 201, 14, 1)",
		            backgroundColor: "rgba(255, 201, 14, 0.5)",
		            fill: false,
		        }]
		    },
		    options: {
		        responsive: true,
		        title: {
		            display: true,
		            text: ''
		        },
		        hover: {
		            mode: 'nearest',
		            intersect: true
		        },
		        scales: {
		            xAxes: [{
		                display: true,
		                scaleLabel: {
		                    display: true,
		                    labelString: '2020년'
		                },
		                ticks: {
		                    autoSkip: false
		                }
		            }],
		            yAxes: [{
		                display: true,
		                ticks: {
		                    suggestedMin: 0,
		                },
		                scaleLabel: {
		                    display: true,
		                    labelString: '(개)'
		                }
		            }]
		        }
		    }
		});