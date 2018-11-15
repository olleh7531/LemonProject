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
	/* 레이아웃 */
	#bg_contsSc{ 
 		 border: 1px solid red;  
 		text-align: center;
 		width: 100%; 
 	} 
	
 	#wrap_con{ 
 	  border: 1px solid blue;     
 	 display: inline-block; 
  	 width: 1008px;  
 	} 
 	
 	 #wrap_contsSc{ 
 	 	display: inline-block;
 		 border: 1px solid green;  
 		width: 80%; 
 		float: left;  		
 	 
 	} 
 	#contsSc { 
  		border: 1px solid pink;  
 		text-align: left;
 	} 
 	
 	#contsCh { 
	 	display: inline-block;
 		border: 1px solid gray; 
 		width: 18%;
 		float: right;
 	}
	/* 레이아웃 */
	
	
	/* 메뉴 */ 	
 	#menuSc{
 		display: inline-block;
 		border-top: 2px solid #848484;
 		width: 100%;
 	}
 	
 	#menuSc div a{
 	 	display: inline-block;
 	 	float: left;
 	 	width: 20%;
 	 	background-color: #ebf0ed;
 	 	border-bottom: 1px solid #dbdbdb;
 	 	padding-top: 10px;
 	 	padding-bottom: 10px;
 	}
 	
 	#menuSc div a:hover{
 		font-weight: bold;
 		color: #333333;
 		background-color: #fff;
 	 	border-bottom: 1px solid #fff; 		
 	}
 	/* 메뉴 */ 	
	
	
	</style>
		

</head>
<body>
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	
	<%	
		String search = request.getParameter("search");
		String sort = request.getParameter("sort");
	
		System.out.println(search);
	%>
	
	<!-- 본문 -->
	<div id="bg_contsSc">
		<div id="wrap_con">			
			<div id="wrap_contsSc">	
			
			<c:set var="search" value="${requestScope.search}"/>
			<div style="text-align: left; padding-top: 29px; padding-bottom: 8px;"><strong>'${search}'</strong>에 대한 검색 결과입니다.</div>
			<!-- 메뉴 -->	
			<div id="menuSc">
				<div><a href="/Lemon/UniSearch.sc?search=<%=search%>&sort=<%=sort%>">통합검색</a></div>
				<div><a href="/Lemon/ArtistSearch.sc?search=<%=search%>&sort=<%=sort%>">아티스트</a></div>
				<div><a href="/Lemon/SongSearch.sc?search=<%=search%>&sort=<%=sort%>">곡</a></div>
				<div><a href="/Lemon/AlbumSearch.sc?search=<%=search%>&sort=<%=sort%>">앨범</a></div>
				<div><a href="/Lemon/LyricSearch.sc?search=<%=search%>&sort=<%=sort%>">가사</a></div>
				<div style="display:none; clear: both;"></div>
			</div>
			
				
			<!-- 검색 결과 -->
			<div id="contsSc">	
			
			</div>
			<!-- 검색 결과 -->
			</div>
			
			<!-- 차트 -->
			<div id="contsCh">			
				<jsp:include page="../board/searchChart.jsp"></jsp:include>	
			</div>
			<!-- 차트 -->
			
			
	 		<div style="display:none; clear: both;"></div>

	 				
		</div>
	</div>
	
	
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	</body>
</html>