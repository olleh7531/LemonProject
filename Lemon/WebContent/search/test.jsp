<%@page import="com.lemon.search.db.SearchBean"%>
<%@page import="java.util.List"%>
<%@page import="com.lemon.search.db.SearchDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레몬 Lemon</title>
	<link rel="stylesheet" type="text/css" href="./assets/css/common/common.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/common/menu.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/common/main_menu_bxslider.css"> <!-- 메인 / 메뉴 슬라이더 -->
	<link rel="stylesheet" type="text/css" href="./assets/css/common/font.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/font/nanumbarungothic.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/font/nanumgothic.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/common/footer.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/main/main.css">
	
	<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
	<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>	
	
	
	<style>
 	#bg_contsSc{ 
 		border: 1px solid red; 
 		text-align: center;
 		width: 100%; 
 	} 
	
 	#wrap_contsSc{ 
 	 border: 1px solid blue;    
 	 display: inline-block; 
  	 width: 1008px;  
 	} 
	
 	#contsSc { 
	 	display: inline-block;
 		border: 1px solid green; 
 		width: 80%; 
 		float: left;  		
 		
 	} 
	
 	#contsCh { 
	 	display: inline-block;
 		border: 1px solid gray; 
 		width: 18%;
 		float: right;
 	}
 	
 	.clear {
	 	display:none;
	 	clear: both;
 	}
	
	</style>
	



</head>
<body>
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	
	<!-- 본문 -->
	<div id="bg_contsSc">
		<div id="wrap_contsSc">
			<div id="contsSc">	
			<p>test1</p>		
			</div>
			
			<div id="contsCh">			
			<p>test2</p>		
			</div>
			
	 		<div class="clear"></div>		
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	</body>
</html>