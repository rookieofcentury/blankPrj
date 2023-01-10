<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
</head>
<body>

<body>

	<!-- 운영자가 보는 채팅 목록으로 쓸 거임 -->

	<button onclick="connect();">연결하기</button>
	<button onclick="disconnect();">종료하기</button>

	<br>

	<input type="text" id="msg">
	<button onclick="sendMsg();">전송</button>

	<hr>

	<div id="result"></div>	<!-- 메세지 쌓이는 곳 -->
	

</body>

<script>
    
	let webSocket = null;

	function connect(){
		//웹소켓 생성
		webSocket = new WebSocket("ws://127.0.0.1:8888/blank/chat/server");
		//alert('연결');

		//(수신)웹소켓이 메세지 받았을 때 동작할 함수 지정
		webSocket.onmessage = function(event){	//event : 메세지 이벤트
			const result = document.querySelector("#result");

			$(result).append("<div class='user-talk-btn'><span class='user-talk'>" + event.data + "</span><div>");
		};
		
	}

	//전송버튼 클릭하면 동작
	function sendMsg(){
		//발신
		const msg = document.querySelector("#msg").value;
		webSocket.send(msg);
		document.querySelector("#msg").value = "";
	}
	
	//연결 종료
	function disconnect(){
		webSocket.close();
	}
    
</script>

</html>