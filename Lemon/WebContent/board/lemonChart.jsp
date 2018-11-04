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
   </script>
<!-- 본문 -->
<!-- 푸터 -->
<jsp:include page="../common/footer.jsp"/>
<!-- 푸터 -->
</body>
</html>