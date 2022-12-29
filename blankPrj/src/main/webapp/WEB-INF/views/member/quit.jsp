<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심 프로젝트</title>
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
						회원탈퇴시 고객님의 개인정보는 공유서비스 이용약관 및 공유서비스 개인정보보호정책 규정에 따라 관리됩니다.
						회원탈퇴시 고객님의 사용자 정보, 데이터 신청 정보, OPENAPI 신청 정보 및 사용 정보가 모두 삭제됩니다.
					</div>
					<div>
					</div>
				</div>
				<form action="/blank/member/quit" method="post">
					<div class="quit-content">
						<div>
							<div>틸퇴사유</div>	
							<div>
								<select name="aNo" id="aNum">
									<option value="1">서비스가 만족스럽지 않아요</option>
									<option value="2">사이트가 구려요</option>
									<option value="3">찾는 펀딩이 열리지 않아요</option>
									<option value="4">사기꾼이 있어요</option>
									<option value="5">파이널 아즈앙</option>
								</select>
							</div>
						</div>
						<div>
							<div>상세사유 / <br>개선점</div>
							<div><textarea name="aVar"></textarea></div>
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