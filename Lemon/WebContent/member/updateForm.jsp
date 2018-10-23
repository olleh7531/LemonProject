<%@page import="com.lemon.member.db.MemberBean"%>
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
	
	#contsMem{ border: 1px solid gray;
		display: block;
		margin-top: 30px;
	}

	
	</style>
</head>
<body>
<%
	String email_id= (String)session.getAttribute("email_id");

	MemberBean mb = (MemberBean)request.getAttribute("mb");
	
	String gender = mb.getGender();
	if(gender == null){
		  gender = "남";
	}
%>


	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	
	<!-- 본문 -->
	<div id="out">
		<div id="in">
			<div id="wrap_tit">
				<h2>회원정보 변경</h2>
			</div>
			<div id="contsMem">
				<form action="./MemberUpdateAction.mb" method="post" >				
					<h3><b>내 정보</b></h3><br/>
					레몬 ID <input type="text" name="email_id" value="<%=mb.getEmail_id() %>"> <br/>
					수신 여부 <input type="checkbox"> <br/>
					비밀번호 <input type="text" name="pass"><br/>
					비밀번호 확인 <input type="text" name="chkPass"><br/>
					이름 <input type="text" name="name" value="<%=mb.getName()%>"> <br/>
					닉네임 변경 <input type="text" name="nickName" value="<%=mb.getNickname()%>"><br/>
					성별 <input type="radio" name="gender" value="남" 
					      <%if(gender.equals("남")){ %>
					          checked
					      <%} %>
					     >남
					      <input type="radio" name="gender" value="여"
					      <%if(gender.equals("여")){ %>
					          checked
					      <%} %>	      
					       >여  <br/>
					생일  <input type="text" name="birth"><br/>
					프로필 이미지  <input type="text" name="email_id"> <br/>
										
					<hr/>
					<h3><b>추가 정보</b></h3><br/>
					휴대폰  <input type="text" name="email_id">  <br/>
					우편 번호  <input type="text" name="email_id">  <br/>
					주소   <input type="text" name="email_id"> <br/>
					상세 주소  <input type="text" name="email_id">  <br/>
				
				</form>
			</div>
		</div>
	</div>
	<!-- 본문 -->			
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

	
	</body>
</html>