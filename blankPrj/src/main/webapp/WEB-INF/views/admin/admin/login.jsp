<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랭크 관리자</title>
    <style>
        html{
          background-color: rgba(241, 241, 241, 1);
        }
        
        .blank-logo{
          width: 135px;
          height: 104px;
          margin-top: 10%;
          transform: translate(0%,0%);
        }

        .admin-login-main{
          border: 1px solid;
          border-color: rgba(197, 197, 197, 1);
          background-color: white;
          width: 475px;
          height: 295px;
          position: absolute;
          top: 50%;
          left: 50%;
          transform: translate(-50%,-50%);
        }

        .center {
          display: flex;
          justify-content: center;
          align-items: center;
        }

        .admin-login-header div:first-child {
          color: rgba(119, 119, 119, 1);
          font-size: 23px;
          font-weight: bold;
          text-align: center;
          margin-top: 6%;
        }

        .admin-login-header div:last-child {
          color: rgba(119, 119, 119, 1);
          font-size: 15px;
          text-align: center;
          margin-bottom: 5%;
        }

        .admin-inputs-login img{
          width: 21px;
          height: 28px;
          margin-left: 10px;
          margin-right: 10px;
          margin-top: 5px;
          margin-bottom: 5px;
        }

        .admin-login-id,
        .admin-login-pwd{
          border: 1px solid;
          border-color: rgba(197, 197, 197, 1);
          border-radius: 5px;
          width: 350px;
          height: 40px;
          margin: 0 auto;
          margin-bottom: 5px;
        }

        .admin-login-id .id-label,
        .admin-login-pwd .pwd-label{
          border: none;
          border-right: 1px solid rgba(197, 197, 197, 1);
          border-radius: 5px 0px 0px 5px;

        }

        .admin-inputs-login input{
          font-size: 15px;
          width: 300px;
          height: 38px;
          border: none;
          outline: none;
          margin-left: 10px;

        }

        .admin-login-submit input{
          border: 1px solid;
          border-color: rgba(197, 197, 197, 1);
          border-radius: 5px;
          font-size: 18px;
          color: rgba(119, 119, 119, 1);
          margin-top: 3%;
          width: 136px;
          height: 38px;
        }

        .cursor{
          cursor: pointer;
        }

    </style>
</head>
<body>

    <img src="./resources/admin/blank_logo.png" class="blank-logo">

    <main class="admin-login-main">

      <header class="admin-login-header">
        <div>BLANK</div>
        <div>블랭크 운영을 위한 관리 페이지 입니다.</div>
      </header>

      <section class="admin-inputs-login">
        <div class="admin-login-id center">
          <div class="id-label"><img src="/resources/admin/login-id.png"></div><!--아이콘 들어감-->
          <input type="text" name="id">
        </div>
        <div class="admin-login-pwd center">
          <div class="pwd-label"><img src="/resources/admin/login-pwd.png"></div><!--아이콘 들어감-->
          <input type="password" name="pwd">
        </div>
      </section>

      <section class="admin-login-submit center">
        <input type="submit" value="로그인" class="admin-login-btn cursor">
      </section>

    </main>

</body>
</html>