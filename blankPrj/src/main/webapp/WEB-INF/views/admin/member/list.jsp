<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<link rel="stylesheet" href="/blank/resources/css/admin/member/list.css">
</head>
<body>

<div class="member-board-content">

	<div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
	
    <main>

        <div class="member-board-header">
            <div>
                <h1>회원 관리</h1>
            </div>
        </div>
        
        <div class="member-board">

            <form action="" method="get" id="member-search-form">
            
                <div class="member-search">
                
                    <select class="category" name="category">
                        <option value="nick">닉네임</option>
                        <option value="phone">핸드폰 번호</option>
                        <option value="email">이메일</option>
                    </select
                    ><input type="text" name="keyword">
                    <div class="search-icon"><input type="image" src="/blank/resources/images/admin/search.png" alt="search.png"></div>
                
                </div>
                
            </form>
    
            <div class="member-list">
    
                <div class="member-list-top">전체 회원  ${listCount} 명</div>
    
                <div>번호</div>
                <div>닉네임</div>
                <div>핸드폰 번호</div>
                <div>이메일</div>
                <div>포인트</div>
                <div>은행명</div>
                <div>계좌번호</div>
                <div>예금주명</div>
                <div>계정상태</div>
                <div>수정</div>

				<c:forEach items="${voList}" var="vo">
	                <div>${vo.no}</div>
	                <div>${vo.nick}</div>
	                <div>${vo.phone}</div>
	                <div>${vo.email}</div>
	                <div>${vo.point}</div>
	                <div>${vo.bank}</div>
	                <div>${vo.account}</div>
	                <div>${vo.depositor}</div>
	                <div>${vo.status}</div>
	                <div><a href="/blank/admin/memberEdit?no=${vo.no}&status=${vo.status}" name="no"><img src="/blank/resources/images/admin/edit.png" class="edit-img"></a></div>
				</c:forEach>

				<div id="page-area">
				
					<c:if test="${pageVo.startPage != 1}">
						<a href="/blank/admin/member?p=${pageVo.startPage - 1}">&lt;</a>
					</c:if>

					<c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}" >
						<a href="/blank/admin/member?p=${num}">${num}</a>
					</c:forEach>

					<c:if test="${pageVo.endPage != pageVo.maxPage}">
						<a href="/blank/admin/member?p=${pageVo.endPage + 1}">&gt;</a>
					</c:if>

				</div>
    
            </div>

        </div>

    </main>

</div>

</body>
</html>