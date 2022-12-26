<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랭크 비밀번호 찾기</title>
<link rel="stylesheet" href="/blank/resources/css/member/findPwd.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="shortcut icon" href="/blank/resources/images/member/blank.ico">
</head>
<body>



	<div id="wrap">
        <div id="find-header">
            <div><img class="logo-img" src="/blank/resources/images/blank.png" onclick="location.href=''"></div>
            <div><h1>비밀번호 찾기</h1></div>
        </div>
        <div id="find-container">
            <div class="find-pwd-area">

                <div class="container-main-area">
                    <div class="login-info">이메일</div>
                    <div class="flex"><input type="text" class="input" name="email" placeholder="가입하신 이메일을 입력해주세요"></div>
                </div >
                <div class="result container-main-area" id="email-result">등록 된 이메일이 없습니다.</div>
                <div class="container-main-area">
                    <div class="pwd-info">블랭크 가입 시 사용하신 이메일을 입력하시면 임시 비밀번호를 보내드립니다.</div>
                </div>
                <div class="container-main-area">
                    <div><input type="button" value="임시 비밀번호 받기" class="input ace" id="find-pwd"></div>
                </div>
            
            </div>
        </div>
                
            
        </div>
        
    </div>  
   
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
<script src="/blank/resources/js/member/findPwd.js"></script>
</html>