<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	                <img src="../resources/images/admin/close.png">
	            </div>
	            
	            <div class="write-list">
	    
	                <div class="write-title">번호</div>
	                <div>1</div>
	                <div>진행상태 답변대기</div>
                    <div>작성일 2022-12-04</div>
	    
	                <div class="write-title">제목</div>
	                <div>문의합니다.</div>
	                <div></div>
                    <div></div>

	                <div class="write-title content-style">작성자</div>
	                <div class="content-style">user01</div>
	                <div class="content-style"></div>
                    <div class="content-style"></div>
	    
	                <div class="write-title">내용</div>
	                <div>그 어쩌구는 어디에 있나요?</div>
                    <div></div>
                    <div></div>
	    
                    <div class="write-title content-style">처리자</div>
                    <div class="content-style">admin01</div>
                    <div class="content-style"></div>
                    <div class="content-style"></div>

                    <div class="write-title content-style">답변 내용</div>
	                <div class="content-style">안녕하세요. 블랭크 입니다.

                        문의 주신 어쩌구 저쩌구 관련된 사항은 쩌기에 가 보시면 확인할 수 있습니다.
                        
                        감사합니다.</div>
                    <div class="content-style"></div>
                    <div class="content-style"></div>

	                <div id="write-submit">
	                    <input type="submit" value="작성" class="write-submit-btn"/>
					</div>
	    
	            </div>
	
	        </div>
	
	    </main>
	
	</div>

</body>
</html>