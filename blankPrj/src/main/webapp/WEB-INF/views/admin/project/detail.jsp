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
	                <img src="/blank/resources/images/admin/close.png">
	            </div>
	            
	           <form action="" method="get">
	           		<div class="detail-list">
		    
		                <div class="detail-title">프로젝트 번호</div>
		                <div>${selectProject.no}</div>
		                <div>진행상태 ${selectProject.status}</div>
		                <div>작성일 ${selectProject.no}</div>
		    
		                <div class="detail-title">제목</div>
		                <div class="detail-content-style">
		                	${selectProject.title}
		                </div>
		                <div></div>
		                <div></div>
		    
		                <div class="detail-title">카테고리</div>
		                <div class="detail-content-style">${selectProject.category}</div>
		                <div></div>
		                <div></div>
		    
		                <div class="detail-title">대표이미지</div>
		                <div class="detail-content-style">${selectProject.no}</div>
		                <div></div>
		                <div></div>
		    
		                <div class="detail-title">목표금액</div>
		                <div class="detail-content-style">${selectProject.price}</div>
		                <div></div>
		                <div></div>
		    
		                <div class="detail-title">펀딩일정</div>
		                <div class="detail-content-style">${selectProject.startDate} ${selectProject.time} ~ ${selectProject.endDate}</div>
		                <div></div>
		                <div></div>
		    
		                <div class="detail-title">페이지 주소</div>
		                <div class="detail-content-style">${selectProject.url}</div>
		                <div></div>
		                <div></div>
		    
		                <div class="detail-title">프로젝트 요약</div>
		                <div class="detail-content-style">
							${selectProject.summary} 
		                </div>
		                <div></div>
		                <div></div>
		    
		                <div class="detail-title">프로젝트 스토리</div>
		                <div class="detail-content-style">${selectProject.no}</div>
		                <div></div>
		                <div></div>
		    
		                <div id="detail-submit">
		                    <input type="submit" value="반려" class="detail-submit-no-btn"/>
		                    <input type="submit" value="승인" class="detail-submit-ok-btn"/>
						</div>
		    
		            </div>
	           </form>
	            
	
	        </div>
	
	    </main>
	
	</div>

</body>
</html>