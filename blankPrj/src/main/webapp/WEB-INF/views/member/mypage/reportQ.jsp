<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 / 신고</title>
<link rel="stylesheet" href="/blank/resources/css/member/reportQ.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
<%@ include file = "/WEB-INF/views/common/header.jsp" %>

	<div class="wrap">
		<div class="mypage-container">
			<div><%@ include file = "/WEB-INF/views/member/mypage/mypageSidebar.jsp" %></div>
			<div class="content-container">
				<div class="container-top">
					<h2>신고 / 문의 내역</h2>
					<form action="" method="get" id="inquiry-search-form">
	
					<div class="inquiry-search">
					
						<div></div>
						<div class="search-category">
							<select class="category" name="category">
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select>
						</div>
						<div class="search-keyword">
							<input type="text" class="keyword" name="keyword">
						</div>
						<div>
							<div class="search-icon"><input type="image" src="/blank/resources/images/admin/search.png" alt="search.png" ></div>
						</div>
						<div style="margin-left: 10px;">
							<a href="/blank/help/inquiryWrite" id="wrtie-btn"><button type='button' class="wrtie-btn" style="height: 100%; width: 60px;">글쓰기</button></a>
						</div>
						
					</div>
		
				</form> 
				</div>
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
							<div>제목</div>
							<div>진행 상태</div>
							<div>작성일시</div>
						</div>
						<div class="list">
							<c:forEach items="${helpVoList}" var="list">
								<div class="hover">
									<div>${list.no}</div>
									<div><a href="/blank/help/inquiryDetail?no=${list.no}" name="no">${list.title}</a></div>
									<c:choose>
										<c:when test="${list.status eq 'N'}">
											<div id="waiting">답변 대기</div>
										</c:when>
										<c:when test="${list.status eq 'Y'}">
											<div id="waiting">답변 완료</div>
										</c:when>
									</c:choose>
									<div>${list.writeDate}</div>
								</div>
							</c:forEach>
						</div>
						<div>
							<div>1 2 3 4</div>
						</div>
						
						
					  </div>
					  <div id="contents__item" class="content">
							<div class="title2">
								<div>신고 번호</div>
								<div>신고 제목</div>
								<div>프로젝트 제목</div>
								<div>진행 상태</div>
								<div>신고 일시</div>
							</div>
							<div class="list2">
								<c:forEach items="${reportVoList}" var="list">
									<div class="hover2">
										<div>${list.no}</div>
										<div><a href="">${list.title}</a></div>
										<div><a href="">${list.prj}</a></div>
										<c:choose>
											<c:when test="${list.status eq 'N'}">
												<div id="waiting">접수 대기</div>
											</c:when>
											<c:when test="${list.status eq 'Y'}">
												<div id="waiting">접수 완료</div>
											</c:when>
										</c:choose>
										<d>${list.enrollDate}</d   iv>
									</div>
								</c:forEach>
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