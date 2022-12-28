<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<div>
							<div>이 메 일</div>
							<div><label id="loginEmail">${loginMember.email}</label></div>
							<div><button class="change-btn" id="email-change">변경</button></div>
							<div class="hidden email-hidden"></div>
							<div class="hidden email-hidden"><input class="email-change-input" type="text" name="email" value="${loginMember.email}"></div>
							<div class="hidden email-hidden"><input class="change-btn" type="button" value="저장하기" id="email-ajax" onclick="updateEmail();"></div>
							<div class="hidden email-hidden span3 red" id="email-result">비밀번호 찾기에 이용되오니 수신가능한 이메일 작성을 요청드립니다.</div>
						</div>
						<div>
							<div>닉 네 임</div>
							<div><label id="loginNick">${loginMember.nick}</label></div>
							<div><button class="change-btn" id="nick-change">변경</button></div>
							<div class="hidden nick-hidden"></div>
							<div class="hidden nick-hidden"><input  type="text" name="nick"></div>
							<div class="hidden nick-hidden"><input class="change-btn" type="button" value="저장하기" id="nick-ajax"></div>
							<div class="hidden nick-hidden span3" id="nick-result">결과창</div>
						</div>
						<div>
							<div>휴 대 전 화</div>
							<div><label>${loginMember.phone}</label></div>
							<div><button class="change-btn" id="phone-change">변경</button></div>
							<div class="hidden phone-hidden"></div>
							<div class="hidden phone-hidden"><input  type="text" name="phone"></div>
							<div class="hidden phone-hidden"><input class="change-btn" type="button" value="저장하기" id="phone-ajax"></div>
							<div class="hidden phone-hidden" id="phone-result">결과창</div>
						</div>
						<div>
							<div>비 밀 번 호</div>
							<div><label>${loginMember.pwd1}</label></div>
							<div><button class="change-btn" id="pwd-change">변경</button></div>
							<div class="hidden pwd-hidden"></div>
							<div class="hidden pwd-hidden"><input  type="text" name="phone"></div>
							<div class="hidden pwd-hidden"><input class="change-btn" type="button" value="저장하기" id="phone-ajax"></div>
							<div class="hidden phone-hidden" id="phone-result">결과창</div>
						</div>


					</div>
				</div>
			</div>
	</div>	
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
</body>
<script>


let emailChangeBtn = $('#email-change');
//이메일 바꾸는것 에이젝스
function updateEmail(){
  
  alert('클릭!!!!!!!')
  let emailVal = $('input[name=email]').val();
  console.log(emailVal);
  
  
  if(!emailCheck) {
	  alert('수정하시는 이메일을 양식을 확인해주세요');
	  
  }else{
	  $.ajax({
	  url : "/blank/member/updateEmail",
	  type : "post",
	  data : {
		  "email" : emailVal
	  },
	  success : function(result){

		  if(result == 1){
			
			$('#loginEmail').text(emailVal)
			alert('이메일 업데이트 되었습니다.');
			emailChangeBtn.click();

		  }else if(result == 0){

			  $('#email-result').text('중복된 이메일 입니다.');  

		  }else{
			$('#email-result').text('이메일 업데이트 실패 ');  
		  }
	  },
	  error : function(){
		  alert('에이잭스 에러!!!!!!!!!');
	  }
	}) //ajax    
   }
  }



let NickChangeBtn = $('#nick-change');
//닉네임 바꾸는것 에이젝스
function updateNick(){

let nickVal = $('input[name=nick]').val();

if(!nickCheck) {
	alert('수정하시는 닉네임을 양식을 확인해주세요');
	
}else{
	$.ajax({
	url : "/blank/member/updateNick",
	type : "post",
	data : {
		"nick" : nickVal
	},
	success : function(result){

		if(result == 1){
		
		$('#loginEmail').text(nickVal)
		alert('닉네임 업데이트 되었습니다.');
		emailChangeBtn.click();

		}else if(result == 0){

			$('#email-result').text('중복된 이메일 입니다.');  

		}else{
		$('#email-result').text('이메일 업데이트 실패 ');  
		}
	},
	error : function(){
		alert('에이잭스 에러!!!!!!!!!');
	}
}) //ajax    
}
}






</script>





<script src="/blank/resources/js/member/editProfile.js"></script>
</html>