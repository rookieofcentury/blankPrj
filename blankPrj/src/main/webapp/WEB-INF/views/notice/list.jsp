<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="/blank/resources/css/notice/list.css">
</head>
<body>

<%@ include file = "/WEB-INF/views/common/header.jsp" %>

    <div id="notice-container">

        <header class="notice-header">
            <h1>공지사항</h1>
        </header>
    
        <main>
    
            <div class="notice-list">
    
    			<c:forEach items="${voList}" var="vo">
	                <div class="notice-list-contents">
						<div><a href="/blank/notice/detail?no=${vo.no}" name="no">${vo.title}</a></div>
						<div>${vo.writeDate}</div>
	                </div>
    			</c:forEach>

            </div>
    
        </main>
    
		<div id="page-area">
		
			<c:if test="${pageVo.startPage != 1}">
			<a href="/blank/notice/list?p=${pageVo.startPage - 1}">&lt;</a>
			</c:if>
			
			<c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}" >
			<a href="/blank/notice/list?p=${num}">${num}</a>
			</c:forEach>
			
			<c:if test="${pageVo.endPage != pageVo.maxPage}">
			<a href="/blank/notice/list?p=${pageVo.endPage + 1}">&gt;</a>
			</c:if>
		
		</div>
    
        <form action="" method="get">

            <div class="search">
                <div>
                    <input type="text" name="keyword" placeholder="검색어를 입력하세요.">
                    <input type="hidden" name="category" value="title">
                </div>
                <div>
                    <input type="image" src="/blank/resources/images/admin/search.png" alt="search.png">
                </div>
            </div>

        </form>

    </div>



<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
</html>