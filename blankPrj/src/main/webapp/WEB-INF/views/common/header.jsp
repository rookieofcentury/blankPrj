<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Blank</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://kit.fontawesome.com/77ad8525ff.js"></script>
<link rel="stylesheet" href="/blank/resources/css/common/header.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

	<div id="header-container">

		<div class="header-home-container">
			<div class="box prj-area">
				<c:if test="${loginMember != NULL}">
					<div class="projectUp afterLogin flex" onclick="location.href='/blank/project/agree'">프로젝트 올리기</div>
					<div class="projectUp afterLogin flex" onclick="location.href='/blank/project/created'">내 프로젝트</div>
				</c:if>
			</div>
			<div class="box">
				<img class="logo-img" src="/blank/resources/images/blank.png" onclick="location.href='/blank'">
			</div>
			<div class="member-area">
			
			    <c:if test="${loginMember.no == 0}">
	               <div class="mypage-area">
	                  <div class="mypage-btn afterLogin flex" onclick="location.href='/blank/chat/list'">고객의 소리</div>
	                  <div class="logout-btn afterLogin flex" onclick="location.href='/blank/member/logout'"><span class="material-symbols-outlined">logout</span></div>
	               </div>
	            </c:if>
			
				<c:if test="${loginMember != NULL && loginMember.no != 0}">
					<div class="mypage-area">
						<div class="mypage-btn afterLogin flex" onclick="location.href='/blank/member/mypage/editprofile'">마이페이지</div>
						<div class="logout-btn afterLogin flex" onclick="location.href='/blank/member/logout'"><span class="material-symbols-outlined">logout</span></div>
					</div>
				</c:if>

				<c:if test="${loginMember == NULL}">
					<div class="flex id-area" onclick="location.href='/blank/member/login'"><span class="material-symbols-outlined">account_circle</span>로그인</div>
				</c:if>
				<div class="search-area">
					<form action="/blank/project/search" method="get" onsubmit="return checkKeyword();">
						<div class="flex search-box">
							<input type="text" class="input-hidden" name="keyword" placeholder="검색어를 입력해 주세요.">
							<button class="material-symbols-outlined">search</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="header-menu-container">
			<div class="menu-area">
				<div class="menu-category">
					<label for="expand-cate"><span>카테고리</span></label>
				</div>
				<div>
					<a href="/blank/project/search?standard=popular"><span>인기</span></a>
				</div>
				<div>
					<a href="/blank/project/search?standard=new"><span>신규</span></a>
				</div>
				<div>
					<a href="/blank/project/search?standard=endDate"><span>마감임박</span></a>
				</div>
				<div>
					<a href="/blank/project/search?standard=open"><span>공개예정</span></a>
				</div>
				<div>
					<a href="/blank/goods"><span>굿즈</span></a>
				</div>
			</div>
			<input type="checkbox" id="expand-cate">
			<div class="menu-detail-area">
				<ul class="menu-detail-box">
					<li class="flex"><a href="/blank/project/search?category=1" class="menu-item"><span class="material-symbols-outlined">checkroom</span>의류</a></li>
					<li class="flex"><a href="/blank/project/search?category=2" class="menu-item"><span class="material-symbols-outlined">design_services</span>디자인문구</a></li>
					<li class="flex"><a href="/blank/project/search?category=3" class="menu-item"><span class="material-symbols-outlined">scene</span>홈/리빙</a></li>
					<li class="flex"><a href="/blank/project/search?category=4" class="menu-item"><span><i class="fa-solid fa-glasses fa-lg fa-fw"></i></span>패션/잡화</a></li>
					<li class="flex"><a href="/blank/project/search?category=5" class="menu-item"><span class="material-symbols-outlined">restaurant</span>푸드</a></li>
					<li class="flex"><a href="/blank/project/search?category=6" class="menu-item"><span><i class="fa-solid fa-palette fa-lg fa-fw"></i></span>예술</a></li>
					<li class="flex"><a href="/blank/project/search?category=7" class="menu-item"><span><i class="fa-solid fa-ghost fa-lg fa-fw"></i></span>캐릭터/굿즈</a></li>
					<li class="flex"><a href="/blank/project/search?category=8" class="menu-item"><span class="material-symbols-outlined">pets</span>반려동물</a></li>
				</ul>
			</div>
		</div>
		
	</div>
	
	<%@ include file = "/WEB-INF/views/common/fixedbutton.jsp" %>

</body>
<script src="/blank/resources/js/common/header.js"></script>
</html>