<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
	</style>
</head>
<body>
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	
	<!-- 본문 -->
	<div id="bg_contsSc">
		<div id="wrap_contsSc">
			<div><p>에 대한 검색 결과입니다.</p></div>
			<div>
				<ul>
					<li><a href="#">곡</a></li>
					<li><a href="#">앨범</a></li>
					<li><a href="#">가사</a></li>
				</ul>
			</div>
			<div id="contsSc">
				<h3 class="title">
					가사
					<span class="cnt">(482)</span>
				</h3>
				
				
				
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	</body>
</html>