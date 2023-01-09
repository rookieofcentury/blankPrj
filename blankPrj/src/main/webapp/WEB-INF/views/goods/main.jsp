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
                  <div data-hash="slide1" class="swiper-slide">Slide 1</div>
                  <div data-hash="slide2" class="swiper-slide">Slide 2</div>
                  <div data-hash="slide3" class="swiper-slide">Slide 3</div>
                  <div data-hash="slide4" class="swiper-slide">Slide 4</div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <div class="content first-area">
            <div>

            </div>
            <div>

            </div>
            <div class="first-third">
                <div>
                    <form action="/blank/goods/search" method="get">
						<div class="flex search-box">
							<input type="text" class="input-hidden" name="goodsKeyword" placeholder="검색어를 입력해 주세요.">
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
                <div class="flex">더 보러 가기</div>
            </div>
            <div></div>
        </div>
        <div class="exhibition-area">
            <div class="exhibition-item">
                <div>이미지</div>
                <div>
                    <div>이미지1</div>
                    <div>이미지2</div>
                    <div>기획전 바로 가기 ></div>
                </div>
                <div>2023 년을 빈손으로 맞이할 수는 없죠!</div>
                <div>
                    <span>한 해를 맞이할 다이어리 문구류 모음전</span>
                    <span>2022.12.03 - 2022.12.31</span>
                </div>
            </div>
            <div class="exhibition-item">
                <div>이미지</div>
                <div>
                    <div>이미지1</div>
                    <div>이미지2</div>
                    <div>기획전 바로 가기 ></div>
                </div>
                <div>연말 맞이 선물하기 딱 좋은 블랭크 굿즈</div>
                <div>
                    <span>선물 고민하지 마시고 여기로 ♥</span>
                    <span>2022.12.03 - 2022.12.31</span>
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
</script>
</body>
</html>