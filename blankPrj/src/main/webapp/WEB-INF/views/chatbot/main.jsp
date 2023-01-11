<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blank</title>
<link rel="stylesheet" href="/blank/resources/css/chatbot/main.css">
<link rel="shortcut icon" href="/blank/resources/images/blank.ico">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
</head>
<body>

    <header>
        <div> <a onclick="goBack();">&lt;</a> 블랭크 고객센터 </div>
    </header>

	<main> 

            <c:forEach items="${msgList}" var="msg">
                <c:if test="${msg.sendNo == loginMember.no}">
                    <div class='user-talk-btn'><span class='user-talk'> ${msg.content}</span><div>
                </c:if>
                <c:if test="${msg.sendNo != loginMember.no}">
                    <div class='admin-answer-btn'><span class='chat-answer'> ${msg.content}</span><div>
                </c:if>
            </c:forEach>


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
                <div><input type="hidden" value="${vo.no}" id='chat-join' onclick='connect();'></div>
                <div id="admin-talk" class="question-item-btn"><span class="question-item" name="fixQ" onclick="ask(${vo.no},'${vo.fixQ}')">${vo.fixQ}</span></div>
            </c:forEach>
            <div class="add-target"></div>
            <div class="answer-target"></div>


        
        <div class="result-target"></div>

        <div id="result">


        </div>	

    </main>
	
    <footer>
        <div class="send-btn">
            <input type="text" class="msg">
            <button id="send-btn">전송</button>
        </div>
    </footer>

	
</body>

<script>

    function goBack(){
        window.history.back();
    }

    function ask(qNo, fixQ){
    
        const hidden = document.querySelectorAll('.question-item-btn');
        hidden.forEach(element => {
            element.remove();
        });
        
        const addTarget = document.querySelector('.add-target')
        
        const newDiv = document.createElement('div');
		newDiv.innerHTML = "<span class='user-talk'>"+fixQ+"</span>";
        
        newDiv.className = 'user-talk-btn';
        
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
		        newDiv2.innerHTML = "<span class='chat-answer' onclick='connect();'>실시간 상담 연결</span>";

                newDiv1.className = 'admin-answer-btn';
                newDiv2.className = 'admin-counsel';

                addTarget.appendChild(newDiv1);
                addTarget.appendChild(newDiv2);
            },
            error:function(){
			    alert('실패');
		    }
        });

    }
    
    const join = document.getElementById("chat-join");

    if('${loginMember.no}' == '0'){
        
        window.onload = function(){
            join.click();
        }
        
    };

    let webSocket = null;

	function connect(){

		//웹소켓 생성
		webSocket = new WebSocket("ws://127.0.0.1:8888/blank/chat/server");

        const reTarget = document.querySelector('.result-target')
        
        const newDiv = document.createElement('div');
        newDiv.innerHTML = "실시간 상담이 시작되었습니다. 무엇을 알려드릴까요?";
        
        newDiv.className = 'chat-result';
        
        reTarget.appendChild(newDiv);

        //(수신)웹소켓이 메세지 받았을 때 동작할 함수 지정
        webSocket.onmessage = function(event){	//event : 메세지 이벤트

        let msg = event.data;
        let msgArr = msg.split("#");

        let sendNo = msgArr[0];
        let receNo = msgArr[1];
        let content = msgArr[2];

        const result = document.querySelector("#result");

        if(sendNo == '${loginMember.no}'){
            $(result).append("<div class='user-talk-btn'><span class='user-talk'>" + content + "</span><div>");  
        }else{
                $(result).append("<div class='admin-counsel'><span class='chat-answer'>" + content + "</span><div>");
        };

        };

	}
	
	//전송버튼 클릭하면 동작
    $('#send-btn').on('click',function(){
        
        let sendNo = '${loginMember.no}';
        let receNo = 0;
        let message = $('.msg').val();

        if(sendNo == 0){
            receNo = '${no}';
        };

        console.log(sendNo);
        console.log(receNo);
        console.log(message);
        
        $.ajax({
            url : "/blank/chat/send",
            method : "post",
            data:{
                "sendNo" : sendNo,
                "receNo" : receNo,
                "message" : message
            },
            success : function(data){
                webSocket.send(sendNo + "#" + receNo + "#" + message);
                document.querySelector(".msg").value = "";
            },
            error:function(){
                alert('실패');
            }
        });

    });



    function chatList(){

        let sendNo = '${loginMember.no}';
        let receNo = 0;
        let message = $('.msg').val();

        $.ajax({
            url : "/blank/chat/chatList",
            method : "post",
            data:{
                "sendNo" : sendNo,
                "receNo" : receNo
            },
            success : function(result){
                alert(result);
            },
            error:function(){
                alert('실패');
            }
        });

    }





	function sendMsg(){

		//발신
		// let message = document.querySelector("#msg").value;
        
        
	}
	
	
    
</script>

</html>