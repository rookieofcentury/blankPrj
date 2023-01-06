<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/blank/resources/css/chatbot/main.css">
</head>
<body>

    <header>
        <div> 블랭크 고객센터 </div>
    </header>

	<main> 
        <div id="blank-logo"><img src="/blank/resources/images/blank.png" class="blank-logo"></div>
        <div id="title">블랭크에게 문의하기</div>
        <div id="chat-content">
            <div><img src="/blank/resources/images/chatbot/chatbot(1).png" class="chatbot-icon"></div>

            <div class="chat-ment">
                <div>
                    안녕하세요. 블랭크 입니다.
                    <br>
                    궁금하신 문의 유형을 선택해 주세요.
                    <br><br>
                    더 빠르게 답변을 확인하고 싶으시다면,
                    FAQ를 참고해보세요!
                </div>
                <div class="faq-url">
                    <a href="/blank/help/faqList">FAQ 바로가기</a>
                </div>
            </div>
            <div></div>
            <c:forEach items="${voList}" var="vo">
                <div id="admin-talk" class="question-item-btn"><span class="question-item" onclick="ask(${vo.no});">${vo.fixQ}창작자 문의</span></div>
            </c:forEach>
        </div>
        <div class="add-target">

        </div>
    </main>
	
    <footer>
    
    </footer>
    
	
</body>

<script>
    function ask(qNo){
    
        const hidden = document.getElementById('admin-talk');
        hidden.remove();
        
        const addTarget = document.querySelector('.add-target')
        
        const newDiv = document.createElement('div');
		newDiv.innerHTML = "<span class='user-talk'>${vo.fixQ}창작자 문의</span>";
        
        newDiv.className='user-talk-btn';
        
        addTarget.appendChild(newDiv);
        
        $.ajax({
            url : "/blank/chatbot/main",
            method : "GET",
            data:{
                "no" : aNo
            },
            success : function(){

            }
        });

    }
</script>

</html>