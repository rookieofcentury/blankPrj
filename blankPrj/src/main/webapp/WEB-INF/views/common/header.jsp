<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Blank</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="/blank/resources/css/common/header.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

	<div id="header-container">

		<div class="header-home-container">
			<div class="box"></div>
			<div class="box">
				<img class="logo-img" src="/blank/resources/images/blank.png" onclick="location.href='/blank'">
			</div>
			<div class="member-area">
				<c:if test="${loginMember != null}">
					<div onclick="location.href='/blank/project/agree'">프로젝트 올리기</div>
					<div id="mypage-btn" onclick="location.href='/blank/member/mypage/editprofile'">마이페이지</div>
				</c:if>
				<c:if test="${loginMember == null}">
					<div class="flex id-area" onclick="location.href='/blank/member/login'">로그인</div>
				</c:if>
				<div class="search-area">
					<form action="/app/search" method="get">
						<div class="flex search-box">
							<input type="text" class="input-hidden" name="searchPrj"
								placeholder="검색어를 입력해 주세요.">
							<button class="material-symbols-outlined">search</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="header-menu-container">
			<div class="menu-area">
				<div>
					<a href=""><span>카테고리</span></a>
				</div>
				<div>
					<a href=""><span>인기</span></a>
				</div>
				<div>
					<a href=""><span>신규</span></a>
				</div>
				<div>
					<a href=""><span>마감임박</span></a>
				</div>
				<div>
					<a href=""><span>공개예정</span></a>
				</div>
				<div>
					<a href="/blank/goods"><span>굿즈</span></a>
				</div>
			</div>
		</div>

	</div>

</body>
<script src="/blank/resources/js/common/header.js"></script>
</html>