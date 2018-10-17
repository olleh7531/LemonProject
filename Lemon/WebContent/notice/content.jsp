<%@page import="com.lemon.notice.db.NoticeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/common.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/common_page.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/menu/menu_banner.css">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>

<!-- 메뉴 -->
<jsp:include page="../common/menu.jsp"></jsp:include>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
#wrap_conts {
	width: 100%;
	text-align: center;
}

#conts {
	display: inline-block;
	width: 1008px;
	padding-top: 30px;
	padding-bottom: 90px;
}

</style>
<title>Insert title here</title>
</head>
<body>
	<%
		// 저장 
		// request.setAttribute("bb", bb); 
		// request.setAttribute("pageNum", pageNum);
		// 전달 값 저장하기 
		NoticeBean bb = (NoticeBean) request.getAttribute("nb");
		String pageNum = (String) request.getAttribute("pageNum");
	%>
	
	<div id="wrap_conts">
		<div id="conts">
			<table>
				<tr>
					<th scope="col">NO.</th>
					<th scope="col">분류</th>
					<th scope="col">제목</th>
					<th scope="col">조회</th>
					<th scope="col">등록일</th>
				</tr>

			</table>
		</div>
	</div>
</body>
</html>