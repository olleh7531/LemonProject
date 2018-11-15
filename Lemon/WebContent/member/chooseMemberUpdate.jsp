<%@page import="com.lemon.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레몬 Lemon</title>
	<link rel="stylesheet" type="text/css" href="./assets/css/common/common.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/common/menu.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/common/footer.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/common/main_menu_bxslider.css"><!-- 메인 / 메뉴 슬라이더 -->
	<link rel="stylesheet" type="text/css" href="./assets/css/common/font.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/font/nanumbarungothic.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/font/nanumgothic.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/starpost/common.css">
	<link rel="shortcut icon" href="./assets/img/common/favicon.png">
	<!-- Member CSS -->
	<link rel="stylesheet" type="text/css" href="./assets/css/member/common.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/board/notice.css">
	<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
	<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
	
	<style>
	.upMemMenu{
		border: 2px solid #d3d3d3;
		margin: 20px;
		width: 200px;
		text-align: center;
		float: left;
	}
	
	.upMemMenu a {
		display: block;
		padding: 30px;
		font-weight: bold;
	}
	
	.upMemMenu a:hover {
		background-color: #EDAE06;
	}
	
	.clear{
		clear: both;
	}
	</style>
</head>
<body>
	<%
	String email_id = (String) session.getAttribute("email_id");
	MemberDAO mdao = new MemberDAO();
	int check = mdao.chkCheck(email_id);
	System.out.println("check ::: " + check );	
	%>
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	
	<!-- 본문 -->
	<div id="wrap_conts" style="text-align: center">
		<div id="conts">
			<div id="wrap_tit">
				<h2>마이레몬</h2>
			</div>
			
			<div id="contsMem">
				<div>
					<div class="upMemMenu"><a href="./MemberUpdate.mb">회원정보 변경</a></div>
					<%if(check == 0) { %>
					<div class="upMemMenu"><a href="./MemberPassUpdate.mb">비밀번호 변경</a></div>
					<%} %>
					<div class="upMemMenu"><a href="./MemberFriend.mb">Lemon 친구</a></div>
					<div class="upMemMenu"><a href="./MemberDelete.mb">회원 탈퇴</a></div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- 본문 -->			
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	</body>
</html>