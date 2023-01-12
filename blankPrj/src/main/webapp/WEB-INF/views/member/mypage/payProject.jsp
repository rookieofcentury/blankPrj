<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
							<c:if test="${fn:length(payList) != 0}">
								<c:forEach items="${payList}" var="list" varStatus="status" end="4">
									<div class="project-info">
		
										<div><img class = "prj-img" src="/blank/resources/upload/project/${list.changeName}"></div>
										<div>
											<div><a href="/blank/project?p=${list.no}">${list.title}</a></div>
										</div>
										<div>
											<div>결제금액 : ${list.price}</div>
											<div>결제예정일 : ${list.payDate}</div>
										</div>
									</div>
								</c:forEach>
							</c:if>	
						</div>
						<div id="contents__item" class="content-second">
							<c:if test="${fn:length(payList) != 0}">
								<c:forEach items="${payList}" var="list" varStatus="status" begin="5" end="8">
									<div class="project-info">
		
										<div><img class = "prj-img" src="/blank/resources/upload/project/${list.changeName}"></div>
										<div>
											<div><a href="/blank/project?p=${list.no}">${list.title}</a></div>
										</div>
										<div>
											<div>결제 된 금액 : ${list.price}</div>
											<div>결제일시 : ${list.reserveDate}</div>
										</div>
									</div>
								</c:forEach>
							</c:if>	
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