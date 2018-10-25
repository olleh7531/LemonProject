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
	
	<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript"
	   src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
	<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>

</head>
<body>

	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	
	<!-- 본문 -->
	<div id="bg_contsMem">
		<div id="wrap_contsMem">
			<div id="wrap_tit">
				<h2>비밀번호 변경</h2>
			</div>
			
			<div id="contsMem">
				<form action="./MemberPassUpdateAction.mb" method="post" name="frPass">
					현재 비밀번호 : <input type="text" name="crtPass"><br>
					새 비밀번호 : <input type="text" name="newPass"><br>
					새 비밀번호 확인 : <input type="text" name="chkPass"><br>
					<input type="submit" onclick="return check();" value="로그인">
					<input type="button" onclick="location.href='history.back()'" value="취소">
				</form>
			</div>
		</div>
	</div>
	<!-- 본문 -->			
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>


	<script>
	function check(){
		if(document.frPass.crtPass.value == ""){
			alert("현재 비밀번호를 입력하시오");
			document.frPass.crtPass.focus();
			
			return false;
		}		
		if(document.frPass.newPass.value == ""){
			alert("새 비밀번호를 입력하시오");
			document.frPass.newPass.focus();
			
			return false;
		}
		if(document.frPass.chkPass.value == ""){
			alert("새 비밀번호 확인을 입력하시오");
			document.frPass.chkPass.focus();
			
			return false;
		}		
		return true;
	}
	</script>
	
	</body>
</html>