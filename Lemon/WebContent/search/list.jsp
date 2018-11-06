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
			<div id="contsSc">			
			
			<div class="section_artist">
				<h3 class="title">아티스트
					<span class="cnt">(482)</span>
				</h3>
				<div class="wrap_cntt">aaaaa</div>
				<div class="btn_link">
					<a href="#">
						<span></span>
						<span></span>
					</a>
				</div>
			</div>
<!-- 			<div class="section_song"> -->
<!-- 			</div> -->
<!-- 			<div class="section_album"> -->
<!-- 			</div> -->
<!-- 			<div class="section_vdo"> -->
<!-- 			</div> -->
<!-- 			<div class="section_lyric"> -->
<!-- 			</div> -->
<!-- 			<div class="section_dj"> -->
<!-- 			</div> -->
<!-- 			<div class="section_musicstory"> -->
<!-- 			</div> -->
<!-- 			<div class="section_customer"> -->
<!-- 			</div> -->
			
				
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	</body>
</html>