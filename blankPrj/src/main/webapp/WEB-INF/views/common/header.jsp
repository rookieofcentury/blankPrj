<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Blank</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="/blank/resources/css/common/header.css">
</head>
<body>

	<div id="header-container">

		<div class="header-home-container">
			<div class="box"></div>
			<div class="box">
				<img class="logo-img" src="/blank/resources/images/blank.png" onclick="location.href=''">
			</div>
			<div class="member-area">
				<div class="flex id-area">로그인 / 회원가입</div>
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
					<a href="">카테고리</a>
				</div>
				<div>
					<a href="">인기</a>
				</div>
				<div>
					<a href="">신규</a>
				</div>
				<div>
					<a href="">마감임박</a>
				</div>
				<div>
					<a href="">공개예정</a>
				</div>
				<div>
					<a href="/blank/goods">굿즈</a>
				</div>
			</div>
		</div>

	</div>

</body>
</html>