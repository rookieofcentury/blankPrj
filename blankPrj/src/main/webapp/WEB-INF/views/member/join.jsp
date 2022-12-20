<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랭크 회원가입</title>
<link rel="stylesheet" href="/blank/resources/css/member/join.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="shortcut icon" href="/blank/resources/images/member/blank.ico">
</head>
<body>

	    
            <div class="join-header">
                <div><img class="logo-img" src="/blank/resources/images/blank.png" onclick="location.href=''"></div>
                <div><h1>회원가입</h1></div>
            </div>
            <div class="join-container">
                <form action="" method="post">

                <div class="join-container-main">
                    
                    <div >이메일</div>
                    <div>
                        <input type="text" name="email" class="email-input" id="email">
                        <select id="email2" class="email-input">
                            <option >@naver.com</option>
                            <option >@kakao.com</option>
                            <option >@gmail.com</option>
                        </select>
                        <button class="btn-check" type="button" id="email-check">중복 검사</button>
                    </div>
                    <div class="red">비밀번호 찾기에 이용되오니 수신가능한 이메일 작성을 요청드립니다.</div>
                    <div class="result" id="email-result">이메일 유효성 검사 안맞아유~ </div>
                    <div class="span-2">비밀번호</div>
                    <div><input type="password" name="pwd" class="pwd-input"></div>
                    <div class="result" id="pwd1-result">결과창</div>
                    <div>비밀번호 확인</div>
                    <div><input type="password" name="pwd2" class="pwd-input"></div>
                    <div class="result" id="pwd2-result">결과창</div>
                    <div>닉네임</div>
                    <div><input type="text" name="nick" class="input"><button class="btn-check">중복체크</button></div>
                    <div class="result" id="nick-result">결과창</div>
                    <div>핸드폰번호</div>
                    <div><input type="text" name="phone" class="input"><button class="btn-check">중복체크</button></div>
                    <div class="result" id="phone-result">결과창</div>
                    <div>성별</div>
                    <div class="gender-check">
                        <div>남자 <input type="radio" name="gender" value="M"></div> 
                        <div>여자 <input type="radio" name="gender" value="F"></div>
                    </div>
                    <div class="member-join-check">
                        <div><input type="checkbox" id="age-check" name=""><label for="age-check"> 만 14세 이상입니다(필수)</label></div>
                        <div><input type="checkbox" id="blank-check"><label for="blank-check"> 블랭크 이용 약관동의(필수)</label></div>
                        <div><input type="checkbox" id="blank-private-check"><label for="blank-private-check"> 개인정보 수집 및 이용동의(필수)</label></div>
                        <div><input type="checkbox" id="private-check"><label for="private-check"> 개인정보 제 3자 제공 동의(필수)</label></div>
                    </div>
                    <div><input type="submit" value="회원가입" class="submit"></div>
                    <div class="another-login join-flex">
                        <div>이미 블랭크 회원이신 가요?</div><div><a>기존계정으로 로그인하기</a></div>
                    </div>
                    <div class="another-join join-flex ">
                        <div class="hr"><hr></div>
                        <div>간편 회원가입</div>
                        <div class="hr"><hr></div>
                    </div>
                    <div class="another-join join-flex">
                        <div><a>카카오로 시작하기</a></div>
                        <div><a>네이버로 시작하기</a></div>
                    </div>
                </div>
            </form>
        </div>
    </div>
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
</body>
<script src="/blank/resources/js/member/join.js"></script>
</html>