<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랭크 로그인</title>
<link rel="stylesheet" href="/blank/resources/css/member/login.css">
<link rel="shortcut icon" href="/blank/resources/images/member/blank.ico">
</head>
<body>



	<div id="wrap">
        <div id="login-header">
            <div><img class="logo-img" src="/blank/resources/images/blank.png" onclick="location.href=''"></div>
            <div><h1>로그인</h1></div>
        </div>
        <div id="login-container">
            <form action="/blank/member/login" method="post" class="login-form">
                <div class="container-main-area">
                    <div class="login-info">이메일</div>
                    <div><input type="text" class="input" name="email" placeholder="가입하신 이메일을 입력해주세요"></div>
                </div>

                <div class="container-main-area">
                    <div class="login-info">비밀번호</div>
                    <div><input type="password" class="input" name="pwd" placeholder="비밀번호를 입력해주세요"></div>
                </div>
                <div class="container-main-area right">
                    <div><input type="checkbox" name="SaveId" id="saveId"><label for="saveId">아이디저장</label></div>
                </div>
                <div class="container-main-area">
                    <div><input type="submit" value="로그인" class="input login-info"></div>
                </div>
                <div class="container-main-area right">
                    <div><a>아이디를 찾기</a><a>비밀번호 찾기</a></div>
                </div>
                <div class="container-main-area flex">
                    <div class="hr-left"><hr></div>
                    <div class="another-login">다른 방법으로 로그인</div>
                    <div class="hr-right"><hr></div>
                </div>
                <div class="flex">
                    <div><a>카카오로 로그인</a></div>
                    <div><a>네이버로 로그인</a></div>
                </div>
            </form>
        </div>
        
    </div>  
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
    $('.delete-button').on('click', function() {
        $('#popup_layer').css('display', 'block');
    });
    function closePop() { 
        document.getElementById("popup_layer").style.display = "none";
    }
    </script>
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
</html>