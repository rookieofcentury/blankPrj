<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원한 프로젝트</title>
<link rel="stylesheet" href="/blank/resources/css/member/payProject.css">
<script src="https://ajax.googleapis.co m/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file = "/WEB-INF/views/common/header.jsp" %>

	<div class="wrap">
		<div class="mypage-container">
			<div><%@ include file = "/WEB-INF/views/member/mypage/mypageSidebar.jsp" %></div>
			<div class="content-container">
				<nav id="nav">
					<ul>
						<li>결제대기</li>
						<li>결제완료</li>
						<li>결제실패</li>
					</ul>
					<div class="line"></div>
				</nav>	
				<div id="contents">
					<div id="contents__list">
					  <div id="contents__item">
						<ul>
						  <li>강아지</li>
						  <li>고양이</li>
						  <li>토끼</li>
						  <li>햄스터</li>
						</ul>
					  </div>
					  <div id="contents__item">
						<ul>
						  <li>JavaScript 입문</li>
						  <li>리액트를 다루는 기술</li>
						  <li>시작하세요! 도커</li>
						  <li>JavaScript 리팩토링</li>
						</ul>
					  </div>
				
				
					</div>
				  </div>
			
			</div>
		</div>
	</div>	
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
</body>
<script src="/blank/resources/js/member/payAddr.js"></script>
</html>