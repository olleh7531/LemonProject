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
	
	<!-- Member CSS -->
	<link rel="stylesheet" type="text/css" href="./assets/css/member/common.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/member/deleteMember.css">
	<link rel="shortcut icon" href="./assets/img/common/favicon.png">
	
	<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript"
	   src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
	<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>

	<style>
	#terms {
  	width: 100%;
	height: 371px;
    background-image: url("./assets/img/member/terms.JPG");
    margin-top: 20px;
    margin-bottom: 10px;
    }
    </style>
    
</head>
<body>
<%
	String email_id = (String)session.getAttribute("email_id");
%>
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	
	<!-- 본문 -->
	<div id="bg_contsMem">
		<div id="wrap_contsMem">
			<div id="wrap_tit">
				<h2>회원탈퇴</h2>
			</div>
			
			<div id="contsMem">
				<p class="txt_info_mem"><strong>회원탈퇴 전 안내사항을 꼭 확인해주세요.</strong><br/>
					<strong>탈퇴 후 회원님의 레몬 이용정보가 삭제되어 복구 불가능하오니 신중히 선택하시기 바랍니다.</strong>
				</p>
				<div class="mt14">
					<p>
					<strong style="font-size: 13px; color: #df2607;">
						탈퇴 후에는 개인의 데이터를 복구할 수 없으며, 서비스에 남아있는 게시물을 삭제 할 수 없습니다.
					</strong>
					</p>
				</div>
				<div id="terms"></div>
				<form action="./MemberDeleteAction.mb" method="post">
					<div class="mt14">
						<input type="checkbox" id="isOutAgree" />
						<label style="font-size: 12px; color: #666;">안내사항을 모두 확인하였으며, 이에 동의합니다.</label>
					</div>
					
					<div id="chkUserForm">
						<dl>
							<dt>레몬 ID</dt>
							<dd><%=email_id %></dd>
							<dt>비밀번호</dt>
							<dd><input type="text" name="pass" /></dd>
						</dl>
					</div>
					
					<div id="wrap_buttons">
						<input type="submit" onclick="return memberOut();" class="btnConfirm" value="회원 탈퇴" />
						<input type="button" onclick="history.back();" class="btnCancle" value="취소" />
					</div>				
				</form>
			</div>
			
		</div>
	</div>
	<!-- 본문 -->			

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script type="text/javascript" src="./assets/js/member/deleteMember.js"></script>
	
	</body>
</html>