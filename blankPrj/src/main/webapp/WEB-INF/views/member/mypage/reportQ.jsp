<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 / 신고</title>
<link rel="stylesheet" href="/blank/resources/css/member/reportQ.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body>
<%@ include file = "/WEB-INF/views/common/header.jsp" %>

	<div class="wrap">
		<div class="mypage-container">
			<div><%@ include file = "/WEB-INF/views/member/mypage/mypageSidebar.jsp" %></div>
			<div class="content-container">
				<nav id="nav">
					<ul>
						<li>문의 내역</li>
						<li>신고 내역</li>
						<div class="line"></div>
					</ul>
				</nav>	
				<div id="contents">
					<div id="contents__list">
					  <div id="contents__item" class="content">
						<div class="title">
							<div>문의 번호</div>
							<div>카테고리</div>
							<div>제목</div>
							<div>작성일시</div>
							<div>진행 상태</div>
						</div>
						<div class="list">
							<div>1</div>
							<div>배송</div>
							<div>제목이라고요</div>
							<div>2022-11-24</div>
							<div>답변 대기</div>
						</div>
						<div>
							<div>1 2 3 4</div>
						</div>
						
						
					  </div>
					  <div id="contents__item" class="content">
							<div class="title">
								<div>신고 번호</div>
								<div>프로젝트 제목</div>
								<div>제목</div>
								<div>신고일시</div>
								<div>진행 상태</div>
							</div>
							<div class="list">
								<div>1</div>
								<div>배송</div>
								<div>제목이라고요</div>
								<div>2022-11-24</div>
								<div>답변 대기</div>
							</div>
							<div>
								<div>1 2 3 4</div>
							</div>
					  </div>
					</div>
				</div>
			</div>
		</div>
	</div>	
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
</body>
<script src="/blank/resources/js/member/reportQ.js"></script>

</html>