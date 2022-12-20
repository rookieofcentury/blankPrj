<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

                    <select class="category">
                        <option value="title">제목</option>
                        <option value="name">작성자</option>
                    </select
                    ><input type="text" name="keyword">
                    <div class="search-icon"><input type="image" src="../resources/images/admin/search.png" alt="search.png"></div>
                    <a href=""><button>작성</button></a>
                    
                </div>


            </form>
    
            <div class="notice-list">
    
                <div class="notice-list-top">전체 공지사항 64개</div>
    
                <div>번호</div>
                <div>제목</div>
                <div>내용</div>
                <div>작성자</div>
                <div>작성날짜</div>
                <div>삭제 여부</div>
                <div>수정</div>
                
        		<c:forEach items="${voList}" var="vo">
	                <div>${vo.no}</div>
	                <div>${vo.title}</div>
	                <div>${vo.content}</div>
	                <div>${vo.adminNo}</div>
	                <div>${vo.writeDate}</div>
	                <div>${vo.deleteYn}</div>
	                <div><a href=""><img src="../resources/images/admin/edit.png"  class="edit-img"></a></div>
        		</c:forEach>

    
            </div>

        </div>

    </main>

</div>
    
</body>
</html>