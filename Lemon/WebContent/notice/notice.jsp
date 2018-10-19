<%@page import="com.lemon.notice.db.NoticeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 메뉴 -->
<jsp:include page="../common/menu.jsp"></jsp:include>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/common.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/menu/menu_common.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/menu/menu_search.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/menu/menu_search_realtime.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/menu/menu_banner.css">
<link rel="stylesheet" type="text/css" href="./assets/css/menu/menu.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/common_font.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/font/nanumgothic.css">
<link rel="stylesheet" type="text/css"
	href="./assets/css/common/common_footer.css">
	<link rel="stylesheet" type="text/css" href="./assets/css/main/main_event_bxslider.css">

<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./assets/js/menu/menu_banner.js"></script>

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
	text-align: center;
	padding-top: 35px;
}

#pageList table {
	border-collapse: collapse;
	 border: 1px;
	 width: 100%;
}

#pageList thead tr {
	border-top: 2px solid #848484;
	background-color: #fafafa;
	border-bottom: 1px solid #cfcfcf;
	height: 35px;
	line-height: 35px;
}

#pageList tbody {
	text-align: center;
}

#pageList tbody tr {
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid #cfcfcf;
}

#pageList tbody #subject {
	text-align: left;
}

#wrap_select {
	margin-bottom: 10px;
}

#wrap_select select {
	width: 152px;
	height: 26px;
	float: left;
}

.writeNotice {
	margin-top: 50px;
	float: none;
}

#wrap_num {
	margin-top: 10px;
}
</style>

</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		//request 데이터 저장
		//	request.setAttribute("NoticeList", NoticeList);
		//	request.setAttribute("pageNum", pageNum);
		//	request.setAttribute("count", count);
		//	request.setAttribute("pageCount", pageCount);
		//	request.setAttribute("pageBlock", pageBlock);
		//	request.setAttribute("startPage", startPage);
		//	request.setAttribute("endPage", endPage);

		List NoticeList = (List) request.getAttribute("noticeList");
		String pageNum = (String) request.getAttribute("pageNum");
		int count = ((Integer) request.getAttribute("count")).intValue();
		int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer) request.getAttribute("startPage")).intValue();
		int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	%>

	<div id="wrap_conts">
		<div id="conts">
			<h2 id="tit">공지사항</h2>
			<div id="wrap_select">
				<select>
					<option>분류</option>
					<option>서비스 소식</option>
					<option>서비스 오픈</option>
					<option>서비스 종료</option>
					<option>서비스 점검</option>
					<option>안내</option>
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

					<tbody>
						<%
							if (count != 0) {
								for (int i = 0; i < NoticeList.size(); i++) {
									NoticeBean nb = (NoticeBean) NoticeList.get(i);
						%>
						<tr>
							<td scope="col"><%=nb.getNum()%></td>
							<td scope="col"><%=nb.getCategory()%></td>
							<td id="subject" scope="col"><a
								href="./noticeContent.nt?num=<%=nb.getNum()%>&pageNum=<%=pageNum%>"><%=nb.getSubject()%></a></td>
							<td scope="col"><%=nb.getReadcount()%></td>
							<td><div class="wrap"><%=nb.getReg_date()%></div></td>
						</tr>
						<%
							}
							}
						%>
					
					<tbody>
				</table>
				<div id="wrap_num">
					<div>
						<%
							// 페이지 출력
							if (count != 0) {
								// 이전
								if (startPage > pageBlock) {
						%>
						<a href="./NoticeList.bo?pageNum=<%=startPage - pageBlock%>">[이전]</a>
						<%
							}
								// 1~10,11~20,21~30,....
								for (int i = startPage; i <= endPage; i++) {
						%>
						<a href="./NoticeList.bo?pageNum=<%=i%>">[<%=i%>] </a>
						<%
								}
								// 다음
								if (endPage < pageCount) {
						%>
						<a href="./NoticeList.bo?pageNum=<%=startPage + pageBlock%>">[다음]</a>
						<%
								}
							}
						%>
					</div>
				</div>
				</tbody>
				</table>
				
				<div class="writeNotice">
					<a href="./NoticeWrite.nt">글쓰기</a>
				</div>
			</div>

			<div id="pageNavi"></div>
			<div class="wrap_search"></div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>