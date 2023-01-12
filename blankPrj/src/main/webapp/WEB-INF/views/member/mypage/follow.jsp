<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팔로잉 / 팔로워</title>
<link rel="stylesheet" href="/blank/resources/css/member/follow.css">
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
					<h2>팔로잉 / 팔로워 내역</h2>
					<form action="" method="get" id="inquiry-search-form">
		
				</form> 
				</div>
				<nav id="nav">
					<ul>
						<li>팔로잉</li>
						<li>팔로워</li>
						<div class="line"></div>
					</ul>
				</nav>	
				<div id="contents">
					<div id="contents__list">
					  <div id="contents__item" class="content">
						<c:if test="${fn:length(followingList) != 0}">
							<c:forEach items="${followingList}" var="list">
									<div class="profile-container">
										<div><img src="/blank/resources/upload/member/${list.profile}"/></div>
										<div class="follow-flex">
											<div><strong>${list.nick}</strong></div>
											<div><button type="button" name="no" value="${list.no}">취소</button></div>
										</div>
									</div>
							</c:forEach>
						</c:if>
						
					</div>
					  <div id="contents__item" class="content">
						<c:if test="${fn:length(followerList) != 0}">
							<c:forEach items="${followerList}" var="list">
								<div class="profile-container">
									<div><img src="/blank/resources/upload/member/${list.profile}"/></div>
									<div class="nick">${list.nick}</div>
								</div>
								
							</c:forEach>
						</c:if>
					  </div>
					</div>
				</div>
			</div>
		</div>
	</div>	
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
</body>
<script src="/blank/resources/js/member/follow.js"></script>
<script>
	$('button[name=no]').click(function(){


		let buttonVal = $('button[name=no]').val();
		$.ajax({
				url : "/blank/member/deleteMember",
				type : "post",
				data : {
					"likeMemberNo" : buttonVal
				},
				success : function(result){

					if(result == 1){
						
						
						document.location.reload();

					}else {

					}
				},
				error : function(){
					alert('에이잭스 에러!!!!!!!!!');
				}
			}) //ajax    
	})


</script>
</html>