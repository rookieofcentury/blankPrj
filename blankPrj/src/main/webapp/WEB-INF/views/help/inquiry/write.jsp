<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ask :: blank</title>
<link rel="stylesheet" href="/blank/resources/css/help/inquiry/write.css">
</head>
<body>

<%@ include file = "/WEB-INF/views/common/header.jsp" %>

    <div id="inquiry-container">

        <header class="inquiry-header">
            <h1>블랭크에게 문의하기</h1>
        </header>

		<button type="button" class="close-btn" onclick="goBack();"><img id="write-close" src="/blank/resources/images/help/close.png"></button>
		
        <main>
    	
	    	<form action="/blank/help/inquiryWrite" method="post">
	    	
	    	    <div class="inquiry-list">
				
					<div class="inquiry-title content-style">제목</div>
					<div class="title-input content-style">
		            	<input type="text" id="title-input" name="title" placeholder="이곳에 제목을 작성하세요.">
		            </div>
		            <div class="secret-btn content-style">
						<input type="checkbox" name="secretYn" value="Y" id="secret-check" onclick="toggleTextbox(this);"
						>비밀글
					</div>
		            <div class="password-input content-style">PW&nbsp;&nbsp;<input type="password" name="password" id="result" disabled></div>
		            
					<div class="inquiry-title">내용</div>
					<div class="content-input">
						<input
							type="text"
							id="content-input"
							name="content"
							placeholder="이곳에 내용을 작성하세요.">
						<input type="hidden" name="memberNo" value="${loginMember.no}">
		            </div>

	                <div id="write-submit">
	                    <input type="submit" value="등록" class="write-submit-btn"/>
					</div>

            	</div>
            	
	    	</form>

    
        </main>
    
    
    </div>

<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>

<script type="text/javascript">
	
	//창 닫기
	function goBack(){
		window.history.back();
	}

	//비밀글 작성 활성화
	function toggleTextbox(checkbox){

		const textbox_elem = document.getElementById('result');

		textbox_elem.disabled = checkbox.checked ? false : true;

		if(textbox_elem.disabled) {
			textbox_elem.value = null;
		}else {
			textbox_elem.focus();
		}

	}

</script>

</html>