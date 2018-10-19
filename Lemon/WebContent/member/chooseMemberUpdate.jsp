<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레몬 Lemon</title>
	<link rel="stylesheet" type="text/css" href="./assets/css/common/common.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/common/common_footer.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/common/common_main_menu_bxslider.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/common/common_font.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/font/nanumbarungothic.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/font/nanumgothic.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/menu/menu.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/menu/menu_common.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/menu/menu_search.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/menu/menu_search_realtime.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/menu/menu_banner.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/main/main_common.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/main/main_btn_page.css">
   
   <script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
   <script type="text/javascript" src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
   <script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>

	
	<style>
	div{
		display: block;
	}
	
	#out{ border: 1px solid red; 
		width: 100%;
		text-align: center;
	}
	
	#in{ border: 1px solid blue; 
		display: inline-block;
		width: 1008px;
		text-align: left;
	}
	
	#wrap_tit{
	}
	
	#wrap_tit h2{	
	    color: #1a1a1a;
	    font-weight: bold;
	    font-size: 24px;
	    line-height: 30px;
	    font-family: "맑은 고딕", sans-serif;
	    letter-spacing: -2px;
		margin-top: 30px;

	}
	
	#conts{ border: 1px solid gray;
		display: block;
		margin-top: 30px;
	}
	
	
	
	
	</style>
</head>
<body>

	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	
	<!-- 본문 -->
	<div id="out">
		<div id="in">
			<div id="wrap_tit">
				<h2>회원정보 변경</h2>
			</div>
			
			<div id="conts">
				<ul>
					<li><a href="#">회원정보 변경</a></li>
					<li><a href="./MemberPassUpdate.mb">패스워드 변경</a></li>
					<li><a href="./MemberDelete.mb">회원 탈퇴</a></li>
				</ul>
				
			</div>
			
		</div>
	</div>
	<!-- 본문 -->			
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	</body>
</html>