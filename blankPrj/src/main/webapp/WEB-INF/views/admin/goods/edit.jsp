<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BLANK ADMIN</title>
<link rel="stylesheet" href="/blank/resources/css/admin/common/menu.css">
<link rel="stylesheet" href="/blank/resources/css/admin/goods/edit.css">
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
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
	                <h1>굿즈 관리</h1>
	            </div>
	        </div>
	        
	        <div class="edit-board">
	            
	            <div class="member-edit-close">
	                굿즈 수정
	                <img src="/blank/resources/images/admin/close.png">
	            </div>
	            
	            <form class="edit-list" action="/blank/admin/goods/edit" method="post" enctype="multipart/form-data">

	                <div class="edit-title">번호</div>
	                <div>
	                    ${vo.no}
						<input type="hidden" name="no" value="${vo.no}">
	                </div>

	                <div class="edit-title">이름</div>
	                <div>
	                    <input type="text" name="name" value="${vo.name}">
	                </div>
	    
	                <div class="edit-title">카테고리</div>
	                <div>
	                    <select name="category" id="goods-category">
							<c:forEach items="${categoryList}" var="item">
								<option value="${item.NO}">${item.NAME}</option>
							</c:forEach>
						</select>
	                </div>
	    
	                <div class="edit-title">가격</div>
	                <div>
	                    <input type="number" name="price" value="${vo.price}"> <span> 원</span>
	                </div>

	                <div class="edit-title">재고</div>
	                <div>
	                    <input type="number" name="stock" value="${vo.stock}"> <span> 개</span>
	                </div>

	                <div class="edit-title none">대표 사진</div>
	                <div class="none">
	                    <input multiple="multiple" type="file" name="thumbnailFile">
					</div>

					<div></div>
					<div class="thumbnail-area">
						<c:forEach items="${vo.thumbnail}" var="item">
							<div class="thumbnail-item"><img src="/blank/resources/upload/goods/${item}"><label class="delete-pic-btn">x</label></div>
						</c:forEach>
					</div>

	    
	                <div class="edit-title">굿즈 소개</div>
	                <div class="editor-area">
	                    <div id="editor"></div>
						<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
						<textarea name="content" id="goods-content"></textarea>
					</div>
	    
	                <div class="edit-title">기획전 부여</div>
	                <div>
	                    <select name="exhibition" id="goods-exhibition">
							<option value="">-- 부여하지 않음 --</option>
							<c:forEach items="${exhibitionList}" var="item">
								<option value="${item.NO}">${item.TITLE}</option>
							</c:forEach>
						</select>
	                </div>
	    
	                <div id="edit-submit">
	                    <input type="submit" value="수정" id="edit-submit-btn">
					</form>
						<input type="button" value="삭제" id="delete-goods-btn">
					</div>

</body>
<script>
	// editor 선언!
	const editor = new toastui.Editor({
		el: document.querySelector('#editor'),
		initialEditType: 'markdown',
		previewStyle: 'vertical',
		width: '95%',
		height: '500px'
	});

	// edit form 넘길 때 content 내용 같이 넘기기
	$('#edit-submit-btn').click(function() {
		var content = editor.getHTML();
		$('#goods-content').val(content);
	})

	$(document).ready(function() {
		// editor에 vo에 있는 content 내용 채우기
		var goodsContent = '${vo.content}';
		editor.setHTML(goodsContent);

		// 현재 DB에 있는 카테고리 조사해서 옵션 몇 개 넣을지 정하기
		var cslength = $('#goods-category option').length;
		var voCategory = '${vo.category}';
		
		// DB의 행 개수만큼 jsp에 옵션 추가해 주기
		for(let i = 0; i < cslength; i++) {
			if(voCategory == $('#goods-category option:eq(' + i + ')').text()) {
				$('#goods-category option:eq(' + i + ')').attr("selected", true);
			}
		}
		
		// 현재 DB에 있는 기획전 조사해서 옵션 몇 개 넣을지 정하기
		var voExhibition = '${vo.exhibition}';
		var cslength = $('#goods-exhibition option').length;

		// DB의 행 개수만큼 jsp에 옵션 추가해 주기
		for(let i = 0; i < cslength; i++) {
			if(voExhibition == $('#goods-exhibition option:eq(' + i + ')').text()) {
				$('#goods-exhibition option:eq(' + i + ')').attr("selected", true);
			}
		}
	})

	// 굿즈 삭제
	$('#delete-goods-btn').click(function() {
		Swal.fire({
			title: '해당 굿즈를 삭제하시겠어요?',
			text: "삭제 후에는 복구할 수 없어요!",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '삭제해 주세요!',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
			var newForm = $('<form></form>');
			//set attribute (form) 
			newForm.attr("method","post");
			newForm.attr("action","/blank/admin/goods/delete");
			// create element & set attribute (input) 
			newForm.append($('<input/>', {type: 'hidden', name: 'goodsNo', value:'${vo.no}' }));
			newForm.appendTo('body');
			// submit form
			newForm.submit();
			}
		})
})

	
</script>
<script src="/blank/resources/js/admin/goods/edit.js"></script>
</html>