<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 문의</title>
<link rel="stylesheet" href="/blank/resources/css/admin/help/write.css">
</head>
<body>

	<div class="write-board-content">
	
	    <div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
	    
	    <main>
            
	        <div class="write-board-header">
	            <div>
	                <h1>헬프센터 관리</h1>
	            </div>
	            <div>
	                <h2>고객센터</h2>
	            </div>
	        </div>
	        
	        <div class="write-board">
	            
	            <div class="help-write-close">
	                	고객센터 문의
	                <img src="/blank/resources/images/admin/close.png" onclick="goBack();">
	            </div>
	            
               	<script type="text/javascript">
	            	
	            	function goBack(){
	            		window.history.back();
	            	}
	            
	            </script>
	            
	            <form action="/blank/admin/helpCheck" method="post">
	            
		            <div class="write-list">
		    
		                <div class="write-title">번호</div>
		                <div>${selectHelp.no}</div>
		                <div>진행상태 ${selectHelp.status}</div>
	                    <div>작성일 ${selectHelp.writeDate}</div>
		    
		                <div class="write-title">제목</div>
		                <div>${selectHelp.title}</div>
		                <div><input type="hidden" name="no" value="${selectHelp.no}"></div>
	                    <div><input type="hidden" name="adminNo" value="${loginAdmin.no}"></div>
	
		                <div class="write-title content-style">작성자</div>
		                <div class="content-style">${selectHelp.memberNo}</div>
		                <div class="content-style"></div>
	                    <div class="content-style"></div>
		    
		                <div class="write-title">내용</div>
		                <div>${selectHelp.content}</div>
	                    <div></div>
	                    <div></div>
		    
	                    <div class="write-title content-style">처리자</div>
	                    <c:if test="${selectHelp.adComment == null}">
		                <div class="content-style">${loginAdmin.adminId}</div>
		                </c:if>
		                <c:if test="${selectHelp.adComment != null}">
		                <div class="content-style">${selectHelp.adminNo}</div>
		                </c:if>
	                    <div class="content-style"></div>
	                    <div class="content-style"></div>
	
	                    <div class="write-title content-style">답변 내용</div>
		                <div class="content-style">
		                	<input
								type="text"
								id="answer-content-input"
								name="adComment"
								value="${selectHelp.adComment}"
								placeholder="이곳에 내용을 작성하세요.">
		                </div>
	                    <div class="content-style"></div>
	                    <div class="content-style"></div>
	
		                <div id="write-submit">
		                    <input type="submit" value="작성" class="write-submit-btn"/>
						</div>
		    
		            </div>
	            
	            </form>
	            
	
	        </div>
	
	    </main>
	
	</div>

</body>
</html>