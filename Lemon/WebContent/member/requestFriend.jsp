<%@page import="java.util.ArrayList"%>
<%@page import="com.lemon.member.db.FriendDAO"%>
<%@page import="com.lemon.member.db.FriendBean"%>
<%@page import="com.lemon.member.db.MemberDAO"%>
<%@page import="com.lemon.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Insert title here</title>
   </head>
   <body>
	<%
		String friendNickname = (String)request.getParameter("f_nickname");
		String myNickname = (String)request.getParameter("m_nickname");
		
		MemberBean db = new MemberBean();
		MemberDAO ddao = new MemberDAO();
		
		FriendBean fb = new FriendBean();
		FriendDAO fdao = new FriendDAO();
		
		ArrayList<String> check = fdao.requestFriend(myNickname); 
		// 친구 요청받은지 유무
		
		if(check.size() != 0) {
	%>
		<script type="text/javascript">
			alert("'<%=check%>'에게 친구요청 받음 ^^");
		</script>
	<%
		} else {
	%>
		<script type="text/javascript">
			alert("친구요청 안받음 ^^");
		</script>	
	<%
		}
	%>
   </body>
</html>