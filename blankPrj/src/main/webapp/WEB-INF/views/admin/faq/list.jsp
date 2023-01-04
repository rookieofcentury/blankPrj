<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헬프센터 관리 | 자주 묻는 질문(FAQ)</title>
<link rel="stylesheet" href="/blank/resources/css/admin/faq/list.css">
</head>
<body>

    <div class="faq-board-content">
    
        <div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
        
        <main>
        
                <div class="faq-board-header">
                    <div>
                        <h1>헬프센터 관리</h1>
                    </div>
                    <div>
                        <h2>자주 묻는 질문(FAQ)</h2>
                    </div>           
                </div>
                
                <div class="faq-board">
        
                    <form action="" method="get" id="faq-search-form">
        
                        <div class="faq-search">
        
                            <select class="category" name="category">
                                <option value="title">제목</option>
                                <option value="a.id">작성자</option>
                            </select
                            ><input type="text" name="keyword">
                            <div class="search-icon"><input type="image" src="../resources/images/admin/search.png" alt="search.png"></div>
                            <a href="/blank/admin/faqWrite"><button type="button">작성</button></a>
                            
                        </div>
        
        
                    </form>
            
                    <div class="faq-list">
            
                        <div class="faq-list-top">전체 FAQ <a id="listCount">${listCount}</a> 개</div>
            
                        <div>번호</div>
                        <div>제목</div>
                        <div>카테고리</div>
                        <div>내용</div>
                        <div>작성자</div>
                        <div>작성날짜</div>
                        <div>수정</div>
                
                		<c:forEach items="${voList}" var="vo">
	                        <div>${vo.no}</div>
	                        <div>${vo.title}</div>
	                        <div>${vo.category}</div>
	                        <div>${vo.content}</div>
	                        <div>${vo.adminNo}</div>
	                        <div>${vo.writeDate}</div>
	                        <div><a href="/blank/admin/faqDetail?no=${vo.no}" name="no"><img src="/blank/resources/images/admin/edit.png" class="edit-img"></a></div>
                		</c:forEach>

						<div id="page-area">
						
							<c:if test="${pageVo.startPage != 1}">
								<a href="/blank/admin/faq?p=${pageVo.startPage - 1}">&lt;</a>
							</c:if>
		
							<c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}" >
								<a href="/blank/admin/faq?p=${num}">${num}</a>
							</c:forEach>
		
							<c:if test="${pageVo.endPage != pageVo.maxPage}">
								<a href="/blank/admin/faq?p=${pageVo.endPage + 1}">&gt;</a>
							</c:if>
		
						</div>
            
                    </div>
        
                </div>
    
        </main>
    
    </div>
    
</body>
</html>