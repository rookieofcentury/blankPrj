<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<link rel="stylesheet" href="/blank/resources/css/admin/notice/detail.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	                <img src="/blank/resources/images/admin/close.png" onclick="goBack();">
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
	                <div>삭제여부&nbsp;&nbsp;${selectNotice.deleteYn}</div>
                    <div>작성일&nbsp;&nbsp;${selectNotice.writeDate}</div>
	    
	                <div class="detail-title">작성자</div>
	                <div>${selectNotice.adminNo}</div>
	                <div><input type="hidden" value="${selectNotice.no}" name="no"></div>
                    <div></div>

	                <div class="detail-title">제목</div>
	                <div>
	                <input type="text" id="title-input" name="title" value="${selectNotice.title}">
	                </div>
	                <div>
	                	<div class="content-style">고정여부&nbsp;&nbsp;${selectNotice.fixeYn}</div>
	                </div>
                    <div></div>
	    
	                <div class="detail-title content-style">내용</div>
	                <div class="content-style">
	                	<input type="text" id="content-input" name="content" value="${selectNotice.content}">
	                </div>
                    <div class="content-style"></div>
                    <div class="content-style"></div>
	    
	                <div id="detail-submit">
	                    <input type="submit" value="수정" id="detail-submit-btn"/>
	                    
			</form>
			
	                	<input type="button" value="삭제" id="delete-notice-btn"/>
	                	
					</div>
	    
	            </div>
	
	        </div>
	
	    </main>
	
	</div>

</body>

<script>
	// 공지사항 삭제
	$('#delete-notice-btn').click(function() {
		Swal.fire({
			title: '해당 공지를 삭제하시겠어요?',
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
			newForm.attr("action","/blank/admin/noticeDelete");
			newForm.append($('<input/>', {type: 'hidden', name: 'no', value:'${selectNotice.no}' }));
			newForm.appendTo('body');
			newForm.submit();
			}
		})
	})
</script>

</html>