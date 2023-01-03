<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ :: blank</title>
<link rel="stylesheet" href="/blank/resources/css/help/faq/detail.css">
</head>
<body>

<%@ include file = "/WEB-INF/views/common/header.jsp" %>

    <div id="faq-container">

        <header class="faq-header">
            <h1>자주 묻는 질문(FAQ)</h1>
        </header>

		<button type="button" class="close-btn" onclick="goBack();"><img id="detail-close" src="/blank/resources/images/help/close.png"></button>

		<script type="text/javascript">
		    	
		    	function goBack(){
		    		window.history.back();
		    	}
		    
		</script>
		
        <main>
	    	
	    	    <div class="faq-list">
				
					<input type="hidden" value="${selectFaq.no}" name="no">
				
					<div class="faq-title">제목</div>
					<div class="content-style">${selectFaq.title}</div>
					
					<div class="faq-title">카테고리</div>
					<div class="content-style">${selectFaq.category}</div>
		            
					<div class="faq-title">내용</div>
					<div class="content-style">${selectFaq.content}</div>
					
					<div class="faq-title">작성날짜</div>
					<div class="content-style">${selectFaq.writeDate}</div>

            	</div>
    
        </main>
    
    
    </div>

<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
</html>