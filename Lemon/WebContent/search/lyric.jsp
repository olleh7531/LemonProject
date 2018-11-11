<%@page import="java.util.List"%>
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

	<!-- Search CSS -->
	<link rel="stylesheet" type="text/css" href="./assets/css/search/common.css">
	<style type="text/css">
	h3.title{
		margin-bottom: 12px;
	    color: #1a1a1a;
	    font-weight: bold;
 	    font-size: 18px; 
	    line-height: 24px;
	    font-family: "맑은 고딕", "Malgun Gothic", "Apple Gothic", sans-serif;
	}
	
	h3.title span.cnt{
		color: #666;
	}
	
	.wrap_cntt{
		border-top: 1px solid #ccc;
	} 
	.list_sort{float: right;
	}
	.list_sort li{float: left;
    margin-left: 4px;
    padding: 0 4px 0 9px;
    background: url(//cdnimg.melon.co.kr/resource/image/web/common/bg_gray_bar.png) no-repeat 0 3px;
	}
	</style>
</head>
<body>
<%
	List resultList = (List) request.getAttribute("resultList");
%>

	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	<!-- 본문 -->
	<div id="bg_contsSc">
		<div id="wrap_contsSc">
		
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	</body>
</html>