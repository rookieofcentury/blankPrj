<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챗봇 관리</title>
<link rel="stylesheet" href="/blank/resources/css/admin/chatbot/list.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

	<div class="quit-board-content">

		<div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
		
		<div id="quit-content">

			<div class="quit-board-header">
				<div>
					<h1>챗봇 관리</h1>
				</div>
				<div>
					<h2>Q&A 목록</h2>
				</div>
			</div>

			<div class="quit-board-middle">

				
				<div class="quit-board-items">
					
						<div></div><a href="/blank/admin/chatbotWrite"><button type='button' id="insert-btn">등록</button></a>

						<div class="quit-items">
							<div class="quit-title">번호</div>
							<div class="quit-title">관리자</div>
							<div class="quit-title">질문</div>
							<div class="quit-title">답변</div>
							<div class="quit-title"></div>
						</div>

						<c:forEach items="${voList}" var="vo">
						
							<div class="quit-content">
								<div name="no">
									${vo.no}
									<input type="hidden" name="no" value="${vo.no}">
								</div>
								<div name="adminNo">${vo.adminNo}</div>
								<div name="fixQ">${vo.fixQ}</div>
								<div name="fixA">${vo.fixA}</div>
								<div><input type="button" value="삭제" id="delete-quit-btn" onclick="quitDelete(${vo.no});"/></div>
							</div>
							
						</c:forEach>
						
				</div>

			</div>

		</div>

	</div>

</body>

<script>
	// 탈퇴 질문 삭제
	function quitDelete(voNo) {
		console.log(voNo);

		Swal.fire({
			title: '해당 질문을 삭제하시겠어요?',
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
			newForm.attr("action","/blank/admin/chatbotDelete");
			newForm.append($('<input/>', {type:'hidden', name:'no', value:voNo}));
			newForm.appendTo('body');
			newForm.submit();
			}
		})
	}
	
</script>

</html>