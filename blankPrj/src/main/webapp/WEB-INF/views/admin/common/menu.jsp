<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> -->
<style>

    body{
        margin: 0;
    }

    div,
    header,
    aside,
    main{
        box-sizing: border-box;
    }
    
    input{
        outline: none;
    }
    
    .admin-menu{
        width: 290px;
        background-color: rgba(0, 0, 0, 0.75);
        color: rgba(255, 255, 255, 1);
    }

    .admin-menu-header img{
        width: 50px;
        height: 50px;
        margin-bottom: 10px;
    }

    .admin-menu-header div:first-child{
        font-size: 35px;
        text-align: center;
        font-style: oblique;
        padding: 10px;
    }

    .admin-menu-header div:last-child{
        font-size: 15px;
        text-align: center;
        padding: 10px;
        border-top: 1px solid rgba(89, 89, 89, 1);
        border-bottom: 1px solid rgba(89, 89, 89, 1);
    }

    .admin-menu-main{
        margin-left: 10%;
    }

    .admin-menu-main a{
        color: rgba(255, 255, 255, 1);
        text-decoration-line: none;
    }

    .admin-menu-main ul{
        font-size: 16px;
        list-style:none;
        margin: 0;
        margin-bottom: 15px;
    }

    .admin-menu-main li{
        margin-bottom: 3px;
    }

    .admin-menu-main a:hover{
        color: rgba(86, 122, 206, 1);
    }

    .admin-menu-main img{
        width: 25px;
        height: 25px;
        margin-right: 10px;
        margin-top: 10px;
    }

    .admin-menu-main h1{
        font-size: 20px;
        margin-bottom: 10px;
        margin-top: 5px;
    }

    .admin-logout{
        width: 290px;
        border-top: 1px solid rgba(89, 89, 89, 1);
    }

    .admin-logout img{
        width: 30px;
        height: 30px;
        margin-left: 80%;
        padding: 10px;
    }

</style>

<aside class="admin-menu">

    <header class="admin-menu-header">
        <div>BLANK</div>
        <div>
            <img src="./resources/admin/admin-profile.png">
            <br>님, 안녕하세요.
        </div>
    </header>

    <main class="admin-menu-main">
        <div class="admin-menu-main-user">
            <h1><img src="./resources/admin/회원관리.png">회원 관리</h1>
            <ul>
                <li>
                    <a href="">회원 관리</a>
                </li>
            </ul>
        </div>
        <div class="admin-menu-main-project">
            <h1><img src="./resources/admin/프로젝트관리.png">프로젝트 관리</h1>
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
            <h1><img src="./resources/admin/공지사항관리.png">공지사항 관리</h1>
            <ul>
                <li>
                    <a href="">공지사항</a>
                </li>
            </ul>
        </div>
        <div class="admin-menu-main-help-center">
            <h1><img src="./resources/admin/헬프센터관리.png">헬프센터 관리</h1>
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
            <h1><img src="./resources/admin/챗봇관리.png">챗봇 관리</h1>
            <ul>
                <li>
                    <a href="">Q&A 등록</a>
                </li>
            </ul>
        </div>
        <div class="admin-menu-main-goods">
            <h1><img src="./resources/admin/굿즈관리.png">굿즈 관리</h1>
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
            <h1><img src="./resources/admin/탈퇴설문관리.png">탈퇴 설문 관리</h1>
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
        <a href=""><img src="./resources/admin/admin-logout.png
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