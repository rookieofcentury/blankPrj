<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% session.removeAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BLANK ADMIN</title>
<link rel="stylesheet" href="/blank/resources/css/admin/common/menu.css">
<link rel="stylesheet" href="/blank/resources/css/admin/goods/list.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
                
                    <select class="category" name="category">
                        <option value="G.NO">번호</option>
                        <option value="G.NAME">이름</option>
                    </select>
                    <input type="text" name="keyword" placeholder="검색어를 입력해 주세요.">
                    <div class="search-icon"><input type="submit" value="" id="search-btn"></div>
                    
                </div>
                <input type="hidden" name="p" value="1">
                <div id="goods-add-btn" onclick="location.href='/blank/admin/goods/add'">굿즈 등록</div>
                
            </form>
    
            <div class="member-list">
    
                <div class="member-list-top">전체 굿즈 ${listCount} 개</div>
    
                <div>번호</div>
                <div>카테고리</div>
                <div>이름</div>
                <div>가격</div>
                <div>재고</div>
                <div>등록일자</div>
                <div>기획전</div>
                <div>수정</div>
        
                <c:forEach items="${list}" var="vo">
                <div>${vo.no}</div>
                <div>${vo.category}</div>
                <div>${vo.name}</div>
                <div>${vo.price}</div>
                <div>${vo.stock}</div>
                <div>${vo.enrollDate}</div>
                <div>${vo.exhibition}</div>
                <div><a href="/blank/admin/goods/edit?no=${vo.no}"><img src="/blank/resources/images/admin/edit.png"></a></div>
                </c:forEach>

            </div>

            <div id="page-area">
				
                <c:if test="${pageVo.startPage != 1}">
                    <a href="/blank/admin/goods/list?p=${pageVo.startPage - 1}"></a>
                </c:if>

                <c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}" >
                    <a href="/blank/admin/goods/list?p=${num}">${num}</a>
                </c:forEach>

                <c:if test="${pageVo.endPage != pageVo.maxPage}">
                    <a href="/blank/admin/goods/list?p=${pageVo.endPage + 1}"></a>
                </c:if>

            </div>

        </div>

    </main>

</div>
</body>
<script>
    $(document).ready(function() {
        var alertMsg = '${msg}';
        console.log(alertMsg);
        if(alertMsg != '') {
            Swal.fire(
            '안내 메시지',
            alertMsg,
            'info'
            )
        }
    });
</script>
</html>