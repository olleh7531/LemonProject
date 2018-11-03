<%@page import="com.lemon.notice.db.NoticeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레몬 Lemon</title>
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/common.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/menu.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/main_menu_bxslider.css">
<!-- 메인 / 메뉴 슬라이더 -->
<link rel="stylesheet" type="text/css"
	href="./assets/css/board/notice.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/font.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/font/nanumgothic.css">
<link rel="stylesheet" type="text/css" href="./assets/css/main/main.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/footer.css">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>

</head>
<body>
	
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	
	<!-- 내용 -->
	<div id="wrap_conts" style="text-align: center">
		<div id="conts">
			닉네임 검색 : 
			<input type="text" id="findFriend" name="findFriend" value="">
			<input type="button" value="검색" onclick="">
			
			
		</div>
	</div>
	<!-- 내용 -->

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
