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
	function Select(elm) {
		if(elm.value != "분류") {
			alert(elm.value)
			location.href="./noticeCategory.nt?category="+elm.value;
		} else {
			location.href="./notice.nt";
		}
	}
	</script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		//  request 데이터 저장
		//	request.setAttribute("NoticeList", NoticeList);
		//	request.setAttribute("pageNum", pageNum);
		//	request.setAttribute("count", count);
		//	request.setAttribute("pageCount", pageCount);
		//	request.setAttribute("pageBlock", pageBlock);
		//	request.setAttribute("startPage", startPage);
		//	request.setAttribute("endPage", endPage);
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
				
				<select name="category" onchange="Select(this)">
					<option value="분류">분류</option>
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
					
					<tbody>
						<%
							if (count != 0) {
								for (int i = 0; i < NoticeList.size(); i++) {
									NoticeBean nb = (NoticeBean) NoticeList.get(i);
						%>
						<tr>
							<td scope="col"><%=nb.getNo_num()%></td>
							<td scope="col"><%=nb.getNo_category()%></td>
							<td id="subject" scope="col"><a
								href="./noticeContent.nt?num=<%=nb.getNo_num()%>&pageNum=<%=pageNum%>"><%=nb.getNo_subject()%></a></td>
							<td scope="col"><%=nb.getNo_readcount()%></td>
							<td><div class="wrap"><%=nb.getNo_reg_date()%></div></td>
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
						<a href="./notice.nt?pageNum=<%=startPage - pageBlock%>">[이전]</a>
						<%
							}
								// 1~10,11~20,21~30,....
								for (int i = startPage; i <= endPage; i++) {
						%>
						<a href="./notice.nt?pageNum=<%=i%>">[<%=i%>]
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

				<div class="writeNotice">
					<a href="./NoticeWrite.nt">글쓰기</a>
				</div>
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
