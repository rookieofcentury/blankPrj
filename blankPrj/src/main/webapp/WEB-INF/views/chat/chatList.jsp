<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blank</title>
<link rel="stylesheet" href="/blank/resources/css/chat/chatList.css">
<link rel="shortcut icon" href="/blank/resources/images/blank.ico">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
</head>
<body>

	<body>

		<header>
			<div> 블랭크 고객센터 </div>
		</header>
	
		<div class="chat-list">
			<c:forEach items="${voList}" var="vo">
				<div>${vo.sendNo}</div>
				<div>${vo.content}</div>
				<div>${vo.writeDate}</div>
				<div><a href="/blank/chatbot/main?no=${vo.sendNo}" name="no">입장</a></div>
			</c:forEach>		
		</div>
	
		
	</body>

</html>