<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

    <header>
        <div> 블랭크 고객센터 </div>
    </header>

	<main> 

            <div id="blank-logo"><img src="/blank/resources/images/blank.png" class="blank-logo"></div>
            <div class="chat-list">
			<c:forEach items="${voList}" var="vo">
				<div>${vo.sendNo}</div>
                <c:if test="${fn:length(vo.content) ge 8}">
                    <div>${fn:substring(vo.content, 0, 8)}...</div>
                </c:if>
                <c:if test="${fn:length(vo.content) lt 8}">
                    <div>${vo.content}</div>
                </c:if>
				<div>${vo.writeDate}</div>
				<div><a href="/blank/chatbot/main?no=${vo.no}" name="no" class="chat-in-btn">입장</a></div>
			</c:forEach>
			</div>

    </main>
	
    <footer>
        <div class="dong">
            <div class="nemo" onclick="goBack();"></div>
        </div>
    </footer>

	
</body>

<script type="text/javascript">
	            	
    function goBack(){
        window.history.back();
    }

</script>

</html>