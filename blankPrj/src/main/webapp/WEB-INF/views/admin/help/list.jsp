<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헬프센터 관리 | 고객센터</title>
<link rel="stylesheet" href="/blank/resources/css/admin/help/list.css">
</head>
<body>

    <div class="help-board-content">
    
        <div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
        
        <main>
        
            <div class="help-board-header">
                <div>
                    <h1>헬프센터 관리</h1>
                </div>
                <div>
                    <h2>고객센터</h2>
                </div>           
            </div>
            
            <div class="help-board">
    
                <form action="" method="get" id="help-search-form">
                
                    <div class="help-search">
                    
                        <select class="category" name="category">
                            <option value="title">제목</option>
                            <option value="m.nick">작성자</option>
                        </select
                        ><input type="text" name="keyword">
                        <div class="search-icon"><input type="image" src="/blank/resources/images/admin/search.png" alt="search.png"></div>
                    
                    </div>
                    
                </form>
        
                <div class="help-list">
        
                    <div class="help-list-top">전체 문의 ${listCount} 건</div>
        
                    <div>번호</div>
                    <div>제목</div>
                    <div>내용</div>
                    <div>작성자</div>
                    <div>작성 날짜</div>
                    <div>처리 여부</div>
                    <div>수정</div>
            		
            		<c:forEach items="${voList}" var="vo">
	           			<div>${vo.no}</div>
	                    <div>${vo.title}</div>
	                    <div>${vo.content}</div>
	                    <div>${vo.memberNo}</div>
	                    <div>${vo.writeDate}</div>
	                    <div>${vo.status}</div>
	                    <div><a href="/blank/admin/help?no=${vo.no}" name="no"><img src="../resources/images/admin/edit.png"></a></div>
            		</c:forEach>
                    
            		<div id="page-area">
				
						<c:if test="${pageVo.startPage != 1}">
							<a href="/blank/admin/help?p=${pageVo.startPage - 1}">&lt;</a>
						</c:if>
	
						<c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}" >
							<a href="/blank/admin/help?p=${num}">${num}</a>
						</c:forEach>
	
						<c:if test="${pageVo.endPage != pageVo.maxPage}">
							<a href="/blank/admin/help?p=${pageVo.endPage + 1}">&gt;</a>
						</c:if>

					</div>
                    
                </div>
    
            </div>
    
        </main>
    </div>
    
</body>
</html>