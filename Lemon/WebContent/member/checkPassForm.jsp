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
<%
	String email_id =(String) session.getAttribute("email_id");
	System.out.println(email_id);
%>

	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	
	<!-- 본문 -->
	<div id="out">
		<div id="in">
			<div id="wrap_tit">
				<h2>비밀번호 확인</h2>
			</div>
			
			<div id="conts">
				<form action="./MemberPassCheckAction.mb" method="post">
					아이디 : <input type="text" name="email_id" value="<%=email_id %>" readonly><br>
					비밀번호 : <input type="password" name="pass"><br>
					<input type="submit" value="로그인">
					<input type="button" value="취소">
				</form>
			</div>
			
		</div>
	</div>
	<!-- 본문 -->			
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	</body>
</html>