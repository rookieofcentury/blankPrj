<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 정보</title>
<link rel="stylesheet" href="/blank/resources/css/admin/menu.css">
<link rel="stylesheet" href="/blank/resources/css/admin/project/detail.css">
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
	                <h1>프로젝트 관리</h1>
	            </div>
	            <div>
	                <h2>프로젝트</h2>
	            </div>
	        </div>
	        
	        <div class="detail-board">
	            
	            <div class="member-detail-close">
	                                프로젝트 정보
	                <img src="/blank/resources/images/admin/close.png" onclick="goBack();">
	            </div>
	            
   	            <script type="text/javascript">
	            	
	            	function goBack(){
	            		window.history.back();
	            	}
	            
	            </script>
	            
	           <form action="" method="get">
	           		<div class="detail-list">
		    
		                <div class="detail-title">프로젝트 번호</div>
		                <div>${selectProject.no}</div>
		                <div>진행상태&nbsp;&nbsp;${selectProject.status}</div>
		                <div></div>
		    
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
		                <div class="detail-content-style summary">
							${selectProject.summary} 
		                </div>
		    
		                <div class="detail-title story-title">프로젝트 스토리</div>
		                <div class="detail-content-style story">${selectProject.no}</div>
		    
		                <div id="detail-submit">
		                    <input type="submit" value="승인" id="detail-submit-ok-btn"/>
						</form>
		                    <input type="button" value="반려" id="detail-submit-no-btn"/>
						</div>
		    
		            </div>
	            
	
	        </div>
	
	    </main>
	
	</div>

</body>

<script>
	// 프로젝트 반려
	$('#detail-submit-no-btn').click(function() {
		Swal.fire({
			title: '프로젝트를 반려하시겠어요?',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '반려',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
			var newForm = $('<form></form>');
			newForm.attr("method","post");
			newForm.attr("action","/blank/admin/projectCancel");
			newForm.append($('<input/>', {type: 'hidden', name: 'no', value:'${selectProject.no}' }));
			newForm.appendTo('body');
			newForm.submit();
			}
		})
	})
</script>

</html>