<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원 프로젝트</title>
<link rel="stylesheet" href="/blank/resources/css/member/payProject.css">
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
						<li>후원 예정 프로젝트</li>
						<li>후원한 프로젝트</li>
						<li>후원 취소된 프로젝트</li>
						<div class="line"></div>
					</ul>
				</nav>	
				<div id="contents">
					<div id="contents__list">
						<div id="contents__item" class="content-first">
							<div class="project-info">
								<div>프로젝트사진</div>
								<div>
									<div>후원일</div>
									<div>프로젝트명</div>
									<div>후원내역</div>
								</div>
								<div>
									<div>17,800원 결제예정</div>
									<div>결제예정일</div>
								</div>
							</div>
							<div class="project-info">
								<div>프로젝트사진</div>
								<div>
									<div>후원일</div>
									<div>프로젝트명</div>
									<div>후원내역</div>
								</div>
								<div>
									<div>17,800원 결제예정</div>
									<div>결제예정일</div>
								</div>
							</div>
							<div class="project-info">
								<div>프로젝트사진</div>
								<div>
									<div>후원일</div>
									<div>프로젝트명</div>
									<div>후원내역</div>
								</div>
								<div>
									<div>17,800원 결제예정</div>
									<div>결제예정일</div>
								</div>
							</div>
						</div>
						<div id="contents__item" class="content-second">
							<div class="project-info">
								<div>프로젝트사진</div>
								<div>
									<div>후원일</div>
									<div>프로젝트명</div>
									<div>후원내역</div>
								</div>
								<div>
									<div>17,800원 결제예정</div>
									<div>결제예정일</div>
								</div>
							</div>
							<div class="project-info">
								<div>프로젝트사진</div>
								<div>
									<div>후원일</div>
									<div>프로젝트명</div>
									<div>후원내역</div>
								</div>
								<div>
									<div>17,800원 결제예정</div>
									<div>결제예정일</div>
								</div>
							</div>
						</div>
						<div id="contents__item" class="content-third">
							<div class="project-info">
								<div>프로젝트사진</div>
								<div>
									<div>후원일</div>
									<div>프로젝트명</div>
									<div>후원내역</div>
								</div>
								<div>
									<div>17,800원 결제예정</div>
									<div>결제예정일</div>
								</div>
							</div>
							<div class="project-info">
								<div>프로젝트사진</div>
								<div>
									<div>후원일</div>
									<div>프로젝트명</div>
									<div>후원내역</div>
								</div>
								<div>
									<div>17,800원 결제예정</div>
									<div>결제예정일</div>
								</div>
							</div>
						</div>
				
				
					</div>
				</div>
			
			</div>
		</div>
	</div>	
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
<script src="/blank/resources/js/member/payProject.js"></script>

</html>