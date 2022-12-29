<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>블랭크 관리자</title>
<link rel="stylesheet" href="/blank/resources/css/admin/admin/login.css">
</head>
<body>

  <main>
    
    <div><img src="/blank/resources/images/blank.png" class="blank-logo"></div>

    <div class="admin-login-main">

      <header class="admin-login-header">
        <div>BLANK</div>
        <div>블랭크 운영을 위한 관리 페이지 입니다.</div>
      </header>

	<form action="/blank/admin/login" method="post">
	
      <section class="admin-inputs-login">
        <div class="admin-login-id center">
          <div class="id-label"><img src="/blank/resources/images/admin/login-id.png"></div><!--아이콘 들어감-->
          <input type="text" name="adminId">
        </div>
        <div class="admin-login-pwd center">
          <div class="pwd-label"><img src="/blank/resources/images/admin/login-pwd.png"></div><!--아이콘 들어감-->
          <input type="password" name="adminPwd">
        </div>
      </section>

      <section class="admin-login-submit center">
        <input type="submit" value="로그인" class="admin-login-btn cursor">
      </section>
      
	</form>


    </div>

  </main>

</body>
</html>