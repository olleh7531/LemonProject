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


	<style>
	#wrap_tablePass{
		border-top: 1px solid #B8B8B8;
		border-bottom: 1px solid #B8B8B8;
		
	    font-size: 14px;
   		line-height: 1.2em;
    	font-family: "돋움","Dotum","Apple Gothic",sans-serif;
    	letter-spacing: 0;

	}
	
	#wrap_tablePass table{
		width:100%;
    	border-collapse : collapse;
		
	}
	#wrap_tablePass th {
	    border-top: 1px solid #e6e6e6;
	    border-right: 1px solid #e6e6e6;
        background: #fafafa;
        color: #1a1a1a;
    	vertical-align: middle;
    	padding:15px;

	}
	#wrap_tablePass td {

		border-top: 1px solid #e6e6e6;
	}
	
	</style>
	
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
					<div id="wrap_tablePass">
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
						<input type="submit" onclick="return check();" value="로그인">
						<input type="button" onclick="location.href='history.back()'" value="취소">
					</div>
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