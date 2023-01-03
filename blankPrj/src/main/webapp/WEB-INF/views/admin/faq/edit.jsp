<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문(FAQ) 상세조회</title>
<link rel="stylesheet" href="/blank/resources/css/admin/faq/edit.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

	<div class="edit-board-content">
	
	    <div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
	    
	    <main>
            
	        <div class="edit-board-header">
	            <div>
	                <h1>헬프센터 관리</h1>
	            </div>
	            <div>
	                <h2>자주 묻는 질문(FAQ)</h2>
	            </div>
	        </div>
	        
	        <div class="edit-board">
	            
	            <div class="faq-edit-close">
	                	자주 묻는 질문(FAQ)
	                <img src="/blank/resources/images/admin/close.png" onclick="goBack();">
	            </div>
	            
	            <form action="/blank/admin/faqEdit" method="post">
	            
					<div class="edit-list">
		    
		                <div class="edit-title">번호</div>
		                <div>${selectFaq.no}</div>
		                <div>삭제여부 ${selectFaq.deleteYn}</div>
	                    <div>작성일 ${selectFaq.writeDate}</div>
		    
		                <div class="edit-title">작성자</div>
		                <div>${selectFaq.adminNo}</div>
		                <div><input type="hidden" value="${selectFaq.no}" name="no"></div>
	                    <div></div>
		    
		                <div class="edit-title">제목</div>
		                <div>
							<input
	                        type="text"
	                        value="${selectFaq.title}"
	                        name="title"
	                    	/>
		                </div>
		                <div></div>
	                    <div></div>
		    
						<div class="edit-title">카테고리</div>
						<div>
							<select class="category" name="category" value="${selectFaq.category}">
								<option value="1">회원</option>
								<option value="2">결제</option>
								<option value="3">배송</option>
								<option value="4">기타</option>
							</select>
						</div>
						<div></div>
						<div></div>
	
		                <div class="edit-title content-style">내용</div>
						<div class="content-style">
							<input
	                        type="text"
	                        value="${selectFaq.content}"
	                        name="content"
	                    	/>
		                </div>
	                    <div class="content-style"></div>
	                    <div class="content-style"></div>
		    
		                <div id="edit-submit">
		                    <input type="submit" value="수정" id="edit-submit-btn"/>
		                    
	            </form>
		                    <input type="button" value="삭제" id="delete-faq-btn"/>
		                    
						</div>
		    
		            </div>
		            

	
	        </div>
	
	    </main>
	
	</div>
    
</body>
<script>

	//창 닫기
	function goBack(){
		window.history.back();
	}

	// FAQ 삭제
	$('#delete-faq-btn').click(function() {
		Swal.fire({
			title: '해당 FAQ를 삭제하시겠어요?',
			text: "삭제 후에는 복구할 수 없어요!",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '삭제',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
			var newForm = $('<form></form>');
			newForm.attr("method","post");
			newForm.attr("action","/blank/admin/faqDelete");
			newForm.append($('<input/>', {type: 'hidden', name: 'no', value:'${selectFaq.no}' }));
			newForm.appendTo('body');
			newForm.submit();
			}
		})
	})
</script>
</html>