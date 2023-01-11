<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="/blank/resources/css/admin/notice/list.css">
</head>
<body>

<div class="notice-board-content">
    
    <div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
    
    <main>
    
        <div class="notice-board-header">
            <div>
                <h1>공지사항 관리</h1>
            </div>
            <div>
                <h2>공지사항</h2>
            </div>           
        </div>
        
        <div class="notice-board">

            <form action="" method="get" id="notice-search-form">

                <div class="notice-search">
                
                    <select class="category" name="category">
                        <option value="title">제목</option>
                        <option value="a.id">작성자</option>
                    </select
                    ><input type="text" name="keyword">
                    <div class="search-icon"><input type="image" src="/blank/resources/images/admin/search.png" alt="search.png"></div>
                    <a href="/blank/admin/noticeWrite"><button type='button'>작성</button></a>
                    
                </div>

            </form>
    
            <div class="notice-list">
    
                <div class="notice-list-top">전체 공지사항 <a id="listCount">${listCount}</a> 개</div>
    
                <div>번호</div>
                <div>제목</div>
                <div>내용</div>
                <div>작성자</div>
                <div>작성날짜</div>
                <div>수정</div>
                
        		<c:forEach items="${voList}" var="vo">
	                <div>${vo.no}</div>
                    <c:if test="${fn:length(vo.title) ge 25}">
						<div>${fn:substring(vo.title, 0, 25)}...</div>
					</c:if>
					<c:if test="${fn:length(vo.title) lt 25}">
						<div>${vo.title}</div>
					</c:if>
                    <c:if test="${fn:length(vo.content) ge 25}">
						<div>${fn:substring(vo.content, 0, 25)}...</div>
					</c:if>
					<c:if test="${fn:length(vo.content) lt 25}">
                        <div>${vo.content}</div>
					</c:if>
	                <div>${vo.adminNo}</div>
	                <div>${vo.writeDate}</div>
	                <div><a href="/blank/admin/noticeDetail?no=${vo.no}&deleteYn=${vo.deleteYn}" name="no"><img src="/blank/resources/images/admin/edit.png"  class="edit-img"></a></div>
        		</c:forEach>

				<div id="page-area">
				
					<c:if test="${pageVo.startPage != 1}">
						<a href="/blank/admin/notice?p=${pageVo.startPage - 1}">&lt;</a>
					</c:if>

					<c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}" >
						<a href="/blank/admin/notice?p=${num}">${num}</a>
					</c:forEach>

					<c:if test="${pageVo.endPage != pageVo.maxPage}">
						<a href="/blank/admin/notice?p=${pageVo.endPage + 1}">&gt;</a>
					</c:if>

				</div>

            </div>

        </div>

    </main>

</div>
    
</body>
</html>