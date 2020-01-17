var ctx = document.getElementById('myChart').getContext('2d');

var cat_num = document.getElementsByClassName('cat_num');
var cat_name = document.getElementsByClassName('cat_name');
var inter_count = document.getElementsByClassName('inter_count');

var nums = document.getElementById("nums");
var n = nums.childElementCount;

var arr = new Array();
for (var i = 0; i < n; i++) {
	arr[i] = inter_count[i].value;
}

var nameArr = new Array();
for (var i = 0; i < n; i++) {
	nameArr[i] = cat_name[i].value;
}
console.log(nameArr);

// For a pie chart
var myPieChart = new Chart(ctx, {
	type : 'pie',
	data : {
		labels : nameArr,
		datasets : [ {
			backgroundColor : [ "#2ecc71", "#3498db", "#A9D0F5", "#9b59b6",
					"#f1c40f", "#e74c3c", "#34495e", "#21610B", "#F781BE",
					"#DF7401", "#F3F781", "#FF0040", "#D0A9F5" ],
			data : arr
		} ]
	},
	options : {
		legend : {
			maintainAspectRatio : false,
			display : true,
			position : 'left',
			labels : {
				fontSize : 12,
				fontFamily : 'sans-serif',
				fontColor : '#000000',
				fontStyle : 'bold'
			}
		}
	}
});

var board_count = document.getElementsByClassName('board_count');

var arr2 = new Array();
for (var i = 0; i < 12; i++) {
	arr2[i] = board_count[i].value;
}

new Chart(document.getElementById("myBarChart"), {
	type : 'bar',
	data : {
		labels : [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11',
				'12' ],
		datasets : [ {
			label : '마이홈피 총 게시글 수(월별)',
			data : arr2,
			borderColor : "rgba(255, 201, 14, 1)",
			backgroundColor : "rgba(255, 201, 14, 0.5)",
			fill : false,
		} ]
	},
	options : {
		responsive : true,
		title : {
			display : true,
			text : ''
		},
		hover : {
			mode : 'nearest',
			intersect : true
		},
		scales : {
			xAxes : [ {
				display : true,
				scaleLabel : {
					display : true,
					labelString : '2020년 (월)'
				},
				ticks : {
					autoSkip : false
				}
			} ],
			yAxes : [ {
				display : true,
				ticks : {
					suggestedMin : 0,
				},
				scaleLabel : {
					display : true,
					labelString : '(개)'
				}
			} ]
		}
	}
});

var day_count = document.getElementsByClassName('day_count');

var arr3 = new Array();
var day = new Array();
for (var i = 0; i < 31; i++) {
	arr3[i] = day_count[i].value;
	day[i] = i + 1;
}

new Chart(document.getElementById("myLineChart"), {
	type : 'line',
	data : {
		labels : day,
		datasets : [ {
			label : '마이홈피 총 게시글 수(일별)',
			data : arr3,
			borderColor : "#F5A9A9",
			backgroundColor : "#F8E0E0",
			fill : true,
			lineTension : 0
		} ]
	},
	options : {
		responsive : true,
		title : {
			display : true,
			text : ''
		},
		tooltips : {
			mode : 'index',
			intersect : false,
		},
		hover : {
			mode : 'nearest',
			intersect : true
		},
		scales : {
			xAxes : [ {
				display : true,
				scaleLabel : {
					display : true,
					labelString : '2020년 1월 (일)'
				},
				ticks : {
					autoSkip : false
				}
			} ],
			yAxes : [ {
				display : true,
				ticks : {
					suggestedMin : 0,
				},
				scaleLabel : {
					display : true,
					labelString : '(개)'
				}
			} ]
		}
	}
});



new Chart(document.getElementById("myHorizontalChart"), {
	type : 'horizontalBar',
	data : {
		labels : day,
		datasets : [ {
			label : '마이홈피 총 게시글 수(일별)',
			data : arr3,
			borderColor : "#F5A9A9",
			backgroundColor : "#F8E0E0",
			fill : true,
			lineTension : 0
		} ]
	},
	options : {
		responsive : true,
		title : {
			display : true,
			text : ''
		},
		tooltips : {
			mode : 'index',
			intersect : false,
		},
		hover : {
			mode : 'nearest',
			intersect : true
		},
		scales : {
			xAxes : [ {
				display : true,
				scaleLabel : {
					display : true,
					labelString : '2020년 1월 (일)'
				},
				ticks : {
					autoSkip : false
				}
			} ],
			yAxes : [ {
				display : true,
				ticks : {
					suggestedMin : 0,
				},
				scaleLabel : {
					display : true,
					labelString : '(개)'
				}
			} ]
		}
	}
});