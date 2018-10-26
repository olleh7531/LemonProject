<%@page import="com.lemon.notice.db.NoticeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
				<input type="button" value="글 수정" onclick="location.href='./NoticeUpdate.nt?num=<%=nb.getNum()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="글 삭제" onclick="location.href='./NoticeDeleteAction.nt?num=<%=nb.getNum()%>'">
				<input type="button" value="글 목록" onclick ="location.href='./noticeInit.nt?pageNum=<%=pageNum%>'">
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>