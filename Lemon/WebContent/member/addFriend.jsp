<%@page import="com.lemon.member.db.FriendDAO"%>
<%@page import="com.lemon.member.db.FriendBean"%>
<%@page import="com.lemon.member.db.MemberDAO"%>
<%@page import="com.lemon.member.db.MemberBean"%>
<%@ page language="java" contentType="application/x-www-form-urlencoded; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>

<html>

   <head>
      <meta http-equiv="Content-Type" content="application/x-www-form-urlencoded; charset=UTF-8">
      <title>Insert title here</title>
       <script type="text/javascript">
          alert("1234");
       </script>
   </head>
   <body>
   
	  <%
		String f_nickname = (String)request.getParameter("f_nickname");
		String m_nickname = (String)request.getParameter("m_nickname");
		
		MemberBean db = new MemberBean();
		MemberDAO ddao = new MemberDAO();
		
		FriendBean fb = new FriendBean();
		FriendDAO fdao = new FriendDAO();
		
		fb.setReceiver_nick(f_nickname);
		fb.setSender_nick(m_nickname);
		
		int check = fdao.addFriend(fb);
		int friendChk = fdao.FriendCheck(m_nickname, f_nickname);
		
		if(check == 1) {
			System.out.println("친구 요청함");
	%>
		<script type="text/javascript">
			alert("친구 요청함 ^^");
		</script>
	<%
		} else {
			// check가 1이면 -> 친구상태
			if(friendChk == 1) {
				System.out.println("친구 상태입니다.");
				%>
					<script type="text/javascript">
					alert("친구 상태야 ^^");
					</script>					
				<%
			// check가 0이면 -> 요청한 상태입니다.
			} else {
				System.out.println("이미 요청한 상태입니다??");
				%>
					<script type="text/javascript">
						alert("이미 요청함 ^^");
					</script>
				<%
			}
		}
	%>
   </body>
</html>