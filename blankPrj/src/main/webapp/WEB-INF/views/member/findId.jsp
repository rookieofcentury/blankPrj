<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랭크 로그인</title>
<link rel="stylesheet" href="/blank/resources/css/member/findId.css">
<link rel="shortcut icon" href="/blank/resources/images/member/blank.ico">
</head>
<body>

    <%@ include file = "/WEB-INF/views/common/header.jsp" %>

	<div id="wrap">
        <div id="find-container">
            <form action="/blank/member/findId" method="post" class="login-form">
                <div class="container-main-area">
                    <div class="login-info">핸드폰번호</div>
                    <div><input type="text" class="input" name="phone" placeholder="가입하신 핸드폰번호를 입력해주세요" oninput="autoHyphen(this)"></div>
                </div>
                
                <div class="container-main-area">
                    <div><input type="submit" value="아이디 찾기" class="input login-info"></div>
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