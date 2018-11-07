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
		
		fb.setReceiver_nick(friendNickname);
		fb.setSender_nick(myNickname);
		
		int check = fdao.addFriend(fb);
		
		System.out.println(check);
		
		if(check == 1){
	%>
		<script type="text/javascript">
			alert("친구요청이 완료되었습니다.");
		</script>
	<%
		} else {
	%>
		<script type="text/javascript">
			history.back();
		</script>
	<%
		}
	%>
   </body>
</html>