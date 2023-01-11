<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
<link rel="stylesheet" href="/blank/resources/css/member/editProfile.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<%@ include file = "/WEB-INF/views/common/header.jsp" %>

	<div class="wrap">
		<div class="mypage-container">
			<div><%@ include file = "/WEB-INF/views/member/mypage/mypageSidebar.jsp" %></div>
				<div class="content-container">
					<div class="member-info-up">
						<div><h2>회원 정보 수정</h2></div>
						<div class="member-profile">
							<div>프로필 사진</div>
							<c:if test="${not empty naver}">
								<div><img id="View" src="${loginMember.profile}" alt="프로필 사진2222" /></div>
							</c:if>
							<c:if test="${empty naver}">
								<div><img id="View" src="/blank/resources/upload/member/${loginMember.profile}" alt="프로필 사진" /></div>
							</c:if>
							<div>
								<form action="/blank/member/mypage/plus-profile" name="profile" id="profile-form" method="post" enctype="multipart/form-data">
									<!-- <label for="input-profile" class="filebox"> 업로드 </label> -->
									<input type="file" name="profile" id="input-profile">
									<button type ="button" id="profile-delete" class="change-btn">삭제</button>
									<input type="submit" id="profile-submit" value="저장" class="change-btn">
									
								</form>
								
							</div>
						</div>
					</div>
					<div class="member-info-down">
						<div>
							<div>이 메 일</div>
							<div><label id="loginEmail">${loginMember.email}</label></div>
							<div><button class="change-btn" id="email-change">변경</button></div>
							<div class="hidden email-hidden"></div>
							<div class="hidden email-hidden"><input class="email-change-input" type="text" name="email" value="${loginMember.email}"></div>
							<div class="hidden email-hidden"><input class="change-btn" type="button" value="업데이트" id="email-ajax" onclick="updateEmail();"></div>
							<div class="hidden email-hidden span3 red" id="email-result">비밀번호 찾기에 이용되오니 수신가능한 이메일 작성을 요청드립니다.</div>
						</div>
						<div>
							<div>닉 네 임</div>
							<div><label id="loginNick">${loginMember.nick}</label></div>
							<div><button class="change-btn" id="nick-change">변경</button></div>
							<div class="hidden nick-hidden"></div>
							<div class="hidden nick-hidden"><input  type="text" name="nick" value="${loginMember.nick}"></div>
							<div class="hidden nick-hidden"><input class="change-btn" type="button" value="업데이트" id="nick-ajax" onclick="updateNick();"></div>
							<div class="hidden nick-hidden span3 red" id="nick-result"></div>
						</div>
						<div>
							<div>휴 대 전 화</div>
							<div><label id="loginPhone">${loginMember.phone}</label></div>
							<div><button class="change-btn" id="phone-change">변경</button></div>
							<div class="hidden phone-hidden"></div>
							<div class="hidden phone-hidden"><input  type="text" name="phone" value="${loginMember.phone}" oninput="autoHyphen(this)"></div>
							<div class="hidden phone-hidden"><input class="change-btn" type="button" value="업데이트" id="phone-ajax" onclick="updatePhone();"></div>
							<div class="hidden phone-hidden span3 red" id="phone-result"></div>
						</div>
						<div>
							<div>비 밀 번 호</div>
							<div><input type="password" name="pwd" placeholder="기존 비밀번호를 입력해주세요"></div>
							<div><button class="change-btn" id="pwd-check">확인</button></div>
							<div class="hidden pwd-hidden"></div>
							<div class="hidden pwd-hidden"><input  type="password" name="pwd1"></div>
							<div class="hidden pwd-hidden"><input class="change-btn" type="button" value="업데이트" id="pwd1-ajax"></div>
							<div class="hidden pwd-hidden span3 red" id="pwd1-result"></div>
						</div>

					</div>
					<div class="member-quit">
						<a href="/blank/member/quit">
							회원탈퇴
						</a>
					</div>
				</div>
			</div>
	</div>	
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
</body>  
<script>


let emailChangeBtn = $('#email-change');
//이메일 업데이트 에이젝스
function updateEmail(){
  
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



let nickChangeBtn = $('#nick-change');
//닉네임 업데이트 에이젝스
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
			
			$('#loginNick').text(nickVal)
			alert('닉네임 업데이트 되었습니다.');
			nickChangeBtn.click();

			}else if(result == 0){

				$('#nick-result').text('중복된 닉네임 입니다.');  

			}else{
			$('#nick-result').text('닉네임 업데이트 실패 ');  
			}
			},
			error : function(){
			alert('에이잭스 에러!!!!!!!!!');
			}
		}) //ajax    
 	}
}

let phoneChangeBtn = $('#phone-change');


//핸드폰 업데이트 에이젝스
function updatePhone(){

	let phoneVal = $('input[name=phone]').val();

	if(!phoneCheck) {
		alert('수정하시는 휴대전화 양식을 확인해주세요');
		
	}else{
		$.ajax({
		url : "/blank/member/updatePhone",
		type : "post",
		data : {
			"phone" : phoneVal
		},
		success : function(result){

			if(result == 1){
			
			$('#loginPhone').text(phoneVal)
			alert('휴대전화번호가 업데이트 되었습니다.');
			phoneChangeBtn.click();

			}else if(result == 0){

				$('#phone-result').text('중복된 휴대전화 입니다.');  

			}else{
			$('#phone-result').text('휴대전화번호 업데이트 실패 ');  
			}
			},
			error : function(){
			alert('에이잭스 에러!!!!!!!!!');
			}
		}) //ajax    
 	}
}

//비밀번호 업데이트
//비밀번호 입력하여 로그인된 비밀번호와 같으면 아래 인풋 나오게 

//키업하면 비밀번호 타입으로 바뀌게 바꿔야한다.

$('input[name=pwd]').keyup(function(){
	$('input[name=pwd]').prop("type", "password");
})
	let pwdBtn = $('#pwd-check');
	pwdBtn.click(function(){

		let pwdValue = $('input[name=pwd]').val();

		if(pwdValue == ''){
			alert('기존 비밀번호를 입력하신 후 변경버튼을 눌러주세요')
		}else {
			$.ajax({
			url : "/blank/member/checkPwd",
			type : "post",
			data : {
				"pwd" : pwdValue
			},
			success : function(result){

				if(result == 1){

				alert('비밀번호 확인 완료');
				$('input[name=pwd]').prop('readonly', true);
				$('.pwd-hidden').toggle()
				}
				else{
					alert('비밀번호가 일치하지 않습니다.')
				}
			
			},
		
			error : function(){
			alert('에이잭스 에러!!!!!!!!!');
			}
			}) //ajax   
				
		}
	})

	let pwd1CheckReturn = false;

	$('input[name=pwd1]').keyup(function(){
    
    pwd1CheckReturn = false;
    const pwdjung = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/; // 8 - 16 영 문 특 1개씩
    let pwd1Val = $('input[name=pwd1]').val();

    
    if(pwd1Val == ''){
        $('#pwd1-result').text('비밀번호를 입력해주세요');
    }else if(!pwdjung.test(pwd1Val)){
        $('#pwd1-result').text('영문자 + 숫자 + 특수문자 8 ~ 16글자 부탁드립니다.');
    }else{
        $('#pwd1-result').text('');
        pwd1CheckReturn = true;
    }
})

$('#pwd1-ajax').click(function(){

	let pwd1Val = $('input[name=pwd1]').val();

	if(!pwd1CheckReturn){
		alert('비밀번호 양식을 맞춰 입력해주세요')
	}
	else if(pwd1CheckReturn){
		//에이잭스로 업데이트 해주자

		$.ajax({
			url : "/blank/member/updatePwd",
			type : "post",
			data : {
				"pwd1" : pwd1Val
			},
			success : function(result){

				if(result == 1){

				alert('비밀번호 업데이트 완료');
				$('input[name=pwd]').prop({"readonly":false, "type":"text"})
				$('input[name=pwd]').val('기존 비밀번호를 입력해주세요');

				$('.pwd-hidden').toggle()
				}
				else{
					alert('비밀번호가 업데이트 실패')
				}
			
			},
		
			error : function(){
			alert('에이잭스 에러!!!!!!!!!');
			}
			}) //ajax   
		
	}
	else{

	}
})
//     if (pwdBtn.text() == "변경") {
      
//       pwdBtn.text("취소"); 
//    } else {
//       pwdBtn.text("변경");
//    }

// $('#pwd-change').click(function(){
   
    
//     }

// })

//프로필 삭제 기능
$('#profile-delete').click(function(){

	$.ajax({
			url : "/blank/member/deleteProfile",
			type : "post",
			success : function(result){

				if(result == 1){

				alert('프로필 삭제했습니다.');
					document.location.reload();

				}
				else{
					alert('프로필 업데이트 실패')
				}
			
			},
		
			error : function(){
			alert('에이잭스 에러!!!!!!!!!');
			}
		}) //ajax   

})


// 프로필 미리보기 기능 
$(function() {
    $("#input-profile").on('change', function(){
    readURL(this);
    });
});
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        $('#View').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }

	alert('저장버튼을 누르셔야 프로필에 저장이 됩니다.')
}
</script>





<script src="/blank/resources/js/member/editProfile.js"></script>
</html>