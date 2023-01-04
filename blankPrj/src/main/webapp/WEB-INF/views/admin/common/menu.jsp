<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/blank/resources/css/admin/common/menu.css">

<aside class="admin-menu">

    <header class="admin-menu-header">
        <div>BLANK</div>
        <div>
            <img src="/blank/resources/images/admin/admin-profile.png">
            <br>${loginAdmin.adminId} 님, 안녕하세요.
        </div>
    </header>

    <main class="admin-menu-main">
        <div class="admin-menu-main-user">
            <h1><img src="/blank/resources/images/admin/member-admin.png">회원 관리</h1>
            <ul>
                <li>
                    <a href="/blank/admin/member">회원 관리</a>
                </li>
            </ul>
        </div>
        <div class="admin-menu-main-project">
            <h1><img src="/blank/resources/images/admin/project-admin.png">프로젝트 관리</h1>
            <ul>
                <li>
                    <a href="/blank/admin/project">프로젝트</a>
                </li>
                <li>
                    <a href="/blank/admin/deProject">신고된 프로젝트</a>
                </li>
            </ul>
        </div>
        <div class="admin-menu-main-notice">
            <h1><img src="/blank/resources/images/admin/notice-admin.png">공지사항 관리</h1>
            <ul>
                <li>
                    <a href="/blank/admin/notice">공지사항</a>
                </li>
            </ul>
        </div>
        <div class="admin-menu-main-help-center">
            <h1><img src="/blank/resources/images/admin/help-admin.png">헬프센터 관리</h1>
            <ul>
                <li>
                    <a href="/blank/admin/faq">자주 묻는 질문(FAQ)</a>
                </li>
                <li>
                    <a href="/blank/admin/help">고객센터</a>
                </li>
            </ul>
        </div>
        <div class="admin-menu-main-chat-bot">
            <h1><img src="/blank/resources/images/admin/chatbot-admin.png">챗봇 관리</h1>
            <ul>
                <li>
                    <a href="">Q&A 등록</a>
                </li>
            </ul>
        </div>
        <div class="admin-menu-main-goods">
            <h1><img src="/blank/resources/images/admin/goods-admin.png">굿즈 관리</h1>
            <ul>
                <li>
                    <a href="/blank/admin/goods/list">굿즈</a>
                </li>
                <li>
                    <a href="">굿즈 후기</a>
                </li>
            </ul>
        </div>
        <div class="admin-menu-main-survey">
            <h1><img src="/blank/resources/images/admin/survey-admin.png">탈퇴 설문 관리</h1>
            <ul>
                <li>
                    <a href="/blank/admin/quit">설문 문항</a>
                </li>
                <li>
                    <a href="">통계</a>
                </li>
            </ul>
        </div>
    </main>
    <div class="admin-logout">
        <a href=""><img src="/blank/resources/images/admin/admin-logout.png
        "></a>
    </div>

</aside>

<script>

    window.onload = function() {
        var link = document.createElement('link');
        link.type = 'image/x-icon';
        link.rel = 'shortcut icon';
        link.href = '/blank/resources/images/member/blank.ico';
        document.getElementsByTagName('head')[0].appendChild(link);
    }();

</script>
