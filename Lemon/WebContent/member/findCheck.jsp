<%@page import="com.lemon.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function joinMember() {
	opener.location.href = "./MemberJoin.mb";
	window.close();
}

function findPw() {
	opener.location.href = "./MemberPwFind.mb";
	window.close();	
}
</script>

<style type="text/css">
.findMember {
	margin-top: -15px;
    border: 1px solid #d3d3d3;
    border-radius: 40px;
    background-color: #F9B700;
    display: inline-block;
    padding: 10px 30px;
    font-weight: bold;
    color: #fff;
    outline: 0;
}

.findMember:HOVER {
	background-color: #EDAE06;
	cursor: pointer;
}
</style>
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
		
		if(id.equals("없음")) {
			out.println("아이디가 없습니다. ");
			%>
				<br><br><input type="button" class="findMember" value="회원가입" onclick="joinMember()">
			<%
		} else {
			out.println("아이디 : " + id);
			%>
				<br><br><input type="button" class="findMember" value="비밀번호 찾기" onclick="findPw()">
			<%
		}
	%>
</body>
</html>