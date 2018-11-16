<%@page import="com.lemon.magazine.board.db.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>레몬 Lemon</title>
<link rel="stylesheet" type="text/css"
	href="./assets/css/magazine/table.css">

<link rel="stylesheet" type="text/css"
	href="./assets/css/common/common.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/menu.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/main_menu_bxslider.css">
<!-- 메인 / 메뉴 슬라이더 -->
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/font.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/font/nanumgothic.css">
<link rel="stylesheet" type="text/css" href="./assets/css/main/main.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/footer.css">

<link rel="stylesheet" type="text/css"
	href="./assets/font-awesome/css/font-awesome.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/chart/chart.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/chart/chartCapy.css">

<link rel="shortcut icon" href="./assets/img/common/favicon.png">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
<script type='text/javascript' src="./assets/js/player/jquery.js"></script>
<script type="text/javascript" src="./assets/js/chart/chartCheckBox.js"></script>
</head>
<body>
	<jsp:include page="../common/menu.jsp"></jsp:include>
	<div id="cont_wrap" class="clfix">
		<div id="conts_section" class="pr_none">
			<%
				// 저장 
				// request.setAttribute("bb", bb); 
				// request.setAttribute("pageNum", pageNum);
				// 전달 값 저장하기 
				BoardBean bb = (BoardBean) request.getAttribute("bb");
				String pageNum = (String) request.getAttribute("pageNum");
			%>
			<table class="type04">
				<colgroup>
					<col style="width: 3%">
					<col style="width: 3%">
					<col style="width: 71%">
					<col style="width: 10%">
					<col style="width: 13%">
				</colgroup>
				<tr style="text-align: center;">
					<th scope="col">NO.</th>
					<th scope="col"><%=bb.getMa_Num()%></th>
					<th scope="col"></th>
					<th scope="col">작성일</th>
					<th scope="col"><%=bb.getMa_date()%></th>
				</tr>
				<tr>
					<td></td>
					<td colspan="3" style="font-weight: bold;"><%=bb.getMa_subject()%></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="3"><%=bb.getMa_content()%></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: center;">
						<input type="button" value="글 수정" class="button"
						onclick="location.href='./magazineUpdate.maga?num=<%=bb.getMa_Num()%>&pageNum=<%=pageNum%>'">
						<input type="button" value="글 삭제" class="button"
						onclick="location.href='./magazineDeleteAction.maga?num=<%=bb.getMa_Num()%>&pageNum=<%=pageNum%>'">
						<input type="button" value="글 목록" class="button"
						onclick="location.href='./magazineList.maga?pageNum=<%=pageNum%>'"></td>
				</tr>

			</table>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>