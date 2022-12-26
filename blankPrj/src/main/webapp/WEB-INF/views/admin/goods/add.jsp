<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BLANK ADMIN</title>
<link rel="stylesheet" href="/blank/resources/css/admin/common/menu.css">
<link rel="stylesheet" href="/blank/resources/css/admin/goods/add.css">
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>
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
	                굿즈 등록
	                <img src="/blank/resources/images/admin/close.png">
	            </div>
	            
	            <form class="edit-list" action="/blank/admin/goods/add" method="post" enctype="multipart/form-data">

	                <div class="edit-title">이름</div>
	                <div>
	                    <input type="text" name="name" required>
	                </div>
	    
	                <div class="edit-title">카테고리</div>
	                <div>
	                    <select name="category" id="goods-category" varStatus="i">
							<c:forEach items="${categoryList}" var="item">
								<option value="${item.NO}">${item.NAME}</option>
							</c:forEach>
						</select>
	                </div>
	    
	                <div class="edit-title">가격</div>
	                <div>
	                    <input type="number" name="price" required> <span> 원</span>
	                </div>

	                <div class="edit-title">재고</div>
	                <div>
	                    <input type="number" name="stock" required> <span> 개</span>
	                </div>

	                <div class="edit-title">대표 사진</div>
	                <div>
	                    <input multiple="multiple" type="file" name="thumbnailFile" required>
					</div>
	    
	                <div class="edit-title">굿즈 소개</div>
	                <div class="editor-area">
	                    <div id="editor"></div>
						<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
						<textarea name="content" id="goods-content" required></textarea>
					</div>
	    
	                <div class="edit-title">기획전 부여</div>
	                <div>
	                    <select name="exhibition" id="goods-exhibition">
							<option value="" selected>-- 부여하지 않음 --</option>
							<c:forEach items="${exhibitionList}" var="item">
								<option value="${item.NO}">${item.TITLE}</option>
							</c:forEach>
						</select>
	                </div>
	    
	                <div id="edit-submit">
	                    <input type="submit" value="등록" id="edit-submit-btn"/>
					</div>
				</form>
</body>
<script src="/blank/resources/js/admin/goods/add.js"></script>
</html>