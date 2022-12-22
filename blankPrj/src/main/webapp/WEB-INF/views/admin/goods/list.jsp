<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BLANK ADMIN</title>
<link rel="stylesheet" href="/blank/resources/css/admin/common/menu.css">
<link rel="stylesheet" href="/blank/resources/css/admin/goods/list.css">
</head>
<body>

<div class="member-board-content">

	<div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
	
    <main>

        <div class="member-board-header">
            <div>
                <h1>굿즈 관리</h1>
            </div>
        </div>
        
        <div class="member-board">

            <form action="" method="get" id="member-search-form">
            
                <div class="member-search">
                
                    <select class="category">
                        <option value="no" name="keyword">번호</option>
                        <option value="category" name="keyword">카테고리</option>
                        <option value="name" name="keyword">이름</option>
                    </select>
                    <input type="text" name="keyword">
                    <div class="search-icon"><input type="image" src="blank/resources/images/admin/search.png" alt="search.png"></div>
                    
                </div>
                <div id="goods-add-btn" onclick="location.href='/blank/admin/goods/add'">굿즈 등록</div>
                
            </form>
    
            <div class="member-list">
    
                <div class="member-list-top">전체 굿즈 cnt 개</div>
    
                <div>번호</div>
                <div>카테고리</div>
                <div>이름</div>
                <div>가격</div>
                <div>재고</div>
                <div>등록일자</div>
                <div>삭제여부</div>
                <div>기획전</div>
                <div>수정</div>
        
                <c:forEach items="${list}" var="vo">
                <div>${vo.no}</div>
                <div>${vo.category}</div>
                <div>${vo.name}</div>
                <div>${vo.price}</div>
                <div>${vo.stock}</div>
                <div>${vo.enrollDate}</div>
                <div>${vo.deleteYn}</div>
                <div>${vo.exhibition}</div>
                <div><a href="/blank/admin/goods/edit?no=${vo.no}"><img src="../resources/images/admin/edit.png"></a></div>
                </c:forEach>
            </div>

        </div>

    </main>

</div>

</body>
</html>