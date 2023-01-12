<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                  <div data-hash="slide1" class="swiper-slide"><img src="/blank/resources/images/banner/banner1.png"></div>
                  <div data-hash="slide2" class="swiper-slide"><img src="/blank/resources/images/banner/banner2.png"></div>
                  <div data-hash="slide3" class="swiper-slide"><img src="/blank/resources/images/banner/banner4.png" onclick="getAtt();"></div>
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
                    <c:forEach items="${randomList}" var="item">
                        <div class="focus-project-item" onclick="location.href='/blank/project?p=${item.no}'">
                            <div class="image-box"><img src="/blank/resources/upload/project/${item.changeName}"></div>
                            <div>
                                <span>${item.category}ㅣ${item.creator}</span>
                                <span>418 % 달성</span>
                            </div>
                            <div>${item.title}</div>
                        </div>
                    </c:forEach>
                </div>
                <div class="page-area">
                    <div class="page">1</div>    
                    <div class="page">2</div>    
                    <div class="page">3</div>    
                </div>
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
                    <c:forEach items="${popularList}" var="item">
                        <c:set var="i" value="${i+1}"/>
                        <div class="popular-project-item" onclick="location.href='/blank/project?p=${item.no}'">
                            <div class="image-box"><img src="/blank/resources/upload/project/${item.changeName}" alt="item-pic"></div>
                            <div>${i}</div>
                            <div class="popular-project-item-subtitle">
                                <div>${item.category}ㅣ${item.creator}</div>
                                <div>${item.title}</div>
                                <div>512% 달성</div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="content new-content">
            <div class="blank-title">신규 프로젝트</div>
            <div class="new-project-list">
                <c:forEach items="${newList}" var="item" varStatus="index" begin="0" end="4" step="1">
                    <div class="new-project-item" onclick="location.href='/blank/project?p=${item.no}'">
                        <div class="image-box"><img src="/blank/resources/upload/project/${item.changeName}" alt="item-pic"></div>
                        <div>
                            <span>${item.category}ㅣ${item.creator}</span>
                            <span>418 % 달성</span>
                        </div>
                        <div>${item.title}</div>
                    </div>
                </c:forEach>
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
            Swal.fire({
                title: '안내 메시지',
                text: alertMsg,
                icon: 'info',
                confirmButtonColor: '#567ACE'
            })
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
        getMainList(1);
    });

    function getAtt() {
        $('#attendance-btn').click();
    }

    function getMainList(param) {
        $.ajax({
            url: "/blank/getRandom",
            method: "POST",
            data: {
                p: param
            },
            success: function(data) {
                console.log("불러오기 success");
            }

        })
    }
</script>
</body>
</html>
