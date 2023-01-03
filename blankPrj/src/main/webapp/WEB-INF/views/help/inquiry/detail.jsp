<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ask :: blank</title>
<link rel="stylesheet" href="/blank/resources/css/help/inquiry/detail.css">
</head>
<body>

<%@ include file = "/WEB-INF/views/common/header.jsp" %>

    <div id="inquiry-container">

        <header class="inquiry-header">
            <h1>블랭크에게 문의하기</h1>
        </header>

		<button type="button" class="close-btn" onclick="goBack();"><img id="write-close" src="/blank/resources/images/help/close.png"></button>

		<script type="text/javascript">
		    	
		    	function goBack(){
		    		window.history.back();
		    	}
		    
		</script>
		
        <main>
	    	
	    	    <div class="inquiry-list">
				
					<div class="inquiry-title">작성자</div>
					<div class="content-style">${selectInquiry.memberNo}</div>
					<div><input type="hidden" value="${selectInquiry.no}" name="no"></div>
					
					<div class="inquiry-title">제목</div>
					<div class="content-style">${selectInquiry.title}</div>
					<div class="inquiry-title">작성일 &nbsp;&nbsp;&nbsp;&nbsp; ${selectInquiry.writeDate}</div>
		            
					<div class="inquiry-title">내용</div>
					<div class="content-style">${selectInquiry.content}</div>
					<div></div>
					
					<div class="inquiry-title">답변</div>
					<c:if test="${selectInquiry.adComment == null}">
	                	<div class="content-style adComment">답변을 기다리는 중입니다 ! [ 작성일 기준 3일 이내 답변이 작성됩니다. ]</div>
	                </c:if>
	                <c:if test="${selectInquiry.adComment != null}">
	                	<div class="content-style">${selectInquiry.adComment}</div>
	                </c:if>
					<div></div>

            	</div>
    
        </main>
    
    
    </div>

<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
</html>