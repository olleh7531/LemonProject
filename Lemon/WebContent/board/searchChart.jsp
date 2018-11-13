<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/common.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/menu.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/main_menu_bxslider.css">
<!-- 메인 / 메뉴 슬라이더 -->
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/font.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/font/nanumgothic.css">
<link rel="stylesheet" type="text/css" href="./assets/css/main/main.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/footer.css">
<link rel="stylesheet" href="./assets/css/board/billboard.css">
<link rel="stylesheet" href="./assets/css/board/insight.css">


<script src="https://d3js.org/d3.v5.min.js"></script>
<script src="./assets/js/chart/billboard.js"></script>
<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
</head>
<body>
<h1>서치차트</h1>
<div id="chart"></div>
<div id="PieChart"></div>
<div id="lineChart"></div>
<script type="text/javascript">

bb.generate({
	"data" : {
		"columns" : [
				[ "남성", 36 ],
				
				[ "여성", 64 ],
				],	"type": "bar",
				labels: {
				      position: {
				          x: 0,
				          y: -5
				        },
				      },
	},"size": {
        "width": 176,
        "height" : 120
    },"axis": {
        "x": {
            "show": false
        },
        "y": {
            "show": false
        }
    },    point: {
        pattern: [
            "circle",
            "rectangle",
          ]
        },
    "legend": {
    	usePoint: true,
        "position": "right"
    },bar: {
        padding: 20
    },"tooltip": {
        "show": false
    },
    bindto: "#chart"
	
});

var chart = bb.generate({
	  data: {
	    columns: [
		["10대", 300],
		["20대", 130],
		["30대", 20],
		["40대", 20],
		["50대", 20],
	    ],
	    type: "pie",
	  }, pie: {
		  padding: 1.5,
		  "label": {
	            "show": false
	        },
	    },"size": {
	        "width": 176,
	        "height" : 150
	    },  color: {
	          tiles: function() {
	      	var pattern = d3.select(document.createElementNS(d3.namespaces.svg, "pattern"))
	      		.attr("patternUnits", "userSpaceOnUse")
	      		.attr("width", "6")
	      		.attr("height", "6");

	      	var g = pattern
	      		.append("g")
	      		.attr("fill-rule", "evenodd")
	      		.attr("stroke-width", 1)
	      		.append("g")
	      		.attr("fill", "rgb(255, 127, 14)");

	      	g.append("polygon").attr("points", "5 0 6 0 0 6 0 5");
	      	g.append("polygon").attr("points", "6 5 6 6 5 6");

	      	// Should return an array of SVGPatternElement
	      	return [
	      		pattern.node()
	      	];
	         }
	        },
	  bindto: "#PieChart"
	});


var chart = bb.generate({
	  data: {
	    columns: [
		["검색어", 30, 200, 100, 400, 150, 250, 30, 200, 100, 400, 150, 250]
	    ],
	  },
	  axis: {
	    x: {
	      tick: {
	        count: 2,
	        "outer": false,
	        centered : true,
	      },"type": "category",
	          
	    },"y": {
            "show": false
        }
	  }, "size": {
		        "width": 176,
		        "height" : 150
		    },  grid: {
		        x: {
		            show: true
		          },
		          y: {
		            show: true
		          }
		        },"legend": {
		            "show": false,
		        },"point": {
		            "show": false
		        },
	  bindto: "#lineChart"
	});


</script>

</body>
</html>