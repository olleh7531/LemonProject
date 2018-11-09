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
	
	// 닉네임 입력 후 찾기 버튼 눌렀을 때
	function friendSearch() {
		var m_nickname = document.getElementById("m_nickname").value;
		var f_nickname = document.getElementById("f_nickname").value;
		
		$.ajax({
        	url: "./FriendSearch.mb",
        	data: {
            	f_nickname: f_nickname,
	            m_nickname : m_nickname},
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            type: 'POST',
            success:function(result) {
				$('.findResult1').html(result);
            }, error:function() {}
        });
	}
	
	// 친구를 찾고 친구추가를 요청할 때
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
				alert(result); 	
            },
            error:function() {}
        });
	}
	
	// 친구 목록을 눌렀을 때
	function friendList() {
		var m_nickname = document.getElementById("m_nickname").value;
		var f_nickname = document.getElementById("f_nickname").value;
		
		$.ajax({
        	url: "./requestFriend.mb",
            data: {
            	f_nickname: f_nickname,
	            m_nickname : m_nickname},
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            type: 'POST',
            success:function(result) {
            	$('.findResult2').html(result);
            	
            	// 거절 버튼을 눌렀을 때
            	$('.refuse').click(function(){
            		refuse($(this).prev().prev().prev().val())
            	});
            	
            	// 수락 버튼을 눌렀을 때
            	$('.acception').click(function(){
            		acception($(this).prev().prev().val())
            	});
            	
            	// 정보보기 버튼을 눌렀을 때
            	$('.info').click(function(){
            		info($(this).prev().prev().val());
            	});
            	
            	// 친구삭제 버튼을 눌렀을 때
            	$('.del').click(function(){
            		del($(this).prev().prev().prev().val());
            	});
            	
            },
            error:function() {}
        });
	}
	
	// 친구 목록에서 정보보기를 눌렀을 때
	function info(param) {
		$.ajax({
        	url: "./InfoFriend.mb",
            data: {
            	nickname : param,
            },
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            type: 'POST',
            success:function(result) {
            	$('.infoMember').html(result);
            },
            error:function() {}
        });
	}
	
	// 친구 목록에서 삭제하기를 눌렀을 때
	function del(param) {
		
		var m_nickname = document.getElementById("m_nickname").value;
		
		$.ajax({
        	url: "./deleteFriend.mb",
            data: {
        		m_nickname : m_nickname, 
            	f_nickname : param
            },
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            type: 'POST',
            success:function(result) {
            	alert("친구 '"+result+"' 삭제 성공");
            	location.reload();
            },
            error:function() {}
        });
	}
	
	// 친구 신청 목록에서 수락을 눌렀을 때
	function acception(param) {
		var m_nickname = document.getElementById("m_nickname").value;
		
		$.ajax({
        	url: "./acceptionFriend.mb",
            data: {
            	f_nickname : param,
            	m_nickname : m_nickname},
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            type: 'POST',
            success:function(result) {
            	$('.findResult2').html(result);
            	alert("친구 수락 성공!");
            },
            error:function() {}
        });
		location.reload();
	}
	
	// 친구 신청 목록에서 거절을 눌렀을 때
	function refuse(param) {
		var m_nickname = document.getElementById("m_nickname").value;
		console.log(m_nickname);
		console.log(param);
		$.ajax({
        	url: "./refuseFriend.mb",
            data: {
            	f_nickname : param,
            	m_nickname : m_nickname},
            	contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            type: 'POST',
            success:function(result) {
            	$('.findResult2').html(result);
            	alert("친구 거절 성공")
            },
            error:function() {}
        });
		location.reload();
	}
	
	function show1() {
		$(".friend1").show();
		$(".friend2").hide();
		$(".friend3").hide();
	}
	
	function show2() {
		$(".friend1").hide();
		$(".friend2").show();
		$(".friend3").hide();
		friendList();
	}
	
	function show3() {
		$(".friend1").hide();
		$(".friend2").hide();
		$(".friend3").show();
	}
</script>
	
<style type="text/css">

.ListBtn {
	margin: auto;
    border: 1px solid #d3d3d3;
    border-radius: 40px;
    background-color: #F9B700;
    display: inline-block;
    padding: 10px 30px;
    font-weight: bold;
    color: #fff;
    outline: 0;
}

.ListBtn:HOVER {
	background-color: #EDAE06;
}

.FindBtn {
	margin: auto;
    border: 1px solid #d3d3d3;
    border-radius: 40px;
    background-color: #F9B700;
    display: inline-block;
    padding: 4px 10px;
    font-weight: bold;
    color: #fff;
    outline: 0;
}

.FindBtn:HOVER {
	background-color: #EDAE06;
}

.info, .del, .acception, .refuse{
    border: 1px solid #d3d3d3;
    border-radius: 40px;
    background-color: #F9B700;
    display: inline-block;
    padding: 4px 10px;
    font-weight: bold;
    color: #fff;
    outline: 0;
    margin-left: 13px;
}

.info, .del, .acception, .refuse{
	background-color: #EDAE06;
}

</style>
</head>
<body onload="show2()">
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
			
			<input type="button" class="ListBtn" value="친구검색" onclick="show1()">
			<input type="button" class="ListBtn" value="친구목록" onclick="show2()">
			<input type="button" class="ListBtn" value="대화하기" onclick="show3()"> <br><br>
			
			<div class="friend1">
				<input type='text' id='f_nickname' name='f_nickname' value='' placeholder="닉네임 입력">
				<input type='button' class="FindBtn" value='찾기' onclick='friendSearch()'> <br><br>
				<span class="findResult1"></span>
			</div>
			
			<div class="friend2">
				<br>
				<span class="findResult2"></span>
				<span class="findResult3"></span>
				<div class="infoMember"></div>
			</div>
			
			<div class="friend3">
				<span class="findResult4"></span>
			</div>
		</div>
	</div>
	<!-- 내용 -->
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
