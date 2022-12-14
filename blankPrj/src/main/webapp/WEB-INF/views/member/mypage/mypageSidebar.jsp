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
                    <div><img src="/blank/resources/upload/member/${loginMember.profile}"></div>
                    <div><strong>${loginMember.nick}</strong></div>
                    <div>가입일자 : 2022/05/30</div>
                        <div class="mypage-grid mypage-point-project">
                            <div>
                                <div><img src="/blank/resources/images/member/p.png"></div>
                                <div>포인트</div>
                                <div>${loginMember.point}</div>
                            </div>
                            <div>
                                <div><img src="/blank/resources/images/member/project.png"></div>
                                <div>후원한프로젝트</div>
                                <div>${loginMember.cntPrj}개</div>
                            </div>
                        </div>
                </div>
                <div class="mypage-grid mypage-menu">
                    <div><a href="/blank/member/mypage/editprofile">회 원 정 보 수 정</a></div>
                    <div><a href="/blank/member/mypage/payAddr">결 제 수 단/배 송 지</a></div>
                    <div><a href="/blank/member/mypage/payProject">후 원 프 로 젝 트</a></div>
                    <div><a href="/blank/member/mypage/likeProject">관 심 프 로 젝 트</a></div>
                    <div><a href="/blank/member/mypage/reportQ">신 고/문 의 내 역</a></div>
                    <div><a href="/blank/member/mypage/likePeople">팔 로 잉/팔 로 워</a></div>
                    <div><a href="/blank/member/mypage/evant">이 벤 트/출 석 체 크</a></div>
                </div>
                
            </div>
         </div>
    </aside>
   
</body>
</html>