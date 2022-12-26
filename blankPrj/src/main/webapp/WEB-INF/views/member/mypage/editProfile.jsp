<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
<link rel="stylesheet" href="/blank/resources/css/member/editProfile.css">
<link rel="shortcut icon" href="/blank/resources/images/member/blank.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
					<div>
						<input type="file">
						<button class="delete-btn">회원탈퇴</button>
					</div>
				</div>
				<div class="member-info-down">
					<div>이  메 일</div>
					<div>${loginMember.email}</div>
					<div><button class="change-btn" id="email-btn">변경</button></div>
					<div class="hidden span3" id="email-hidden">
						<form>
							<div>
								<input class="change-input">
								<input type="button">
							</div>
						</form>
					</div>
					<div>닉 네 임</div>
					<div>${loginMember.nick}</div>
					<div><button class="change-btn" id="nick-btn">변경</button></div>
					<div class="hidden span3" id="nick-hidden">
						여기는합친거
					</div>
					<div>휴대전화</div>
					<div>${loginMember.phone}</div>
					<div><button class="change-btn" id="phone-btn">변경</button></div>
					<div class="hidden span3" id="phone-hidden">
						여기는합친거
					</div>
					<div>비밀번호</div>
					<div></div>
					<div><button class="change-btn" id="pwd-btn">변경</button></div>
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
<div id="popup_layer">
	<div class="popup_box">
		<div class="popup_cont">
			<img class="logo-img" src="/blank/resources/images/blank.png">
			<p>
				프로젝트를 삭제하시겠습니까?<br>
				프로젝트를 삭제하시면,<br>
				작성했던 모든 내용이 삭제됩니다.
			</p>
		</div>
		<div class="popup_btn">
			<a href="javascript:closePop();">Close</a>
			<a id="chk_today" href="javascript:closeToday();" class="close_day">Do not open for a day</a> 
		</div>
	</div>
</div>

<script>

/* 모달창 */
$('.delete-btn').on('click', function() {
	$('#popup_layer').css('display', 'block');
});
function closePop() { 
	document.getElementById("popup_layer").style.display = "none";
}
</script>
<script src="/blank/resources/js/member/editProfile.js"></script>
</html>