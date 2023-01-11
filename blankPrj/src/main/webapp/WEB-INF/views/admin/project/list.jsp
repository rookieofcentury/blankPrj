<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트</title>
<link rel="stylesheet" href="/blank/resources/css/admin/project/list.css">
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
                <h2>프로젝트</h2>
            </div>           
        </div>
        
        <div class="project-board">

            <form action="" method="get" id="project-search-form">
            
                <div class="project-search">
                
                    <select class="category" name="category">
                        <option value="title">제목</option>
                        <option value="m.nick">창작자</option>
                    </select
                    ><input type="text" name="keyword">
                    <div class="search-icon"><input type="image" src="/blank/resources/images/admin/search.png" alt="search.png"></div>
               
                </div>
                
            </form>
    
            <div class="project-list">
    
                <div class="project-list-top">전체 프로젝트 <a id="listCount">${listCount}</a> 개</div>
    
                <div>번호</div>
                <div>창작자</div>
                <div>제목</div>
                <div>카테고리</div>
                <div>목표 금액</div>
                <div>펀딩일정</div>
                <div>진행 상태</div>
                <div>수정</div>
        		
        		<c:forEach items="${voList}" var="vo">
	                <div>${vo.no}</div>
	                <div>${vo.creator}</div>
					<c:if test="${fn:length(vo.title) ge 25}">
						<div>${fn:substring(vo.title, 0, 25)}...</div>
					</c:if>
					<c:if test="${fn:length(vo.title) lt 25}">
						<div>${vo.title}</div>
					</c:if>
	                <div>${vo.category}</div>
	                <div>${vo.price}</div>
	                <div>${vo.startDate} ~ ${vo.endDate}</div>
	                <c:if test="${vo.status eq '작성중'}">
	                <div>작성 중</div>
	                </c:if>
	                <c:if test="${vo.status eq '심사중'}">
	                <div id="project-waiting">승인 대기</div>
	                </c:if>
	                <c:if test="${vo.status eq '승인됨'}">
	                <div>승인</div>
	                </c:if>
	                <c:if test="${vo.status eq '반려됨'}">
	                <div id="project-cancel">반려</div>
	                </c:if>
	                <c:if test="${vo.status eq '진행중'}">
	                <div>진행 중</div>
	                </c:if>
	                <c:if test="${vo.status eq '종료'}">
	                <div>종료</div>
	                </c:if>
	                <div><a href="/blank/admin/prjDetail?no=${vo.no}" name="no"><img src="/blank/resources/images/admin/edit.png" class="edit-img"></a></div>
        		</c:forEach>

				<div id="page-area">
				
					<c:if test="${pageVo.startPage != 1}">
						<a href="/blank/admin/project?p=${pageVo.startPage - 1}">&lt;</a>
					</c:if>

					<c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}" >
						<a href="/blank/admin/project?p=${num}">${num}</a>
					</c:forEach>

					<c:if test="${pageVo.endPage != pageVo.maxPage}">
						<a href="/blank/admin/project?p=${pageVo.endPage + 1}">&gt;</a>
					</c:if>

				</div>
    
            </div>

        </div>

    </main>
</div>
    
</body>
</html>