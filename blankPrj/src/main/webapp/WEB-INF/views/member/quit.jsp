<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="/blank/resources/css/member/quit.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<body>
<%@ include file = "/WEB-INF/views/common/header.jsp" %>

	<div class="wrap">
		<div class="mypage-container">
			<div><%@ include file = "/WEB-INF/views/member/mypage/mypageSidebar.jsp" %></div>
			<div class="content-container">
				<div class="quit-info">
					<div><h2>회원 탈퇴</h2></div>
					<div class="quit-text">
						회원탈퇴시 고객님의 개인정보는 모두 삭제됩니다.
						회원탈퇴시 고객님의 게시글, 댓글 등의 데이터는 삭제되지 않습니다. 반드시 탈퇴 전 직접 삭제하셔야 합니다.
					</div>
					<div>
					</div>
				</div>
				<form action="/blank/member/quit" method="post">
					<div class="quit-content">
						<div>
							<div>틸퇴사유</div>	
							<div>
								<select name="quitNo" id="aNum">
								<c:forEach items="${quitVoList}" var="list">
								
									<option value="${list.no}">${list.content}</option>
									
								</c:forEach>
								</select>
							</div>
						</div>
						<div>
							<div>상세사유 / <br>개선점</div>
							<div><textarea name="quitVar"></textarea></div>
						</div>
						<div><input type="submit" value="탈퇴" class="submit"></div>
					</div>
				</form>	
			</div>
		</div>
	</div>	
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
<script src="/blank/resources/js/member/join.js"></script>
</html>