<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
<link rel="stylesheet" href="/blank/resources/css/admin/notice/write.css">
</head>
<body>

	<div class="write-board-content">
	
	    <div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
	    
	    <main>
            
	        <div class="write-board-header">
	            <div>
	                <h1>공지사항 관리</h1>
	            </div>
	            <div>
	                <h2>공지사항</h2>
	            </div>
	        </div>
	        
	        <div class="write-board">
	            
	            <div class="notice-write-close">
                	공지사항
	                <img src="../resources/images/admin/close.png">
	            </div>
            <form action="/blank/admin/noticeWrite" method="post">
   	            <div class="write-list">
	    
	                <div class="write-title">번호</div>
	                <div>${notice.no + 1}</div>
	                <div>삭제여부 N</div>
                    <div>작성일 2022-12-04</div>
	    
	                <div class="write-title">작성자</div>
	                <div>${loginAdmin.adminId}</div>
	                <div></div>
                    <div></div>

	                <div class="write-title">제목</div>
	                <div>
	                	<input type="text" id="title-input" name="title">
	                </div>
	                <div>
                        <label>상단에 표시하기<input type="checkbox" name="fixe" value="ok"></label>
                    </div>
                    <div></div>
	    
	                <div class="write-title content-style">내용</div>
	                <div class="content-style">
	                	<input type="text" id="content-input" name="content">
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