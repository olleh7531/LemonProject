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
<link rel="shortcut icon" href="./assets/img/common/favicon.png">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
	
	<script>
	function initialization() {
		var category = document.getElementById("category").
		options[document.getElementById("category").selectedIndex].text;
		
		$.ajax({
        	url: "./notice.nt",
            data: {category: category},
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            type: 'POST',
            success:function(result) {
				$('.no_tbody').html(result);
            }, error:function() {}
        });
	}
	</script>
</head>
<body onload="initialization()">
	<%
		request.setCharacterEncoding("UTF-8");
	
		String email_id = (String) session.getAttribute("email_id");
		MemberDAO mdao = new MemberDAO();
		int level = mdao.getLevel(email_id);
		
		List NoticeList = (List) request.getAttribute("noticeList");		
		String pageNum = (String) request.getAttribute("pageNum");
		String category = (String) request.getAttribute("category");
		int count = ((Integer) request.getAttribute("count")).intValue();
		int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer) request.getAttribute("startPage")).intValue();
		int endPage = ((Integer) request.getAttribute("endPage")).intValue();
		
		
	%>
	
	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	
	<!-- 내용 -->
	<div id="wrap_conts" style="text-align: center">
		<div id="conts">
			<h2 id="tit">공지사항</h2>
			<div id="wrap_select">
				<select name="category" id="category" onchange="initialization()">
					<option value="분류"
					<%if (category.equals("분류")) {%> selected <%}%>>분류</option>
					<option value="서비스 소식"
					<%if (category.equals("서비스 소식")) {%> selected <%}%>>서비스	소식</option>
					<option value="서비스 오픈"
					<%if (category.equals("서비스 오픈")) {%> selected <%}%>>서비스	오픈</option>
					<option value="서비스 종료"
					<%if (category.equals("서비스 종료")) {%> selected <%}%>>서비스	종료</option>
					<option value="서비스 점검"
					<%if (category.equals("서비스 점검")) {%> selected <%}%>>서비스	점검</option>
					<option value="안내"
					<%if (category.equals("안내")) {%> selected <%}%>>안내</option>
				</select>
			</div>
			
			<div id="pageList">
				<table>
					<colgroup>
						<col style="width: 60px">
						<col style="width: 120px">
						<col style="width: 647px">
						<col style="width: 80px">
						<col style="width: 100px">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">NO.</th>
							<th scope="col">분류</th>
							<th scope="col">제목</th>
							<th scope="col">조회</th>
							<th scope="col">등록일</th>
						</tr>
					</thead>

					<tbody class="no_tbody"></tbody>
				</table>
				<div id="wrap_num">
					<div>
						<%
							// 페이지 출력
							if (count != 0) {
								// 이전
								if (startPage > pageBlock) {
						%>
						<a href="./notice.nt?pageNum=<%=startPage - pageBlock%>">[이전]</a>
						<%
							}
								// 1~10,11~20,21~30,....
								for (int i = startPage; i <= endPage; i++) {
						%>
						<a href="./noticeInit.nt?pageNum=<%=i%>">[<%=i%>]
						</a>
						<%
							}
								// 다음
								if (endPage < pageCount) {
						%>
						<a href="./notice.nt?pageNum=<%=startPage + pageBlock%>">[다음]</a>
						<%
							}
							}
						%>
					</div>
				</div>
				
				<%if(level == 1) {%>
					<div class="writeNotice">
						<a href="./NoticeWrite.nt">글쓰기</a>
					</div>
				<%} else {%>
					<div class="writeNotice"></div>
				<%} %>
			</div>
			
			<div id="pageNavi"></div>
			<div class="wrap_search"></div>
		</div>
	</div>
	<!-- 내용 -->
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>
