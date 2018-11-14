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
<link rel="shortcut icon" href="./assets/img/common/favicon.png">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>

<script type="text/javascript">

function find_info() {
	wx = 300;
	wy = 250;
	
	sx = screen.width;
	sy = screen.height;
	
	x = (sx-wx)/2;
	y = (sy-wy)/2;
	
	if (document.find.name.value == "") {
		alert("이름을 입력하세요");
		document.find.name.focus();
		return;
	}
	
	if (document.find.phone.value == "") {
		alert("전화번호를 입력하세요");
		document.find.phone.focus();
		return;
	}
	
	var fname = document.find.name.value;
	var fphone = document.find.phone.value;
	
	// 새 창 열기("이동할 위치(페이지)", "창 이름", "창 크기", "옵션")
	wr = window.open("./IdFindChk.mb?fname="+fname+"&fphone="+fphone, "", "width=300, height=250");
	wr.moveTo(x,y);
}

function fun_cancel() {
	
	if(con == true) {
		history.back();	
	}
}
</script>

<style type="text/css">
.findMember {
	margin-top: 30px;
    border: 1px solid #d3d3d3;
    border-radius: 40px;
    background-color: #F9B700;
    display: inline-block;
    padding: 10px 30px;
    font-weight: bold;
    color: #fff;
    outline: 0;
}

.findMember:HOVER {
	background-color: #EDAE06;
	cursor: pointer;
}
</style>
</head>
<body>
	
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	
	<!-- 내용 -->
	<div id="wrap_conts" style="text-align: center">
		<div id="conts">
			<h2 id="tit">아이디 찾기</h2>
				<form action="./main.me" method="get" id="find" name="find">
					<div>
						이　　름 :
						<input type="text" id="name" name="name" placeholder="ex) 김시현" size="50"> <br><br>
						전화번호 : 
						<input type="text" id="phone" name="phone" placeholder="ex) 01050079309" size="50"> <br>
					</div>
					<input type="button" class="findMember" value="찾기" onclick="find_info()">
					<input type="button" class="findMember" value="취소" onclick="fun_cancel()">
				</form>
			<div id="pageNavi"></div>
			<div class="wrap_search"></div>
		</div>
	</div>
	<!-- 내용 -->

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>
