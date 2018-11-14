<%@page import="com.lemon.magazine.board.db.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/board/content.jsp</h1>
	<%
		// 저장 
		// request.setAttribute("bb", bb); 
		// request.setAttribute("pageNum", pageNum);
		// 전달 값 저장하기 
		BoardBean bb = (BoardBean) request.getAttribute("bb");
		String pageNum = (String) request.getAttribute("pageNum");
		 
	%>
	<h1> 글 내용 보기 </h1>
	<table border="1">
	 <tr>
	    <td>NO.</td><td><%=bb.getMa_Num() %></td>
	    <td>작성일</td><td><%=bb.getMa_date() %></td>
	 </tr>
	 <tr>
	    <td>글제목</td><td colspan="3"><%=bb.getMa_subject() %></td>
	 </tr>
	 <tr>
	    <td>글내용</td><td colspan="3"><%=bb.getMa_content() %></td>
	 </tr>
	 <tr >
	 <td colspan="3">
	   <input type="button" value="글 수정" onclick="location.href='./magazineUpdate.maga'">
	   <input type="button" value="글 삭제" onclick="location.href='./magazineDelete.maga'">
	   <input type="button" value="글 목록" onclick ="location.href='./magazineList.maga'">
	  </td>
	 </tr>
	
	</table>

</body>
</html>