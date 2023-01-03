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
	                <img src="/blank/resources/images/admin/close.png" onclick="goBack();">
	            </div>
	            
   	            <script type="text/javascript">
	            	
	            	function goBack(){
	            		window.history.back();
	            	}
	            
	            </script>
	            
			<form action="/blank/admin/faqWrite" method="post">
			
				<div class="write-list">
	    
	                <div class="write-title">번호</div>
	                <div>${listCount + 1}</div>
	                <div></div>
                    <div></div>
	    
	                <div class="write-title">작성자</div>
	                <div>${loginAdmin.adminId}</div>
	                <div><input type="hidden" name="adminNo" value="${loginAdmin.no}"></div>
                    <div></div>
	    
	                <div class="write-title">제목</div>
	                <div>
						<input type="text" id="title-input" name="title" placeholder="이곳에 제목을 작성하세요.">
					</div>
	                <div></div>
                    <div></div>
	    
					<div class="write-title">카테고리</div>
					<div>
						<select class="category" name="category">
							<option value="1">회원</option>
							<option value="2">결제</option>
							<option value="3">배송</option>
							<option value="4">기타</option>
						</select>
					</div>
					<div></div>
					<div></div>

	                <div class="write-title content-style">내용</div>
	                <div class="content-style">
						<input
							type="text"
							id="content-input"
							name="content"
							placeholder="이곳에 내용을 작성하세요.">
                    </div>
                    <div class="content-style"></div>
                    <div class="content-style"></div>
	    
	                <div id="write-submit">
	                    <input type="submit" value="등록" class="write-submit-btn"/>
					</div>
	    
	            </div>
	            
			</form>
	            
	
	        </div>
	
	    </main>
	
	</div>
    
</body>
</html>