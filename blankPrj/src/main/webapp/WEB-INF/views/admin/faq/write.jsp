<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문(FAQ) 답변</title>
<link rel="stylesheet" href="/blank/resources/css/admin/faq/write.css">
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
	                <h2>자주 묻는 질문(FAQ)</h2>
	            </div>
	        </div>
	        
	        <div class="write-board">
	            
	            <div class="faq-write-close">
	                자주 묻는 질문(FAQ)
	                <img src="../resources/images/admin/close.png">
	            </div>
	            
	            <div class="write-list">
	    
	                <div class="write-title">번호</div>
	                <div>1</div>
	                <div>삭제여부 N</div>
                    <div>작성일 2022-12-04</div>
	    
	                <div class="write-title">작성자</div>
	                <div>admin01</div>
	                <div></div>
                    <div></div>
	    
	                <div class="write-title">제목</div>
	                <div>[FAQ] 블랭크(Blank)는 무엇인가요?</div>
	                <div></div>
                    <div></div>
	    
	                <div class="write-title content-style">내용</div>
	                <div class="content-style">안녕하세요. 블랭크 입니다.
                        블랭크(Blank)는 영어로는 빈 공간이라는 뜻으로 독일어로는 “빛나다”라는 뜻을 가지고 있습니다.
                        저희는 아무것도 없는 빈 공간을 빛나는 펀딩으로 채운다는 뜻을 가진 펀딩 사이드 입니다.
                        </div>
                    <div class="content-style"></div>
                    <div class="content-style"></div>
	    
	                <div id="write-submit">
	                    <input type="submit" value="등록" class="write-submit-btn"/>
					</div>
	    
	            </div>
	
	        </div>
	
	    </main>
	
	</div>
    
</body>
</html>