<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
</head>
<body>

<%
String email_id = (String) request.getAttribute("email_id");
String code = (String) request.getAttribute("code");
%>

email_id: <%=email_id %>
code: <%=code %>

<input type="hidden" id="code" value="<%=code %>">
<input type="hidden" id="chkAuthMail" value="1">
<input type="text" id="inputCode">
<input type="button" value="확인" onclick="chkCode();">

<script type="text/javascript">
	function chkCode(){
		alert("test");
		var inputCode = $("#inputCode").val(); 
		var code = $("#code").val(); 
		
		if(inputCode == code){
			alert("인증이 완료되었습니다.");	

			window.opener.document.getElementById("fromInput").value = 'hallow';

			// 창 종료
			window.close();
			
		}		
	}
</script>


</body>
</html>