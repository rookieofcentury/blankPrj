<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="/blank/resources/css/admin/menu.css">
<link rel="stylesheet" href="/blank/resources/css/admin/deProject/check.css">
</head>
<body>

	<div class="detail-board-content">
	
	    <div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
	    
	    <main>
            
	        <div class="detail-board-header">
	            <div>
	                <h1>프로젝트 관리</h1>
	            </div>
	            <div>
	                <h2>신고된 프로젝트</h2>
	            </div>
	        </div>
	        
	        <div class="detail-board">
	            
	            <div class="project-detail-close">
	               	 신고된 프로젝트
	                <img src="../resources/images/admin/close.png">
	            </div>
	            
	            <div class="detail-list">
	    
	                <div class="detail-title">신고 번호</div>
	                <div>1</div>
	                <div>처리상태 접수대기</div>
                    <div>작성일 2022-12-04</div>
	    
	                <div class="detail-title">신고 프로젝트</div>
	                <div>3 (프로젝트 명 : ~)</div>
	                <div></div>
                    <div></div>
	    
	                <div class="detail-title">제목</div>
	                <div>굉장히 불쾌합니다.</div>
	                <div></div>
                    <div></div>
	    
	                <div class="detail-title">내용</div>
	                <div>신고 내용 블라 블라</div>
                    <div></div>
                    <div></div>
	    
	                <div class="detail-title answer-style">처리 내용</div>
	                <div class="answer-style">
	                    <input
	                        type="text"
	                        value="신고가 접수되었습니다."
	                        name="check-answer"
	                    />
	                </div>
	                <div class="answer-style"></div>
                    <div class="answer-style"></div>
	    
	                <div id="check-submit">
	                    <input type="submit" value="접수" class="check-submit-btn"/>
					</div>
	    
	            </div>
	
	        </div>
	
	    </main>
	
	</div>

</body>
</html>