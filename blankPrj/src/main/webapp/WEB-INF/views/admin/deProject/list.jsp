<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고된 프로젝트</title>
<link rel="stylesheet" href="/blank/resources/css/admin/deProject/list.css">
</head>
<body>

<div class="project-board-content">
    
    <div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
    
    <main>
    
        <div class="project-board-header">
            <div>
                <h1>프로젝트 관리</h1>
            </div>
            <div>
                <h2>신고된 프로젝트</h2>
            </div>           
        </div>
        
        <div class="project-board">

            <form action="" method="get" id="project-search-form">
            
                <div class="project-search">
                
                    <select class="category" name="category">
                        <option value="title">제목</option>
                        <option value="m.nick">작성자</option>
                    </select
                    ><input type="text" name="keyword">
                    <div class="search-icon"><input type="image" src="/blank/resources/images/admin/search.png" alt="search.png"></div>
                
                </div>
                
            </form>
    
            <div class="project-list">
    
                <div class="project-list-top">전체 신고 프로젝트 ${listCount} 개</div>
    
                <div>번호</div>
                <div>작성자</div>
                <div>제목</div>
                <div>내용</div>
                <div>신고 프로젝트 번호</div>
                <div>신고 일자</div>
                <div>처리 상태</div>
                <div>확인</div>
        
       			<c:forEach items="${voList}" var="vo">
	                <div>${vo.no}</div>
	                <div>${vo.reporter}</div>
	                <div>${vo.title}</div>
	                <div>${vo.content}</div>
	                <div>${vo.prj}</div>
	                <div>${vo.enrollDate}</div>
	                <c:if test="${vo.status eq 'Y'}">
	                <div>접수 완료</div>
	                </c:if>
	                <c:if test="${vo.status eq 'N'}">
	                <div id="waiting">접수 대기</div>
	                </c:if>
	                <div><a href="/blank/admin/reportCheck?no=${vo.no}&prj=${vo.prj}" name="no"><img src="/blank/resources/images/admin/edit.png" class="edit-img"></a></div>
       			</c:forEach>

				<div id="page-area">
				
					<c:if test="${pageVo.startPage != 1}">
						<a href="/blank/admin/deProject?p=${pageVo.startPage - 1}">&lt;</a>
					</c:if>

					<c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}" >
						<a href="/blank/admin/deProject?p=${num}">${num}</a>
					</c:forEach>

					<c:if test="${pageVo.endPage != pageVo.maxPage}">
						<a href="/blank/admin/deProject?p=${pageVo.endPage + 1}">&gt;</a>
					</c:if>

				</div>
    			
            </div>

        </div>

    </main>
</div>
    
</body>
</html>