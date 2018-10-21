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
	
	<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript"
	   src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
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
				<h2>회원탈퇴</h2>
			</div>
			
			<div id="conts">
				<input type="checkbox" id="isOutAgree" />
				<button type="button" onclick="memberOut();">회원탈퇴</button><br/>
				<button type="button" onclick="location.href='./ChooseMemberUpdate.mb'">취소</button>
				<button type="button" onclick="testCK();">체크테스트</button><br/>
			</div>
			
		</div>
	</div>
	<!-- 본문 -->			

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script>
	function memberOut() {
		var isOutAgree = document.getElementById("isOutAgree");

		if(isOutAgree.checked == true){
			var chkMemDel = confirm('확인을 누르시면 탈퇴가 완료됩니다.');
			
			if(chkMemDel == true){	
				location.href='./MemberDeleteAction.mb';
			}
		}else{
			alert('안내사항을 확인하셨다면 동의해주세요.');
		}
	}
		
	</script>
	
	</body>
</html>