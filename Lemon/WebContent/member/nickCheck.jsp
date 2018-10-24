<%@page import="com.parking.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>닉네임 중복확인</title>
<script type="text/javascript">
	function result() {
		opener.document.fr.nick.value = document.wfr.fid.value;
		window.close();
	}
</script>
</head>
<body>
<h1>WebContent/member/joinIdCheck.jsp</h1>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	//회원가입 창에서 전달된 ID값 받아오기
	String id = request.getParameter("fid");
	
	//디비 객체 생성
	MemberDAO mdao = new MemberDAO();
	mdao.joinIdCheck(id);
	int check = mdao.joinIdCheck(id);
	
	//아이디 존재유무 체크
	// 0/1
	// 0- 중복된 아이디 없음 -> "사용가능한 아이디 입니다."
	// 1- 중복된 아이디 있음 -> "사용중인 아이디 입니다."
	if(check == 1){
		out.println("이미 사용중인 아이디 입니다.");
	}else{
		out.println("사용 가능한 아이디 입니다.");
		%>		
			<input type="button" value="아이디 사용하기" onclick="result()">
		<%
	}	
%>
<br><br>
<form action="joinIdCheck.jsp" method="post" name="wfr">
	<input type="text" name="fid" value="<%=id%>">
	<input type="submit" value="중복확인">
</form>
</body>
</html>