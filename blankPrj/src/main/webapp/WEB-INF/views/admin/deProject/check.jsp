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
	                <img src="/blank/resources/images/admin/close.png" onclick="goBack();">
	            </div>
	            
            	<script type="text/javascript">
	            	
	            	function goBack(){
	            		window.history.back();
	            	}
	            
	            </script>
	            <form action="/blank/admin/reportCheck" method="post">
					<div class="detail-list">
		    
		                <div class="detail-title">신고 번호</div>
		                <div>${selectReport.no}</div>
		                <div>처리상태&nbsp;&nbsp;${selectReport.status}</div>
	                    <div>작성일&nbsp;&nbsp;${selectReport.enrollDate}</div>
		    
		                <div class="detail-title">신고 프로젝트</div>
		                <div>${reportVo.prj} (프로젝트 명: ${selectReport.prj})</div>
		                <div><input type="hidden" name="no" value="${selectReport.no}"></div>
	                    <div></div>
		    
		                <div class="detail-title">제목</div>
		                <div>${selectReport.title}</div>
		                <div></div>
	                    <div></div>
		    
		                <div class="detail-title">내용</div>
		                <div>${selectReport.content}</div>
	                    <div></div>
	                    <div></div>
		    
		                <div class="detail-title answer-style">처리 내용</div>
		                <div class="answer-style">
		                    <input
		                        type="text"
		                        name="adComment"
		                        value="${selectReport.adComment}"
		                        placeholder="이곳에 내용을 작성하세요."
		                    />
		                </div>
		                <div class="answer-style"></div>
	                    <div class="answer-style"></div>
		    
		                <div id="check-submit">
		                    <input type="submit" value="접수" class="check-submit-btn"/>
						</div>
		    
		            </div>
	            </form>

	
	        </div>
	
	    </main>
	
	</div>

</body>
</html>