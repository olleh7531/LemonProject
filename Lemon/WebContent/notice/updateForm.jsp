<%@page import="com.lemon.notice.db.NoticeDAO"%>
<%@page import="com.lemon.notice.db.NoticeBean"%>
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
<link rel="stylesheet" type="text/css" href="./assets/css/common/footer.css">
<link rel="shortcut icon" href="./assets/img/common/favicon.png">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
<script type="text/javascript" src="./assets/SE2/js/HuskyEZCreator.js"></script>
<script src="./assets/js/jquery-3.1.1.min.js"></script>
<!-- Mainly scripts -->

<script type="text/javascript">
	$(document).ready(
		function() {
			var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함. 
			// Editor Setting 
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors, // 전역변수 명과 동일해야 함. 
				elPlaceHolder : "smarteditor", // 에디터가 그려질 textarea ID 값과 동일 해야 함. 
				sSkinURI : "./assets/SE2/SmartEditor2Skin.html", // Editor HTML 
				fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X 
				htParams : { // 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseToolbar : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseVerticalResizer : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseModeChanger : true,
				}
			}); // 전송버튼 클릭이벤트 
			$("#submit_btn").click(
				function() {
					if (!$('#subject').val()) {
						alert("제목을 입력하세요.");
						document.frm.subject.focus();
						return;
					}

					oEditors.getById["smarteditor"].exec(
					"UPDATE_CONTENTS_FIELD", []); // 이부분에 에디터 validation 검증
					var ir1 = $("#smarteditor").val();

					if (ir1 == "" || ir1 == null || ir1 == '&nbsp;'
						|| ir1 == '<p>&nbsp;</p>') {
						alert("내용을 입력하세요.");
						oEditors.getById["ir1"].exec("FOCUS"); //포커싱
						return;
					}

					try {
						$("#frm").submit();
					} catch (e) {}
				})
		});
		
	function fun_cancel() {
		var con = confirm("글 작성을 취소하시겠습니까?");

		if (con == true) {
			history.back();
		}
	}
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		NoticeDAO ndao = new NoticeDAO();
		NoticeBean nb = ndao.getNotice(num);
	%>

	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>

	<!-- 내용 -->
	<div id="wrap_conts">
		<div id="conts">
			<form action="./NoticeUpdateAction.nt?pageNum=<%=pageNum%>"
				method="post" id="frm">
				<input type="hidden" name="num" value="<%=num%>">
				<div class="cate_sub">
					<select name="category">
						<option value="서비스 소식"
							<%if (nb.getNo_category().equals("서비스 소식")) {%> selected <%}%>>서비스
							소식</option>
						<option value="서비스 오픈"
							<%if (nb.getNo_category().equals("서비스 오픈")) {%> selected <%}%>>서비스
							오픈</option>
						<option value="서비스 종료"
							<%if (nb.getNo_category().equals("서비스 종료")) {%> selected <%}%>>서비스
							종료</option>
						<option value="서비스 점검"
							<%if (nb.getNo_category().equals("서비스 점검")) {%> selected <%}%>>서비스
							점검</option>
						<option value="안내" <%if (nb.getNo_category().equals("안내")) {%>
							selected <%}%>>안내</option>
					</select> 
					
					<input type="text" name="subject" id="subject" value="<%=nb.getNo_subject()%>" size="80"> <br>
				</div>
				
				<textarea name="content" id="smarteditor" class="summernote"><%=nb.getNo_content()%></textarea><br>

				<div>
					<input type="button" id="submit_btn" value="수정"> 
					<input type="button" id="cancel_btn" value="취소" onclick="fun_cancel()">
				</div>
			</form>
		</div>
	</div>
	<!-- 내용 -->

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>