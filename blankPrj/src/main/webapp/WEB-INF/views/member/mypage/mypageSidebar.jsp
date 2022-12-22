<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 사이드바</title>
<link rel="stylesheet" href="/blank/resources/css/member/mypageSidebar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<aside class="wrap">
        <div class="mypage-side-container">
            <div class="sidebar-container">
                <div class="user-info">
                    <div><img src="/blank/resources/images/member/choi.png"></div>
                    <div><strong>짱고심</strong></div>
                    <div>가입일자 : 2022/05/30</div>
                        <div class="mypage-grid mypage-ponit-project">
                            <div>
                                <div><img src="/blank/resources/images/member/p.png"></div>
                                <div>포인트</div>
                                <div>1004</div>
                            </div>
                            <div>
                                <div><img src="/blank/resources/images/member/project.png"></div>
                                <div>후원한프로젝트</div>
                                <div>1004개</div>
                            </div>
                        </div>
                </div>
                <div class="mypage-grid mypage-menu">
                    <div><a href="/blank/member/mypage/editProfile">회 원 정 보 수 정</a></div>
                    <div><a href="/blank/member/mypage/payAddr">결 제 수 단/배 송 지</a></div>
                    <div><a href="/blank/member/mypage/payProject">후 원 프 로 젝 트</a></div>
                    <div><a href="/blank/member/mypage/likeProject">관 심 프 로 젝 트</a></div>
                    <div><a href="/blank/member/mypage/myGoods">굿 즈 구 매 내 역</a></div>
                    <div><a href="/blank/member/mypage/reportQ">신 고/문 의 내 역</a></div>
                    <div><a href="/blank/member/mypage/likePeople">팔 로 잉/팔 로 워</a></div>
                    <div><a href="/blank/member/mypage/evant">이 벤 트/출 석 체 크</a></div>
                    <div><a href="/blank/member/mypage/alarm">알 람 내 역 및 설 정 </a></div>
                    <div><a href="/blank/member/mypage/message">프 로 젝 트 메 세 지 </a></div>
                </div>
                <div class="delete-button"><a href="#">회원탈퇴</a></div>
            </div>
         </div>
    </aside>
    <div id="popup_layer">
        <div class="popup_box">
            <div class="popup_cont">
				<img class="logo-img" src="/blank/resources/images/blank.png">
                <p>
                    탈퇴하시겠습니까?<br>
                    블랭크 사이트를 탈퇴하시면<br>
                    모든 정보가 사라지게 됩니다.
                </p>
            </div>
            <div class="popup_btn">
                <a href="javascript:closePop();">Close</a>
                <a id="chk_today" href="javascript:closeToday();" class="close_day">Do not open for a day</a> 
            </div>
        </div>
     </div>  

    <script>

    /* 모달창 */
    $('.delete-button').on('click', function() {
        $('#popup_layer').css('display', 'block');
    });
    function closePop() { 
        document.getElementById("popup_layer").style.display = "none";
    }
    </script>
</body>
</html>