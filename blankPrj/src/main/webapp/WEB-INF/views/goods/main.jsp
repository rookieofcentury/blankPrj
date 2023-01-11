<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Blank</title>
<link rel="stylesheet" href="/blank/resources/css/goods/main.css">
<link rel="stylesheet" href="/blank/resources/css/common/swiper.css">
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

<%@ include file = "/WEB-INF/views/common/header.jsp" %>

<div class="wrap">

    <div class="container">
        <div id="banner">
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                  <div data-hash="slide1" class="swiper-slide"><img src="/blank/resources/images/banner/banner5.png"></div>
                  <div data-hash="slide2" class="swiper-slide"><img src="/blank/resources/images/banner/banner6.png"></div>
                  <div data-hash="slide3" class="swiper-slide"><img src="/blank/resources/images/banner/banner7.png"></div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <div class="content first-area">
            <div class="first-first">
                <div class="bold">공지 사항</div>
                <div class="notice-content">
                    <span>22.12.09</span>
                    <span class="notice-detail">블랭크 오픈 기념 굿즈 증정 이벤트</span>
                </div>
                <div class="notice-content">
                    <span>22.12.31</span>
                    <span class="notice-detail">행복한 연말 맞이 기획전 개장!</span>
                </div>
                <div class="notice-content">
                    <span>23.01.04</span>
                    <span class="notice-detail">결제 시스템 점검 안내</span>
                </div>
                <div class="notice-content">
                    <span>23.01.12</span>
                    <span class="notice-detail">빵빵키링 재입고 안내</span>
                </div>
            </div>
            <div class="first-second">
                <div class="bold">검색 도우미</div>
                <div class="search-cate">
                    <div>카테고리</div>
                    <a class="cate" href="/blank/goods/search?category=1">리빙/가전</a>
                    <a class="cate" href="/blank/goods/search?category=2">패션잡화</a>
                    <a class="cate" href="/blank/goods/search?category=3">문구류</a>
                    <a class="cate" href="/blank/goods/search?category=4">오피스</a>
                    <a class="cate" href="/blank/goods/search?category=5">디지털</a>
                </div>
                <div class="search-cate">
                    <div>추천 키워드</div>
                    <a class="cate" href="/blank/goods/search?goodsKeyword=엽서">엽서</a>
                    <a class="cate" href="/blank/goods/search?goodsKeyword=코딩">코딩</a>
                    <a class="cate" href="/blank/goods/search?goodsKeyword=심원용">심원용</a>
                    <a class="cate" href="/blank/goods/search?goodsKeyword=다이어리">다이어리</a>
                </div>
                <div class="search-cate">
                    <div>인기 아이템</div>
                    <a class="cate" href="/blank/goods/search?goodsKeyword=사랑이 가득해 키링">사랑이 가득해 키링</a>
                    <a class="cate" href="/blank/goods/search?goodsKeyword=모코코 키링">모코코 키링</a>
                </div>
                <div class="search-cate">
                    <div>오늘의 아이템</div>
                    <a class="cate" href="/blank/goods/search?goodsKeyword=가죽 장패드">가죽 장패드</a>
                    <a class="cate" href="/blank/goods/search?goodsKeyword=코딩 능력">코딩 능력</a>
                </div>
            </div>
            <div class="first-third">
                <div>
                    <form action="/blank/goods/search" method="get">
						<div class="flex search-box">
							<input type="text" class="input-hidden" name="goodsKeyword" placeholder="굿즈 검색어를 입력해 주세요.">
							<button class="material-symbols-outlined">search</button>
						</div>
					</form>
                </div>
                <div class="cart-area flex" onclick="location.href='/blank/goods/basket'">
                    <div class="cart-icon">
                        <span class="material-symbols-outlined">shopping_cart</span>
                        <div class="on-count">
                            <span></span>
                        </div>
                    </div>
                    <label>장바구니 가기</label>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="goods-list">
                <c:forEach items="${eightList}" var="item">
                    <div class="goods-item" onclick="location.href='/blank/goods/detail?no=${item.no}';">
                        <div class="image-box"><img src="/blank/resources/upload/goods/${item.thumbnail[0]}" alt="item-pic"></div>
                        <div>
                            <span>${item.name}</span>
                            <span><fmt:formatNumber pattern="###,###,###" value="${item.price}"/> 원</span>
                        </div>
                    </div>
				</c:forEach>
            </div>
        </div>
        <div class="editor-picks">
            <div>
                <div>Editor Picks</div>
                <div>에디터가 골라 주는<br>이 달의 블랭크!</div>
                <div class="flex" onclick="callexhibition();">더 보러 가기</div>
            </div>
            <div class="editor-item-area">
                <div class="editor-item" onclick="location.href='/blank/goods/detail?no=14'">
                    <div class="editor-image-box"><img src="/blank/resources/upload/goods/goods_35988641008900.jpg" alt=""></div>
                    <span class="padding-left item-name">케리아</span>
                    <span class="padding-left item-price"><label>89,000</label> 원</span>
                </div>
                <div class="editor-item" onclick="location.href='/blank/goods/detail?no=4'">
                    <div class="editor-image-box"><img src="/blank/resources/upload/goods/goods_28469111329400.jpg" alt=""></div>
                    <span class="padding-left item-name">무릎담요</span>
                    <span class="padding-left item-price"><label>24,000</label> 원</span>
                </div>
                <div class="editor-item" onclick="location.href='/blank/goods/detail?no=8'">
                    <div class="editor-image-box"><img src="/blank/resources/upload/goods/goods_29853234377300.jpg" alt=""></div>
                    <span class="padding-left item-name">뚜슬리 슬리퍼</span>
                    <span class="padding-left item-price"><label>18,900</label> 원</span>
                </div>
                <div class="editor-item" onclick="location.href='/blank/goods/detail?no=12'">
                    <div class="editor-image-box"><img src="/blank/resources/upload/goods/goods_30642279960800.jpg" alt=""></div>
                    <span class="padding-left item-name">하이라이트 점착지</span>
                    <span class="padding-left item-price"><label>3,960</label> 원</span>
                </div>
            </div>
        </div>
        <div class="exhibition-area">
            <div class="exhibition-item">
                <div><img src="/blank/resources/images/exhibition/diary0.jpg" alt=""></div>
                <div>
                    <div><img src="/blank/resources/images/exhibition/diary1.jpg" alt=""></div>
                    <div><img src="/blank/resources/images/exhibition/diary2.jpg" alt=""></div>
                    <div class="onexhibit flex" onclick="callexhibition();">기획전<br>바로 가기 ></div>
                </div>
                <div>2023 년을 빈손으로 맞이할 수는 없죠!</div>
                <div>
                    <span>한 해를 맞이할 다이어리 문구류 모음전</span>
                    <span>2022.12.23 - 2023.01.28</span>
                </div>
            </div>
            <div class="exhibition-item">
                <div><img src="https://www.shutterstock.com/ko/blog/wp-content/uploads/sites/17/2018/12/shutterstock_764435446.jpg"></div>
                <div>
                    <div><img src="https://www.elandrs.com/upload/prd/img/836/600/2110808836_0000003.jpg"></div>
                    <div><img src="https://a.storyblok.com/f/112937/568x464/e81e7f792b/12-_christmas_traditions_from_around_the_world_square1.jpg"></div>
                    <div class="onexhibit flex" onclick="callexhibition();">기획전<br>바로 가기 ></div>
                </div>
                <div>연말 맞이 선물하기 딱 좋은 블랭크 굿즈</div>
                <div>
                    <span>선물 고민하지 마시고 여기로 ♥</span>
                    <span>2022.12.05 - 2023.01.15</span>
                </div>
            </div>
        </div>

    </div>
    
</div>

<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

<script>
    $("document").ready(function () {
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

    function callexhibition() {
        Swal.fire({
            title: '준비 중!',
            text: '준비 중입니다.',
            icon: 'info',
            confirmButtonColor: '#567ACE'
        })
    }
</script>
</body>
</html>