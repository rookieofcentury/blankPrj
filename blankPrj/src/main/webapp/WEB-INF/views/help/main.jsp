<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="/blank/resources/css/help/main.css">
</head>
<body>

<%@ include file = "/WEB-INF/views/common/header.jsp" %>

    <main>

        <div id="help-main-content">

            <div class="help-header">
    
                <div class="title">무엇을 도와 드릴까요?</div>
    
                <form action="" method="get">
                
                    <div class="search">
                    
                        <div><input type="text" name="keyword"></div>
                        <div>
                            <input type="image" src="/blank/resources/images/admin/search.png" alt="search.png">
                        </div>
                        
                    </div>
                    
                </form>
    
            </div>
    
            <div class="help-middle">
    
                <div class="title">자주 묻는 질문(FAQ)</div>
    
                <div class="faq-contents">
                    <div>
                    	<a href="/blank/help/faqList?category=1" name="category">
                    	<img src="">회원</a>
                    </div>
                    <div>
	                    <a href="/blank/help/faqList?category=2" name="category">
	                    <img src="">결제</a>
                    </div>
                    <div>
	                    <a href="/blank/help/faqList?category=3" name="category">
	                    <img src="">배송</a>
                    </div>
                    <div>
	                    <a href="/blank/help/faqList?category=4" name="category">
	                    <img src="">기타</a>
                    </div>
                </div>
    
            </div>
    
            <div class="help-bottom">
                <div class="title">블랭크에게 문의하기</div>
    
                <div class="inquiry-contents">
    
                <c:forEach items="${voList}" var="vo">
                
					<c:if test="${vo.secretYn eq 'N'}">
						<div><a href="/blank/help/inquiryDetail?no=${vo.no}" name="no">Q. ${vo.title}</a></div>
					</c:if>
					<c:if test="${vo.secretYn == null}">
						<div><a href="/blank/help/inquiryDetail?no=${vo.no}" name="no">Q. ${vo.title}</a></div>
					</c:if>
    				<c:if test="${vo.secretYn eq 'Y' && loginMember.nick != vo.memberNo}">
	                	<div>Q. ${vo.title} &nbsp; <img src="/blank/resources/images/help/secret.png" width="11" height="13"></div>
	                </c:if>
					<c:if test="${vo.secretYn eq 'Y' && loginMember.nick == vo.memberNo}">
	                	<div><a href="/blank/help/inquiryDetail?no=${vo.no}" name="no">Q. ${vo.title}</a></div>
	                </c:if>

                    <div>${vo.memberNo}</div>
                    <div>${vo.writeDate}</div>
    
                </c:forEach>
    
    
                </div>
    
                <div class="more">
                    <a href="/blank/help/inquiryList">더보기</a>
                </div>
    
            </div>

        </div>

    </main>

<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
</html>