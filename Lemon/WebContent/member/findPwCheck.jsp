<%@page import="com.lemon.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function goMain() {
	opener.location.href = "./main.mi";
	window.close();
}

</script>
</head>
<body>
<%
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 회원가입 창에서 전달된 ID값 받아오기
		String email_id = (String)request.getParameter("fid");
		String name = (String)request.getParameter("fname");
		String phone = (String)request.getParameter("fphone");
		
		// 디비 객체 생성
		MemberDAO mdao = new MemberDAO();
		
		// 아이디 존재유무 체크
		String id = mdao.findId(name, phone);
		String pw = mdao.findPw(email_id, name, phone);
		%>
			<h3>아이디 : <%=id %></h3>
			<h3>비밀번호 : <%=pw %></h3>
			<br><br><input type="button" value="초기 화면으로" onclick="goMain()">
		<%
		
	%>
</body>
</html>