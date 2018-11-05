<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="./assets/css/common/common.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/common/menu.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/common/main_menu_bxslider.css"> <!-- 메인 / 메뉴 슬라이더 -->
	<link rel="stylesheet" type="text/css" href="./assets/css/common/font.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/font/nanumbarungothic.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/font/nanumgothic.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/main/main.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/common/footer.css">
  	<link rel="stylesheet" href="./assets/css/board/billboard.css">
	<link rel="stylesheet" href="./assets/css/board/insight.css">


   <script src="https://d3js.org/d3.v5.min.js"></script>
	<script src="./assets/js/chart/billboard.js"></script>
	<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
   <script type="text/javascript" src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
   <script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>

</head>
<body>
<!-- 헤더 -->
<jsp:include page="../common/menu.jsp"/>
<!-- 헤더 -->
<!-- 본문 -->
<div id="chart"></div>
   <script type="text/javascript">
   var chart = bb.generate({
	    bindto: "#chart",
	    data: {
	        type: "line",
	        columns: [
	            ["data1", 30, 200, 100, 170, 150, 250],
	            ["data2", 130, 100, 140, 35, 110, 50]
	        ]
	    },
	    "axis": {
	        "rotated": false,
	        "x": {
	        },
	        "y": {
	            "show": false
	        }
	    }
	});
/*    bb.generate({
	    "data": {
	        "columns": [
	            ["data1", 10, 100, 111, 350, 150,100,200,300,400,500,600,700,800,900,1000],
	            ["data2", 20, 200, 7, 400, 155,150,250,350,450,550,650,750,850,950,990],
	            ["data3", 30, 250, 5, 430, 152,10,20,30,40,50,60,70,80,90,55],
	        ],
	    },
	    "axis": {
	        "x": {
	            "show": true,
	             "type": "category",
	          "categories": ["21", "22","23", "00","01","07","08","09","10","11","12","13","14","15","16","17"],
	           "tick": {
	                "outer": false,
	            centered: true,
	            }
	        },
	        "y": {
	            "show": false
	        }
	    },  grid:{
	       x: {
	    show: false,
	         lines: [
	      {value: 0},{value:1},{value:2},{value:3},{value:4},{value:5},{value:6},{value:7},{value:8},{value:9},{value:10},{value:11},{value:12},{value:13},{value:14},{value:15},{value:16},
	    ]
	  },
	       front: true,
	    },
	}) */
   </script>
<!-- 본문 -->
<!-- 푸터 -->
<jsp:include page="../common/footer.jsp"/>
<!-- 푸터 -->
</body>
</html>