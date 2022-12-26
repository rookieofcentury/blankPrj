<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<link rel="stylesheet" href="/blank/resources/css/admin/notice/detail.css">
</head>
<body>

	<div class="detail-board-content">
	
	    <div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
	    
	    <main>
            
	        <div class="detail-board-header">
	            <div>
	                <h1>공지사항 관리</h1>
	            </div>
	            <div>
	                <h2>공지사항</h2>
	            </div>
	        </div>
	        
	        <div class="detail-board">
	            
	            <div class="notice-detail-close">
                	공지사항 수정
	                <img src="../resources/images/admin/close.png" onclick="goBack();">
	            </div>
	            
   	            <script type="text/javascript">
	            	
	            	function goBack(){
	            		window.history.back();
	            	}
	            
	            </script>
	            
            <form action="/blank/admin/noticeDetail" method="post">
   	            <div class="detail-list">
	    
	                <div class="detail-title">번호</div>
	                <div>${selectNotice.no}</div>
	                <div>삭제여부 ${selectNotice.deleteYn}</div>
                    <div>작성일 ${selectNotice.writeDate}</div>
	    
	                <div class="detail-title">작성자</div>
	                <div>${selectNotice.adminNo}</div>
	                <div><input type="hidden" value="${selectNotice.no}" name="no"></div>
                    <div></div>

	                <div class="detail-title">제목</div>
	                <div>
	                <input type="text" id="title-input" name="title" value="${selectNotice.title}">
	                </div>
	                <div>
	                	<label>상단에 표시하기<input type="checkbox" name="fixe" value="${selectNotice.fixeYn}"></label>
	                </div>
                    <div></div>
	    
	                <div class="detail-title content-style">내용</div>
	                <div class="content-style">
	                	<input type="text" id="content-input" name="content" value="${selectNotice.content}">
	                </div>
                    <div class="content-style"></div>
                    <div class="content-style"></div>
	    
	                <div id="detail-submit">
	                	<input type="button" value="삭제" class="detail-delete-btn"/>
	                    <input type="submit" value="수정" class="detail-submit-btn"/>
					</div>
	    
	            </div>
            </form>

	
	        </div>
	
	    </main>
	
	</div>

</body>
</html>