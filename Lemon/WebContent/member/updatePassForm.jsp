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
	<link rel="stylesheet" type="text/css" href="./assets/css/member/updateMemberPass.css">	
		
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
				<p>주기적인 비밀번호 변경은 개인정보를 안전하게 보호하고, 개인정보도용 피해를 예방합니다.</p>
			
				<form action="./MemberPassUpdateAction.mb" method="post" name="frPass">
					<div class="wrap_table">
					<table>
						<colgroup>
							<col style="width:188px">
							<col>
						</colgroup>
						<tr>
							<th>현재 비밀번호</th>
							<td><input type="text" name="crtPass"></td>
						</tr>
						<tr>
							<th>새 비밀번호</th>
							<td><input type="text" name="newPass"></td>
						</tr>
						<tr>
							<th>새 비밀번호 확인</th>
							<td><input type="text" name="chkPass"></td>
						</tr>
					</table>
					</div>
					<div id="wrap_buttons">
						<input type="submit" onclick="return check();" class="btnConfirm" value="로그인">
						<input type="button" onclick="history.back()" class="btnCancle" value="취소">
					</div>
				</form>
				
				<div id="noti_box">
					<ul>
						<li>개인정보(연락처/생일)와 관련된 숫자 등 다른 사람이 알아낼 수 있는 비밀번호는 사용하지 마세요.</li>
						<li>영문, 특수문자를 혼합하면 더욱 안전한 비밀번호를 만들 수 있습니다.</li>
					</ul>
				</div>
				
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