<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<link rel="stylesheet" href="/blank/resources/css/member/join.css">
</head>
<body>
<%@ include file = "/WEB-INF/views/common/header.jsp" %>

	<div id="wrap">
        
        <div id="join-container">
            <form action="" method="post">
                <div id="join-container-main">
                    <h2>이메일로 가입하기</h2>
                    <div >이메일</div>
                    <div><input type="text" name="memberEmail" class="input"><button class="btn-check">중복체크</button></div>
                    <div class="span-2">비밀번호</div>
                    <div><input type="password" name="memberPwd1" class="input"></div>
                    <div>비밀번호 확인</div>
                    <div><input type="password" name="memberPwd2" class="input"></div>
                    <div>닉네임</div>
                    <div><input type="text" name="memberNick" class="input"><button class="btn-check">중복체크</button></div>
                    <div>핸드폰번호</div>
                    <div><input type="text" name="memberPhone" class="input"><button class="btn-check">중복체크</button></div>
                    <div>성별</div>
                    <div class="gender-check">
                        <div>남자 <input type="radio" name="memberGender" value="M"></div> 
                        <div>여자 <input type="radio" name="memberGender" value="F"></div>
                    </div>
                    <div class="member-join-check">
                        <div><input type="checkbox" id="age-check" name=""><label for="age-check"> 만 14세 이상입니다(필수)</label></div>
                        <div><input type="checkbox" id="blank-check"><label for="blank-check"> 블랭크 이용 약관동의(필수)</label></div>
                        <div><input type="checkbox" id="blank-private-check"><label for="blank-private-check"> 개인정보 수집 및 이용동의(필수)</label></div>
                        <div><input type="checkbox" id="private-check"><label for="private-check"> 개인정보 제 3자 제공 동의(필수)</label></div>
                    </div>
                    <div><input type="submit" value="회원가입" class="submit"></div>
                    <div class="flex another-login">
                        <div>이미 블랭크 회원이신 가요?</div><div><a>기존계정으로 로그인하기</a></div>
                    </div>
                    <div class="join-flex another-join">
                        <div class="hr-left"><hr></div>
                        <div>간편 회원가입 하기</div>
                        <div class="hr-right"><hr></div>
                    </div>
                    <div class="flex">
                        <div><a>카카오로 시작하기</a></div>
                        <div><a>네이버로 시작하기</a></div>
                    </div>
                </div>
            </form>
    </div>
    
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
</body>
</html>