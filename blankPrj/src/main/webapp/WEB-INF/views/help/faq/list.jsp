<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ :: blank</title>
<link rel="stylesheet" href="/blank/resources/css/help/faq/list.css">
</head>
<body>

<%@ include file = "/WEB-INF/views/common/header.jsp" %>

    <div id="faq-container">

        <header class="faq-header">
            <h1>자주 묻는 질문(FAQ)</h1>
        </header>

        <main>
    
            <div class="faq-list">
				
				<div class="faq-title">번호</div>
				<div class="faq-title">제목</div>
				<div class="faq-title">카테고리</div>
				<div class="faq-title">내용</div>
				<div class="faq-title">작성날짜</div>
   
    			<c:forEach items="${voList}" var="vo">
	                <div>${vo.no}</div>
	                <div><a href="/blank/help/faqDetail?no=${vo.no}" name="no">${vo.title}</a></div>
	                <div>${vo.category}</div>
	                <div>${vo.content}</div>
	                <div>${vo.writeDate}</div>
    			</c:forEach>

            </div>
    
        </main>
    
		<div id="page-area">
		
			<c:if test="${pageVo.startPage != 1}">
				<a href="/blank/help/faqList?p=${pageVo.startPage - 1}">before</a>
			</c:if>

			<c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}" >
				<a href="/blank/help/faqList?p=${num}">${num}</a>
			</c:forEach>

			<c:if test="${pageVo.endPage != pageVo.maxPage}">
				<a href="/blank/help/faqList?p=${pageVo.endPage + 1}">next</a>
			</c:if>
		
		</div>
    
    </div>

<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
</html>