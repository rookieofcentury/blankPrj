<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
<link rel="stylesheet" href="/blank/resources/css/member/editProfile.css">
</head>
<body>
<%@ include file = "/WEB-INF/views/common/header.jsp" %>

	<div class="wrap">
		<div class="mypage-container">
			<div><%@ include file = "/WEB-INF/views/member/mypage/mypageSidebar.jsp" %></div>
			<div class="content-container">
				<div>
					<div class="container-up-content">
						<div></div>
						<div class="margin-top">
							<div>
								<div>사진</div>
							</div>
						</div>
						<div><img src="../resources/images/member/choi.png"></div>
						<div class="margin-top">
							<button class="change-btn">변경</button>
						</div>
						<div>
							<p>회원님을 알릴 수 있는 사진을 등록해 주세요.
								<br>
								등록된 사진은 회원님의 게시물이나 댓글들에 사용됩니다.</p>
						</div>
					</div>
				</div>
				<div class="container-down-content">
					<div>
						<div>이메일</div>
						<div><input type="text" value="이메일"></div>
						<div><button>이메일 변경</button></div>
					</div>
					<div>
						<div>닉네임</div>
						<div><input type="text" value="닉네임"></div>
						<div><button>닉네임 변경</button></div>
					</div>
					<div>
						<div>휴대전화</div>
						<div><input type="text" value="휴대전화"></div>
						<div><button>휴대전화ㄴ 변경</button></div>
					</div>
					
				</div>
			</div>
		</div>
	</div>	
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
</body>
</html>