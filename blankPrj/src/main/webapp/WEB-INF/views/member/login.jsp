<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/blank/resources/css/member/login.css">
</head>
<body>

<%@ include file = "/WEB-INF/views/common/header.jsp" %>

	<div id="wrap">
        <div id="login-container">
            <form action="" class="login-form">
                <div class="container-main-area">
                    <div class="login-info">이메일</div>
                    <div><input type="text" class="input" name="memberEmail" placeholder="가입하신 이메일을 입력해주세요"></div>
                </div>

                <div class="container-main-area">
                    <div class="login-info">비밀번호</div>
                    <div><input type="password" class="input" name="memberPwd" placeholder="비밀번호를 입력해주세요"></div>
                </div>
                <div class="container-main-area">
                    <div><input type="submit" value="로그인" class="input login-info"></div>
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
     
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
</html>