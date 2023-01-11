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
						<input type="checkbox" name="secretYn" value="Y" id="secret-check"
						>비밀글
					</div>
		            
					<div class="inquiry-title">내용</div>
					<div class="content-input">
						<textarea name="content" id="content-input" cols="60" rows="18" placeholder="이곳에 내용을 작성하세요."></textarea>
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

</script>

</html>