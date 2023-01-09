<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blank</title>
<link rel="stylesheet" href="/blank/resources/css/chatbot/main.css">
<link rel="shortcut icon" href="/blank/resources/images/member/blank.ico">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
</head>
<body>

    <header>
        <div> 블랭크 고객센터 </div>
    </header>

	<main> 
        <div id="blank-logo"><img src="/blank/resources/images/blank.png" class="blank-logo"></div>
        <div id="title">블랭크에게 문의하기</div>
        <div id="time">평일 09:00 ~ 18:00 운영</div>
        <div id="chat-content">
            <div><img src="/blank/resources/images/chatbot/chatbot(1).png" class="chatbot-icon"></div>

            <div class="chat-ment">
                <div>
                    안녕하세요. 블랭크 입니다.
                    <br>
                    궁금하신 문의 유형을 선택해 주세요.
                    <br><br>
                    빠르게 답변을 확인하고 싶으시다면,
                    FAQ를 참고해보세요!
                </div>
                <div class="faq-url">
                    <a href="/blank/help/faqList">FAQ 바로가기</a>
                </div>
            </div>
        </div>
        <c:forEach items="${voList}" var="vo">
            <div><input type="hidden" value="${vo.no}"></div>
            <div id="admin-talk" class="question-item-btn"><span class="question-item" name="fixQ" onclick="ask(${vo.no},'${vo.fixQ}')">${vo.fixQ}</span></div>
        </c:forEach>
        <div class="add-target"></div>
        <div class="answer-target"></div>
    </main>
	
    <footer>
    
    </footer>

	
</body>

<script>
    function ask(qNo, fixQ){
    
        const hidden = document.querySelectorAll('.question-item-btn');
        hidden.forEach(element => {
            element.remove();
        });
        
        const addTarget = document.querySelector('.add-target')
        
        const newDiv = document.createElement('div');
		newDiv.innerHTML = "<span class='user-talk'>"+fixQ+"</span>";
        
        newDiv.className='user-talk-btn';
        
        addTarget.appendChild(newDiv);
        
        $.ajax({
            url : "/blank/chatbot/answer",
            method : "GET",
            data:{
                "no" : qNo
            },
            success : function(data){
                const addTarget = document.querySelector('.answer-target')

                const newDiv1 = document.createElement('div');
		        newDiv1.innerHTML = "<img src='/blank/resources/images/chatbot/chatbot(1).png' class='chatbot-icon'><span class='chat-answer'>"+data+"</span>";
                const newDiv2 = document.createElement('div');
		        newDiv2.innerHTML = "<span class='chat-answer'>실시간 상담 연결</span>";

                newDiv1.className='admin-answer-btn';
                newDiv2.className='admin-counsel';

                addTarget.appendChild(newDiv1);
                addTarget.appendChild(newDiv2);
            },
            error:function(){
			    alert('실패');
		    }
        });

    }
</script>

</html>