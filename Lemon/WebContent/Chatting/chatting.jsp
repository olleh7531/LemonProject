<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Testing websockets</title>
<script type="text/javascript" src="./assets/js/jquery-3.3.1.min.js"></script>
<script type='text/javascript' src="./assets/js/player/jquery.js"></script>
</head>

<%
	//request.setAttribute("sender", sender);
	//request.setAttribute("receiver", receiver);
	String nickname = (String) session.getAttribute("nickname");
	System.out.println("nickname : " + nickname);
	String sender = (String) request.getAttribute("sender");
	String receiver = (String) request.getAttribute("receiver");
%>

<body>
	<input type="hidden" id="sender" value="<%=sender%>">
	<input type="hidden" id="receiver" value="<%=receiver%>">
	<input type="hidden" id="ch_num"
		value="<%=request.getAttribute("ch_num")%>">
	<input type="hidden" value="<%=nickname%>" id="nickname">
	<fieldset>
		<textarea id="messageWindow" rows="10" cols="50" readonly="true" style="width: 354px; height: 300px;"></textarea>
		<br> <input id="inputMessage" type="text" /> <input
			type="submit" value="send" onclick="send()" />
	</fieldset>
</body>

<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
	var nickname = document.getElementById("nickname");
	var sender = document.getElementById("sender");
	var receiver = document.getElementById("receiver");
	var ch_num = document.getElementById("ch_num");

	var webSocket = new WebSocket("ws://localhost:8088/Lemon/LemonChatting/"
			+ ch_num.value);
	var inputMessage = document.getElementById('inputMessage');
	webSocket.onerror = function(event) {
		onError(event)
	};
	webSocket.onopen = function(event) {
		onOpen(event)
	};
	webSocket.onmessage = function(event) {
		onMessage(event)
	};

	function onMessage(event) {
		textarea.value = "";
		textarea.value += "상대 : " + event.data + "\n";
		
	}
	function onOpen(event) {
		textarea.value += "연결 성공\n";
	}
	function onError(event) {
		alert(event.data);
	}

	function send() {
		textarea.value += nickname.value + " : " + inputMessage.value + "\n";
		var msg = inputMessage.value;
		webSocket.send(textarea.value);
		message(msg)
		inputMessage.value = "";
		
	}
	function message(msg) {
		$.ajax({
			type : "POST",
			url : "./insertMessage.ch",
			data : {
				sender : sender.value,
				receiver : receiver.value,
				message : msg,
				channel : ch_num.value
			},
			success : function(data) {

			},
			error : function(xhr, status, error) {
				alert(error);
			}
		})
	}
	function selectMessage(ch_num) {
		$.getJSON("./selectMessage.ch",{channel: ch_num.value },function(data){
				$(data).each(function(index,item){
					/* alert("num : "+item.num);
					alert("sender : "+item.sender);
					alert("receiver : "+item.receiver);
					alert("message : "+item.message);
					alert("sendtime : "+item.sendtime);
					alert("channel : "+item.channel); */
					
					textarea.value += item.sender+" : "+item.message +"\n";
				})
		})
	}
	
	$(document).ready(function() {
		selectMessage(ch_num);
	});
</script>
</html>