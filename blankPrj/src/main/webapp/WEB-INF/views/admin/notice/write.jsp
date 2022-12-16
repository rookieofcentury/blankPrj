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
	                <div>[이용 안내] 시스템 점검 일정 안내</div>
	                <div>
                        <label>상단에 표시하기<input type="checkbox" name="fixe" value="ok"></label>
                    </div>
                    <div></div>
	    
	                <div class="write-title content-style">내용</div>
	                <div class="content-style">안녕하세요. 블랭크 입니다.언제나 블랭크를 이용해 주셔서 감사드립니다.

                        시스템 점검 일정 안내드립니다.
                        점검 중인 은행/증권사의 일부 결제 서비스가 일시 중지됩니다.
                        
                        ■ 서비스 중단 사유: 각 은행/증권사 시스템 작업
                        ■ 서비스 중단 영향: 점검 중인 네이버페이 은행/증권사의 계좌 간편결제 승인/취소, 계좌를 통한 네이버페이 포인트 충전 중단
                        
                        은행일자시작시간종료시간토스뱅크2022-11-0204:0004:30기업은행2022-11-0700:0009:00SC제일은행2022-11-0900:0002:00경남은행2022-11-1200:0007:00우리은행2022-11-1302:0006:00광주은행2022-11-1302:0006:00​KDB산업은행2022-11-1300:0004:00국민은행2022-11-2000:0006:00농협은행2022-11-2100:0004:00
                        
                        ※ 안내드린 은행/증권사만 중단이 되며 네이버페이 서비스는 정상적으로 운영됩니다.​※ 서비스 재개는 시스템 점검 상황에 따라 변경될 수 있습니다.
                        
                        이용에 참고 부탁드립니다.
                        감사합니다.
                        </div>
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