<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
<link rel="stylesheet" href="/blank/resources/css/member/editProfile.css">
<script src="https://ajax.googleapis.co m/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file = "/WEB-INF/views/common/header.jsp" %>

	<div class="wrap">
		<div class="mypage-container">
			<div><%@ include file = "/WEB-INF/views/member/mypage/mypageSidebar.jsp" %></div>
			<div class="content-container">
				<div class="member-info-up">
					<div>사진</div>
					<div><img src="/blank/resources/images/member/choi.png"></div>
					<div><button class="change-btn">사진 변경</button></div>
				</div>
				<div class="member-info-down">
					<div>이  메 일</div>
					<div><input type="text" name="memberEmail" value="멤버이메일" class="member-info-input"></div>
					<div><button class="change-btn" id="email-btn">이메일 변경</button></div>
					<div class="hidden span3" id="email-hidden">
						<form>
							여기는합친거
						</form>
					</div>
					<div>닉 네 임</div>
					<div><input type="text" name="memberNick" value="멤버닉네임" class="member-info-input"></div>
					<div><button class="change-btn" id="nick-btn">닉네임 변경</button></div>
					<div class="hidden span3" id="nick-hidden">
						여기는합친거
					</div>
					<div>휴대전화</div>
					<div><input type="text" name="memberPhone" value="멤버핸드폰" class="member-info-input"></div>
					<div><button class="change-btn" id="phone-btn">휴대전화 변경</button></div>
					<div class="hidden span3" id="phone-hidden">
						여기는합친거
					</div>
					<div>비밀번호</div>
					<div><input type="password" name="memberPwd" value="멤버비번" class="member-info-input"></div>
					<div><button class="change-btn" id="pwd-btn">비밀번호 변경</button></div>
					<div class="hidden span3" id="pwd-hidden">
						여기는합친거
					</div>
					<div>성 별</div>
					<div><input ></div>
					<div><button class="change-btn">성별 변경</button></div>
					<div class="hidden span3" id="gender-hidden">
						여기는합친거
					</div>
				</div>
			</div>
		</div>
	</div>	
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
</body>
<script src="/blank/resources/js/member/editProfile.js"></script>
</html>