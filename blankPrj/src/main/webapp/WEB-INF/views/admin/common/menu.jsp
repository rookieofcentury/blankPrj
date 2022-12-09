<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> -->

<link rel="stylesheet" href="/blank/resources/css/admin/common/menu.css">

<aside class="admin-menu">

    <header class="admin-menu-header">
        <div>BLANK</div>
        <div>
            <img src="../resources/images/admin/admin-profile.png">
            <br>님, 안녕하세요.
        </div>
    </header>

    <main class="admin-menu-main">
        <div class="admin-menu-main-user">
            <h1><img src="../resources/images/admin/member-admin.png">회원 관리</h1>
            <ul>
                <li>
                    <a href="">회원 관리</a>
                </li>
            </ul>
        </div>
        <div class="admin-menu-main-project">
            <h1><img src="../resources/images/admin/project-admin.png">프로젝트 관리</h1>
            <ul>
                <li>
                    <a href="">프로젝트</a>
                </li>
                <li>
                    <a href="">신고된 프로젝트</a>
                </li>
            </ul>
        </div>
        <div class="admin-menu-main-notice">
            <h1><img src="../resources/images/admin/notice-admin.png">공지사항 관리</h1>
            <ul>
                <li>
                    <a href="">공지사항</a>
                </li>
            </ul>
        </div>
        <div class="admin-menu-main-help-center">
            <h1><img src="../resources/images/admin/help-admin.png">헬프센터 관리</h1>
            <ul>
                <li>
                    <a href="">자주 묻는 질문(FAQ)</a>
                </li>
                <li>
                    <a href="">고객센터</a>
                </li>
            </ul>
        </div>
        <div class="admin-menu-main-chat-bot">
            <h1><img src="../resources/images/admin/chatbot-admin.png">챗봇 관리</h1>
            <ul>
                <li>
                    <a href="">Q&A 등록</a>
                </li>
            </ul>
        </div>
        <div class="admin-menu-main-goods">
            <h1><img src="../resources/images/admin/goods-admin.png">굿즈 관리</h1>
            <ul>
                <li>
                    <a href="">굿즈</a>
                </li>
                <li>
                    <a href="">굿즈 후기</a>
                </li>
            </ul>
        </div>
        <div class="admin-menu-main-survey">
            <h1><img src="../resources/images/admin/survey-admin.png">탈퇴 설문 관리</h1>
            <ul>
                <li>
                    <a href="">설문 문항</a>
                </li>
                <li>
                    <a href="">통계</a>
                </li>
            </ul>
        </div>
    </main>
    <div class="admin-logout">
        <a href=""><img src="../resources/images/admin/admin-logout.png
        "></a>
    </div>

</aside>

<!-- <script>
    window.addEventListener("resize", function () {
      const menu = document.querySelector(".admin-menu-main");
      menu.style.height = window.innerHeight - 110 + "px";
    });
    const menu = document.querySelector(".admin-menu-main");
    menu.style.height = window.innerHeight - 110 + "px";
</script> -->