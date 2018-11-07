<%@page import="com.lemon.member.db.MemberDAO"%>
<%@page import="com.lemon.notice.db.NoticeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레몬 Lemon</title>
<link rel="stylesheet" type="text/css" href="./assets/css/common/common.css">
<link rel="stylesheet" type="text/css" href="./assets/css/common/menu.css">
<link rel="stylesheet" type="text/css" href="./assets/css/common/main_menu_bxslider.css">
<!-- 메인 / 메뉴 슬라이더 -->
<link rel="stylesheet" type="text/css" href="./assets/css/board/notice.css">
<link rel="stylesheet" type="text/css" href="./assets/css/common/font.css">
<link rel="stylesheet" type="text/css" href="./assets/css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css" href="./assets/css/font/nanumgothic.css">
<link rel="stylesheet" type="text/css" href="./assets/css/main/main.css">
<link rel="stylesheet" type="text/css" href="./assets/css/common/footer.css">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
<script>
	function findFriend() {
		$.ajax({
        	url: "./findFriend.mb",
        	contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            type: 'POST',
            success:function(result) {
				$('.findResult').html(result);
            }, error:function() {
				alert("실패");
            }
        });
	}
	
	function friendSearch() {
		alert("?");	
		alert($("#f_nickname").val());
		var m_nickname = document.getElementById("m_nickname").value;
		console.log(m_nickname);
		var f_nickname = document.getElementById("f_nickname").value;
		console.log(f_nickname);
		
		$.ajax({
        	url: "./findFriend.mb",
        	data: {
            	f_nickname: f_nickname,
	            m_nickname : m_nickname},
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            type: 'POST',
            success:function(result) {
				$('.findResult').html(result);
            }, error:function() {
				alert("실패");
            }
        });
	}
	
	function addFriend() {
		var m_nickname = document.getElementById("m_nickname").value;
		var f_nickname = document.getElementById("f_nickname").value;
		
		$.ajax({
        	url: "./AddFriend.mb",
            data: {
            	f_nickname: f_nickname,
	            m_nickname : m_nickname},
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            type: 'POST',
            success:function(result) {
				alert("성공");				
            }, error:function() {}
        });
	}
	
	
	</script>
</head>
<body>
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	
	<!-- 내용 -->
	<div id="wrap_conts" style="text-align: center">
		<div id="conts">
		<%
			String email_id = (String) session.getAttribute("email_id");
			MemberDAO mdao = new MemberDAO();
			String nickName = mdao.getNick(email_id);
			String f_nickname = request.getParameter("f_nickname");
		%>
			<input type="hidden" id="m_nickname" value=<%=nickName %>>
			<input type="hidden" id="f_nickname" value=<%=f_nickname %>>
			
			<input type="button" value="친구검색" onclick="findFriend()">
			<input type="button" value="친구목록" onclick="friendsList()">
			<input type="button" value="대화하기" onclick="friendsChat()"> <br><br>
			
			<span class="findResult"></span>
			
		</div>
	</div>
	<!-- 내용 -->

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
