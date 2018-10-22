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
	/*공통*/
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
	
	#contsMem{ border: 1px solid gray;
		display: block;
		margin-top: 30px;
	}
	/*공통*/
	
	/*회원 탈퇴*/
	.mt14{ margin-top: 14px; }
}
	.txt_info_mem{
	    margin-top: 16px;
	    font-size: 14px;
   		line-height: 22px;
    	color: #333;
    	font-family: "맑은 고딕",sans-serif;
    	letter-spacing: -1px;
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
	<div id="out">
		<div id="in">
			<div id="wrap_tit">
				<h2>회원탈퇴</h2>
			</div>
			
			<div id="contsMem">
				<p class="txt_info_mem"><strong>회원탈퇴 전 안내사항을 꼭 확인해주세요.</strong><br/>
					<strong>탈퇴 후 회원님의 멜론 이용정보가 삭제되어 복구 불가능하오니 신중히 선택하시기 바랍니다.</strong>
				</p>
				<div class="mt14">
					<p>
					<strong style="font-size: 13px; color: #df2607;">
						탈퇴 후에는 개인의 데이터를 복구할 수 없으며, 서비스에 남아있는 게시물을 삭제 할 수 없습니다.
					</strong>
					</p>
				</div>
				<form action="./MemberDeleteAction.mb" method="post">
					<div class="mt14">
						<input type="checkbox" id="isOutAgree" />
						<label style="font-size: 12px; color: #666;">안내사항을 모두 확인하였으며, 이에 동의합니다.</label>
					</div>
					ID : <input type="text" name="email_id" value="<%=email_id %>" readonly/> <br/>
					PW : <input type="text" name="pass" /> <br/>
					
					<input type="submit" onclick="return memberOut();" value="회원 탈퇴" />
					<input type="button" onclick="history.back();" value="취소" />
				</form>
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
				return true;
			}
		}else{
			alert('안내사항을 확인하셨다면 동의해주세요.');
			return false;
		}
		
		return false;
	}
		
	</script>
	
	</body>
</html>