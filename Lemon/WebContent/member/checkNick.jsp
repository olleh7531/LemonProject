<%@page import="com.lemon.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>닉네임 중복확인</title>
<script type="text/javascript">
	function result() {
		// 중복 체크된 id값을 회원가입 페이지 id값에 대입
		// 회원가입(join.jsp)에서 새창 열기로(window open())창을 열어서 체크하기 때문에
		// 두개의 페이지가 다른상태이다 그래서 부모역할을 하는 페이지(새창 열기를 해준 페이지)는
		// opener 객체를 사용해서 접근해야 한다.
		opener.document.fr.nickname.value = document.wfr.fnickname.value;
		// 새창 닫기
		window.close();
	}
</script>
</head>
<body>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	//회원가입 창에서 전달된 ID값 받아오기
	String nickname = request.getParameter("fnickname");
	
	//디비 객체 생성
	MemberDAO mdao = new MemberDAO();
	int check = mdao.checkNick(nickname);
	
	//아이디 존재유무 체크
	// 0/1
	// 0- 중복된 아이디 없음 -> "사용가능한 아이디 입니다."
	// 1- 중복된 아이디 있음 -> "사용중인 아이디 입니다."
	if(check == 1){
		out.println("이미 사용중인 닉네임 입니다.");
	}else{
		out.println("사용 가능한 닉네임 입니다.");
		%>		
			<input type="button" value="닉네임 사용하기" onclick="result()">
		<%
	}	
%>
<br><br>
<form action="checkNick.jsp" method="post" name="wfr">
	<input type="text" name="fnickname" value="<%=nickname%>">
	<input type="submit" value="중복확인">
</form>
</body>
</html>