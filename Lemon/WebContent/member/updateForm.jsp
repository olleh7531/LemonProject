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
	<link rel="shortcut icon" href="./assets/img/common/favicon.png">
	
	<!-- Member CSS -->
	<link rel="stylesheet" type="text/css" href="./assets/css/member/common.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/member/updateMember.css">
	<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
	<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
	
	<script type="text/javascript">
	function checkNick() {
		if(document.fr.nickname.value == ""){
			alert("닉네임을 입력 해 주세요.");
			document.fr.nickname.focus();
			return;
		}
		var fnickname = document.fr.nickname.value;
		// 새창 열기
		window.open("./member/checkNick.jsp?fnickname="+fnickname,"","width=400,height=250");
	}
	</script>
</head>
<body>
<%

	String email_id= (String)session.getAttribute("email_id");
	MemberBean mb = (MemberBean)request.getAttribute("mb");
	
	String gender = mb.getGender();
	if(gender == null){
		  gender = "남";
	}
	
	int chkRe = mb.getReceive_email();
%>

	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	
	<!-- 본문 -->
	<div id="bg_contsMem">
		<div id="wrap_contsMem">
			<div id="wrap_tit">
				<h2>회원정보 변경</h2>
			</div>
			<div id="contsMem">
				<form action="./MemberUpdateAction.mb" method="post" enctype="multipart/form-data" name="fr">				
					<input type="hidden" name="preImg" value="<%=mb.getImg()%>">
					<input type="hidden" name="chk" value="<%=mb.getChk()%>">
					
					<h3><b>내 정보</b></h3><br/>
					<div class="wrap_table">
					<table>
						<colgroup>
							<col style="width:188px">
							<col>
						</colgroup>
						<tr>
							<td colspan="2" style="text-align: center;">
								<div>
									<%if(mb.getImg() == null){
										%>
										<img src="./assets/img/member/noimg.gif" style="margin-top:10px;" width="100" height="100">										
										<% }else{ %>
									<img src="./upload/member/img/<%=mb.getImg()%>" style="margin-top:10px;" width="100" height="100">
									<%} %>
									<p style="margin-top:10px; margin-bottom:10px;"><span style="font-size: 20px; font-weight: bold;"><%=mb.getNickname()%></span>님의 회원정보</p>
								</div>
							</td>
						</tr>
						<tr style="height: 70px">
							<th>레몬 ID</th>
							<td>
								<input type="text" name="email_id" value="<%=mb.getEmail_id() %>" readonly size="30"><br/>	
								<p><input type="checkbox" style="width:auto;" name="receive_email" <%if(chkRe == 1){ %>
					          			checked
					      			<% } %>><label>이메일 수신동의</label>
					      		</p>
							</td>
						</tr>
						<%if(mb.getChk() == 0) { %>
						<tr>
							<th>비밀번호</th>
							<td><input type="text" name="pass"></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="text" name="chkPass"></td>
						</tr>
						<%} %>
						
						<tr>
							<th>이름</th>
							<td><input type="text" name="name" value="<%=mb.getName()%>" readonly></td>
						</tr>
						
						<tr>
							<th>닉네임</th>
							<td><input type="text" name="nickname" value="<%=mb.getNickname()%>">
						<input type="button" class="upBtn" value="중복 확인" onclick="checkNick()"></td>
						</tr>
						
						<tr>
							<th>성별</th>
							<td><input type="radio" name="gender" value="남" 
							      <%if(gender.equals("남")){ %>
							          checked
							      <%} %>
							     >남
							      <input type="radio" name="gender" value="여"
							      <%if(gender.equals("여")){ %>
							          checked
							      <%} %>	      
							     >여
					       </td>
						</tr>
						
						<tr>
							<th>생일</th>
							<td><input type="text" name="birth" value="<%=mb.getBirth()%>" ></td>
						</tr>
						
						<tr>
							<th>프로필 이미지 변경</th>
							<td><input type="file" style="margin:10px 0 10px 20px" name="img" id="img" onchange="previewImage(this,'View_area')"><br/>
							<div id='View_area' style='position:relative; width: 100px; height: 100px; margin:0 0 10px 20px; color: black; border: 1px solid black; dispaly: inline; '></td>
						</tr>
					</table>
					</div>
					<br>
					
					<h3><b>추가 정보</b></h3><br>
					<div class="wrap_table">
					<table>
						<colgroup>
							<col style="width:188px">
							<col>
						</colgroup>
						<tr>
							<th>휴대폰</th>
							<td><input type="text" name="mobile" <%
								if(mb.getMobile() != null) {
									%>
									value="<%=mb.getMobile() %>";
									<%
								} else {
									%>
									value="";
									<%
								}
							%>
							></td>
						</tr>
						<tr>
							<th>우편 번호</th>
							<td><input type="text" name="zip_code" id="zip_code"<%
								if(mb.getMobile() != null) {
									%>
									value="<%=mb.getZip_code() %>";
									<%
								} else {
									%>
									value="";
									<%
								}
							%>">
						   <input type="button" onclick="searchAddress()" class="upBtn" class="dup" value="주소 검색"></td>
						</tr>
						<tr>
							<th>주소 </th>
							<td><input type="text" name="address1" id="address1" <%
								if(mb.getAddress1() != null) {
									%>
									value="<%=mb.getAddress1() %>";
									<%
								} else {
									%>
									value="";
									<%
								}
							%>></td>
						</tr>
						<tr>
							<th>상세 주소</th>
							<td><input type="text" name="address2" id="address2" <%
								if(mb.getAddress2() != null) {
									%>
									value="<%=mb.getAddress2() %>";
									<%
								} else {
									%>
									value="";
									<%
								}
							%>></td>
						</tr>
					</table>
					</div>					
					
					<div id="wrap_buttons">
						<input type="submit" class="btnConfirm" value="회원 수정"/>
						<input type="button" class="btnCancle" onclick="location.href='./main.mi'" value="취소"/>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 본문 -->
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<!-- 이미지 미리보기 JavaScript -->
	<script src="./assets/js/member/previewImage.js"></script>
	
	<!-- 주소 검색 API -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="./assets/js/member/searchAddress.js"></script>
	
	
	</body>
</html>