<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ask :: blank</title>
<link rel="stylesheet" href="/blank/resources/css/help/inquiry/list.css">
</head>
<body>

<%@ include file = "/WEB-INF/views/common/header.jsp" %>

    <div id="inquiry-container">

        <header class="inquiry-header">
            <h1>블랭크에게 문의하기</h1>
        </header>
		
		<form action="" method="get" id="inquiry-search-form">
		
			<div class="inquiry-search">
			
				<div></div>
			
			    <div class="search-category">
					<select class="category" name="category">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
				</div>
			    <div class="search-keyword">
					<input type="text" class="keyword" name="keyword">
				</div>
				<div>
					<div class="search-icon"><input type="image" src="/blank/resources/images/admin/search.png" alt="search.png"></div>
				</div>
			    <div>
					<a href="/blank/help/inquiryWrite" id="wrtie-btn"><button type='button' class="wrtie-btn">글쓰기</button></a>
				</div>
			    
			</div>

		</form>

        <main>
    
            <div class="inquiry-list">
				
				<div class="inquiry-title">번호</div>
				<div class="inquiry-title">제목</div>
				<div class="inquiry-title">내용</div>
				<div class="inquiry-title">작성자</div>
				<div class="inquiry-title">진행상태</div>
				<div class="inquiry-title">작성날짜</div>
   
    			<c:forEach items="${voList}" var="vo">
	                <div>${vo.no}</div>
	                <div><a href="/blank/help/inquiryDetail?no=${vo.no}" name="no">${vo.title}</a></div>
	                <div>${vo.content}</div>
	                <div>${vo.memberNo}</div>
	                <c:if test="${vo.status eq 'N'}">
	                	<div id="waiting">답변 대기</div>
	                </c:if>
	                <c:if test="${vo.status eq 'Y'}">
	                	<div>답변 완료</div>
	                </c:if>
	                <div>${vo.writeDate}</div>
    			</c:forEach>

            </div>
    
        </main>
    
		<div id="page-area">
		
			<c:if test="${pageVo.startPage != 1}">
				<a href="/blank/help/inquiryList?p=${pageVo.startPage - 1}">before</a>
			</c:if>

			<c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}" >
				<a href="/blank/help/inquiryList?p=${num}">${num}</a>
			</c:forEach>

			<c:if test="${pageVo.endPage != pageVo.maxPage}">
				<a href="/blank/help/inquiryList?p=${pageVo.endPage + 1}">next</a>
			</c:if>
		
		</div>
    
    </div>

<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
</html>