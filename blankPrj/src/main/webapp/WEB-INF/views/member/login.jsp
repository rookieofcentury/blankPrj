<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랭크 로그인</title>
<link rel="stylesheet" href="/blank/resources/css/member/login.css">
<link rel="shortcut icon" href="/blank/resources/images/member/blank.ico">
<script>
    if('${msg}' != ''){
        alert('${msg}')
    }
    let cookie = "${cookie.saveId.value}";
    console.log(cookie );

    
    if(true){
        $("#saveId").prop("checked", true);
 
    }
    

</script>
</head>
<body>

	<div id="wrap">
        <div id="login-header">
            <div><img class="logo-img" src="/blank/resources/images/blank.png" onclick="location.href='/blank'"></div>
            <div><h1>로그인</h1></div>
        </div>
        <div id="login-container">
            <form action="/blank/member/login" method="post" class="login-form">
                <div class="container-main-area">
                    <div class="login-info">이메일</div>
                    <div><input type="text" class="input" name="email" placeholder="가입하신 이메일을 입력해주세요" value="${cookie.saveId.value}"></div>
                </div>

                <div class="container-main-area">
                    <div class="login-info">비밀번호</div>
                    <div><input type="password" class="input" name="pwd1" placeholder="비밀번호를 입력해주세요"></div>
                </div>
                <div class="container-main-area right">
                    <div>
	                    <input type="checkbox" name="save" id="saveId" value="true"  <c:if test="${not empty cookie.saveId.value}">checked</c:if> >
	                    <label for="saveId">아이디저장</label>
                    </div>
                </div>
                <div class="container-main-area">
                    <div><input type="submit" value="로그인" class="input login-info"></div>
                </div>
                <div class="container-main-area right">
                    <div><a href="/blank/member/findId">아이디를 찾기 |</a><a href="/blank/member/findPwd">비밀번호 찾기 |</a><a href="/blank/member/join">회원가입하기</a></div>
                </div>
                <div class="container-main-area flex">
                    <div class="hr-left"><hr></div>
                    <div class="another-login">다른 방법으로 로그인</div>
                    <div class="hr-right"><hr></div>
                </div>
                <div class="width100">
                    <div><a href="${url}"><img class="naver-box" src="/blank/resources/images/member/naver_btn.png"></a></div>
                </div>
            </form>
        </div>
        
    </div>  
   

  
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
<script>
    
</script>
</body>
</html>