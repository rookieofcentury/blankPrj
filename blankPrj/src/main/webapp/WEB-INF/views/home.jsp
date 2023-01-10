<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% session.removeAttribute("msg"); %>
<html>
<head>
	<title>Blank</title>
<link rel="stylesheet" href="/blank/resources/css/common/main.css">
<link rel="stylesheet" href="/blank/resources/css/common/swiper.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

<%@ include file = "/WEB-INF/views/common/header.jsp" %>

    <div class="wrap">

    <div class="container">
        <div id="banner">
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                  <div data-hash="slide1" class="swiper-slide"><img src="/blank/resources/images/banner/banner4.png" alt=""></div>
                  <div data-hash="slide2" class="swiper-slide">Slide 2</div>
                  <div data-hash="slide3" class="swiper-slide">Slide 3</div>
                  <div data-hash="slide4" class="swiper-slide">Slide 4</div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <div class="content">
            <div class="focus-content">
                <div>
                    <span class="blank-title">주목할 만한 프로젝트</span>
                    <span>기준시 <label id="now-time"></label></span>
                </div>
                <div class="focus-project-list">
                    <div class="focus-project-item">
                        <div class="image-box"><img src="" alt="item-pic"></div>
                        <div>
                            <span>카테고리ㅣ창작자명</span>
                            <span>418 % 달성</span>
                        </div>
                        <div>저는한줄프로젝트입니다</div>
                    </div>
                    <div class="focus-project-item">
                        <div class="image-box"><img src="" alt="item-pic"></div>
                        <div>
                            <span>카테고리ㅣ창작자명</span>
                            <span>418 % 달성</span>
                        </div>
                        <div>저는한줄프로젝트입니다</div>
                    </div>
                    <div class="focus-project-item">
                        <div class="image-box"><img src="" alt="item-pic"></div>
                        <div>
                            <span>카테고리ㅣ창작자명</span>
                            <span>418 % 달성</span>
                        </div>
                        <div>저는한줄프로젝트입니다</div>
                    </div>
                    <div class="focus-project-item">
                        <div class="image-box"><img src="" alt="item-pic"></div>
                        <div>
                            <span>카테고리ㅣ창작자명</span>
                            <span>418 % 달성</span>
                        </div>
                        <div>저는한줄프로젝트입니다</div>
                    </div>
                    <div class="focus-project-item">
                        <div class="image-box"><img src="" alt="item-pic"></div>
                        <div>
                            <span>카테고리ㅣ창작자명</span>
                            <span>418 % 달성</span>
                        </div>
                        <div>저는한줄프로젝트입니다</div>
                    </div>
                    <div class="focus-project-item">
                        <div class="image-box"><img src="" alt="item-pic"></div>
                        <div>
                            <span>카테고리ㅣ창작자명</span>
                            <span>418 % 달성</span>
                        </div>
                        <div>저는한줄프로젝트입니다</div>
                    </div>
                    <div class="focus-project-item">
                        <div class="image-box"><img src="" alt="item-pic"></div>
                        <div>
                            <span>카테고리ㅣ창작자명</span>
                            <span>418 % 달성</span>
                        </div>
                        <div>저는한줄프로젝트입니다</div>
                    </div>
                    <div class="focus-project-item">
                        <div class="image-box"><img src="" alt="item-pic"></div>
                        <div>
                            <span>카테고리ㅣ창작자명</span>
                            <span>418 % 달성</span>
                        </div>
                        <div>저는한줄프로젝트입니다</div>
                    </div>
                </div>
                <div>1 2 3 4</div>
            </div>
            <div class="popular-content">
                <div class="popular-content-title">
                    <div class="blank-title">인기 프로젝트</div>
                    <div>
                        <div class="popular-standard">실시간</div>
                        <div class="popular-standard">주간</div>
                        <div class="popular-standard">월간</div>
                        <div class="popular-standard popular-more-btn">더 보기</div>
                    </div>
                </div>
                <div class="popular-project">
                    <div class="popular-project-item">
                        <div class="image-box"><img src="" alt="item-pic"></div>
                        <div>1</div>
                        <div class="popular-project-item-subtitle">
                            <div>카테고리ㅣ창작자명</div>
                            <div>프로젝트명입니다대충이렇게길게</div>
                            <div>512% 달성</div>
                        </div>
                    </div>
                    <div class="popular-project-item">
                        <div class="image-box"><img src="" alt="item-pic"></div>
                        <div>1</div>
                        <div class="popular-project-item-subtitle">
                            <div>카테고리ㅣ창작자명</div>
                            <div>프로젝트명입니다대충이렇게길게</div>
                            <div>512% 달성</div>
                        </div>
                    </div>
                    <div class="popular-project-item">
                        <div class="image-box"><img src="" alt="item-pic"></div>
                        <div>1</div>
                        <div class="popular-project-item-subtitle">
                            <div>카테고리ㅣ창작자명</div>
                            <div>프로젝트명입니다대충이렇게길게</div>
                            <div>512% 달성</div>
                        </div>
                    </div>
                    <div class="popular-project-item">
                        <div class="image-box"><img src="" alt="item-pic"></div>
                        <div>1</div>
                        <div class="popular-project-item-subtitle">
                            <div>카테고리ㅣ창작자명</div>
                            <div>프로젝트명입니다대충이렇게길게</div>
                            <div>512% 달성</div>
                        </div>
                    </div>
                    <div class="popular-project-item">
                        <div class="image-box"><img src="" alt="item-pic"></div>
                        <div>1</div>
                        <div class="popular-project-item-subtitle">
                            <div>카테고리ㅣ창작자명</div>
                            <div>프로젝트명입니다대충이렇게길게</div>
                            <div>512% 달성</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="content new-content">
            <div class="blank-title">신규 프로젝트</div>
            <div class="new-project-list">
                <div class="new-project-item">
                    <div class="image-box"><img src="" alt="item-pic"></div>
                    <div>
                        <span>카테고리ㅣ창작자명</span>
                        <span>418 % 달성</span>
                    </div>
                    <div>저는한줄프로젝트입니다</div>
                </div>
                <div class="new-project-item">
                    <div class="image-box"><img src="" alt="item-pic"></div>
                    <div>
                        <span>카테고리ㅣ창작자명</span>
                        <span>418 % 달성</span>
                    </div>
                    <div>저는한줄프로젝트입니다</div>
                </div>
                <div class="new-project-item">
                    <div class="image-box"><img src="" alt="item-pic"></div>
                    <div>
                        <span>카테고리ㅣ창작자명</span>
                        <span>418 % 달성</span>
                    </div>
                    <div>저는한줄프로젝트입니다</div>
                </div>
                <div class="new-project-item">
                    <div class="image-box"><img src="" alt="item-pic"></div>
                    <div>
                        <span>
                            <span>카테고리</span>
                            <span>|</span>
                            <span>창작자명</span>
                        </span>
                        <span>418 % 달성</span>
                    </div>
                    <div>저는한줄프로젝트입니다</div>
                </div>
            </div>
        </div>
        <div class="blank-project-info">
            <div>
                <div>지금까지 블랭크를 통해</div>
                <div>
                    <span>21,172,853 원</span>이
                    <div class="under-bar"></div>
                </div>
                <div>안전하게 거래됐어요</div>
            </div>
            <div>총 사용자 3,297 명 ㅣ 등록된 프로젝트 297 개 ㅣ 진행된 프로젝트 1,387 건</div>
        </div>
    </div>

    </div>
    
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>

<script>
    $("document").ready(function () {
        var alertMsg = '${msg}';
        if(alertMsg != '') {
            Swal.fire(
            '안내 메시지',
            alertMsg,
            'info'
            )
        }
        var now = new Date();
        $('#now-time').text(now.getFullYear() + "-" + now.getMonth()+1 + "-" + now.getDate() + " " + now.getHours() + ":" + now.getMinutes() + " (GMT+9)");

        var swiper = new Swiper(".mySwiper", {
            slidesPerView: 'auto',
            spaceBetween: 30,
            loop: true,
            hashNavigation: {
            watchState: true,
            },
            pagination: {
            el: ".swiper-pagination",
            clickable: true,
            },
            navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
            },
        });
        swiper.autoplay.start();
    });
</script>
</body>
</html>
