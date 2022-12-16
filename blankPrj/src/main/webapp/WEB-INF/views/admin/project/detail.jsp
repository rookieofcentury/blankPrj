<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 정보</title>
<link rel="stylesheet" href="/blank/resources/css/admin/menu.css">
<link rel="stylesheet" href="/blank/resources/css/admin/project/detail.css">
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
	                <h2>프로젝트</h2>
	            </div>
	        </div>
	        
	        <div class="detail-board">
	            
	            <div class="member-detail-close">
	                                프로젝트 정보
	                <img src="../resources/images/admin/close.png">
	            </div>
	            
	            <div class="detail-list">
	    
	                <div class="detail-title">프로젝트 번호</div>
	                <div>1</div>
	                <div></div>
	    
	                <div class="detail-title">제목</div>
	                <div class="detail-content-style">
	                	노력은 누구나 하잖아요? 혼을 갈아 넣은 업그레이드 프리미엄 안경
	                </div>
	                <div></div>
	    
	                <div class="detail-title">카테고리</div>
	                <div class="detail-content-style">패션/잡화</div>
	                <div></div>
	    
	                <div class="detail-title">대표이미지</div>
	                <div class="detail-content-style">image.jpg</div>
	                <div></div>
	    
	                <div class="detail-title">목표금액</div>
	                <div class="detail-content-style">500,000원</div>
	                <div></div>
	    
	                <div class="detail-title">펀딩일정</div>
	                <div class="detail-content-style">2022-11-24 ~ 2022-12-15</div>
	                <div></div>
	    
	                <div class="detail-title">페이지 주소</div>
	                <div class="detail-content-style">www.blank.com/og=glasses</div>
	                <div></div>
	    
	                <div class="detail-title">프로젝트 요약</div>
	                <div class="detail-content-style">
						누적 펀딩률 8,988%, 평점 4.5점! 
	                </div>
	                <div></div>
	    
	                <div class="detail-title">프로젝트 스토리</div>
	                <div class="detail-content-style">제대로된 설계. 좋은 소재와 합리적인 가격 모두를 만족하는 안경은 없을까?</div>
	                <div></div>
	    
	                <div id="detail-submit">
	                    <input type="submit" value="반려" class="detail-submit-no-btn"/>
	                    <input type="submit" value="승인" class="detail-submit-ok-btn"/>
					</div>
	    
	            </div>
	
	        </div>
	
	    </main>
	
	</div>

</body>
</html>