<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html>	
<head>	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
<title>Insert title here</title>	
</head>	
<body>	
  <input onclick="sendMessage()" value="Send" type="button">	
  <input onclick="disconnect()" value="Disconnect" type="button">	
  <br />	
  <textarea id="messageTextArea" rows="10" cols="50" readonly="readonly"></textarea>	
  <script type="text/javascript">	
    var webSocket = new WebSocket("ws://localhost:8787/semiProject_3Team/websocket");	
    var messageTextArea = document.getElementById("messageTextArea");	
 	
    webSocket.onopen = function(message) {	
      messageTextArea.value += "Server connect...\n";	
    };	
 	
    webSocket.onclose = function(message) {	
      messageTextArea.value += "Server Disconnect...\n";	
    };	
 	
    webSocket.onerror = function(message) {	
      messageTextArea.value += "error...\n";	
    };	
    // 서버로부터 데이터가 오면 Textarea에 표시합니다.	
    webSocket.onmessage = function(message) {	
      messageTextArea.value += "Recieve From Server => " + message.data+ "\n";	
    };	
    //Send 버튼을 누르면 세션을 가져옵니다.	
    function sendMessage() {	
      messageTextArea.value += "Get Http Session!!";	
      webSocket.send("Get");	
    }	
    function disconnect() {	
      webSocket.close();	
    }	
  </script>	
  <textarea id="messageTextArea" rows="10" cols="50"></textarea>
</body>	
</html>
