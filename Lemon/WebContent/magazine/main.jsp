<%@page import="java.util.List"%>
<%@page import="com.lemon.magazine.board.db.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레몬 Lemon</title>
<link rel="stylesheet" type="text/css"	href="./assets/css/magazine/table.css">
<!-- 메인페이지 css -->


<link rel="stylesheet" type="text/css"	href="./assets/css/common/common.css">
<link rel="stylesheet" type="text/css"	href="./assets/css/common/menu.css">
<link rel="stylesheet" type="text/css"	href="./assets/css/common/main_menu_bxslider.css">
<!-- 메인 / 메뉴 슬라이더 -->
<link rel="stylesheet" type="text/css"	href="./assets/css/common/font.css">
<link rel="stylesheet" type="text/css"	href="./assets/css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css"	href="./assets/css/font/nanumgothic.css">
<link rel="stylesheet" type="text/css"	href="./assets/css/common/footer.css">
<link rel="stylesheet" type="text/css" href="./assets/css/main/main.css">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"	src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
<script type="text/javascript"	src="./assets/js/menu/main_search_real_time.js"></script>
<script type="text/javascript" src="./assets/js/main/main_new_album.js"></script>
<script type="text/javascript" src="./assets/js/main/main_event.js"></script>
<script type="text/javascript" src="./assets/js/main/main_hot_issue.js"></script>
<script type="text/javascript" src="./assets/js/main/main_chart.js"></script>
<script type="text/javascript" src="./assets/js/main/main_login.js"></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async	defer></script>

<script type="text/javascript"	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script src="viewTinted.js"></script>
<script>
	$(function() {
		$(document).viewTinted();
	});
</script>

</head>
<body>
	<%
		List boardList = (List) request.getAttribute("boardList");
		String pageNum = (String) request.getAttribute("pageNum");
		int count = ((Integer) request.getAttribute("count")).intValue();
		int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer) request.getAttribute("startPage")).intValue();
		int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	%>


	<!-- 메뉴 -->
	<jsp:include page="../common/menu.jsp"></jsp:include>
	<div id="cont_wrap" class="clfix">
		<div id="conts_section" class="pr_none">
			<section id="listForm">
				<h1>Magazine</h1>
			<div id="pageList">
				<table class="type04">
					<colgroup>
						<col style="width: 5%">
						<col style="width: 22%">
						<col style="width: 55%">
						<col style="width: 13%">
						<col style="width: 5%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">NO.</th>
							<th scope="col">이미지</th>
							<th scope="col">제목</th>
							<th scope="col">날짜</th>
							<th scope="col">조회</th>
						</tr>
					</thead>
					<%
						if (count != 0) {
							for (int i = 0; i < boardList.size(); i++) {
								BoardBean bb = (BoardBean) boardList.get(i);
					%>
					<tr onclick="location.href='./magazineContent.maga?num=<%=bb.getMa_Num()%>&pageNum=<%=pageNum %>'" style="cursor: pointer;">
						<td><%=bb.getMa_Num()%></td>
						<td><img alt="" src="./magazine/image/<%=bb.getMa_file() %>" height="50"> </td>
						<td><%=bb.getMa_subject()%></td>
						<td><%=bb.getMa_date()%></td>
						<td><%=bb.getMa_readcount()%></td>
					</tr>
					<%
						}
						}
					%>
				</table>
				</div>
				<br>
				<br>
				<a href="/Lemon/magazineBoardWrite.maga">글쓰기</a>
				<div style="text-align: center;">
					<div class="pagination">
						<%
							if (count != 0) {
								if (startPage > pageBlock) {
						%>
						<a href="./magazineList.maga?pageNum=<%=startPage - pageBlock%>">
							&laquo; </a>
						<%
							}
								for (int i = startPage; i <= endPage; i++) {
						%>
						<a href="./magazineList.maga?pageNum=<%=i%>"
							<%if (Integer.parseInt(pageNum) == i) {%> class="active" <%}%>><%=i%>
						</a>
						<%
							}
								if (endPage < pageCount) {
						%>
						<a href="./magazineList.maga?pageNum=<%=startPage + pageBlock%>">&raquo;</a>
						<%
							}
							}
						%>
					</div>
				</div>

			</section>
		</div>
	</div>



</body>
</html>