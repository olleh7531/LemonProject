<%@page import="com.lemon.notice.db.NoticeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="./assets/css/board/notice.css">

<link rel="stylesheet" type="text/css" href="./assets/css/common/common.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/common/common_footer.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/common/common_main_menu_bxslider.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/common/common_font.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/font/nanumbarungothic.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/font/nanumgothic.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/menu/menu.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/menu/menu_common.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/menu/menu_search.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/menu/menu_search_realtime.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/menu/menu_banner.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/main/main_common.css">
   <link rel="stylesheet" type="text/css" href="./assets/css/main/main_btn_page.css">
   
   <script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
   <script type="text/javascript" src="./assets/bxslider-4-4.2.12/src/js/jquery.bxslider.js"></script>
   <script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- <style type="text/css">

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

#tit {
	color: #1a1a1a;
	font-weight: bold;
	font-size: 24px;
	line-height: 30px;
	font-family: "맑은 고딕", sans-serif;
	letter-spacing: -2px;
	margin-bottom: 20px;
	text-align: left;
}

#pageList {
	padding-top: 35px;
}

#pageList table {
	border-collapse: collapse;
}

#pageList thead tr {
	border-top: 2px solid #848484;
	background-color: #fafafa;
	border-bottom: 1px solid #cfcfcf;
	height: 35px;
	line-height: 35px;
}

#pageList tbody tr {
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid #cfcfcf;
}

.dtl {
	display: block;
	padding: 21px 16px 36px;
	min-height: 200px;
	text-align: left;
}
</style> -->

<script type="text/javascript">
	function noticeList() {
		location.href = "./notice.nt";
	}
</script>

<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menu.jsp"></jsp:include>
	<%
		// 저장 
		// request.setAttribute("bb", bb); 
		// request.setAttribute("pageNum", pageNum);
		// 전달 값 저장하기
		NoticeBean nb = (NoticeBean) request.getAttribute("nb");
		String pageNum = (String) request.getAttribute("pageNum");
	%>

	<div id="wrap_conts">
		<div id="conts">
			<h2 id="tit">공지사항</h2>
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
							<th scope="col"><%=nb.getNum()%></th>
							<th scope="col"><%=nb.getNo_category()%></th>
							<th scope="col"><%=nb.getNo_subject()%></th>
							<th scope="col"><%=nb.getNo_readcount()%></th>
							<th scope="col"><%=nb.getNo_reg_date()%></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="5">
								<div class="dtl">
									<p><%=nb.getNo_content()%></p>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<button onclick="noticeList()">목록</button>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>