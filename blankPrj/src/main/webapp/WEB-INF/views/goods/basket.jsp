<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blank</title>
<link rel="stylesheet" href="/blank/resources/css/goods/basket.css">
<script src="https://kit.fontawesome.com/77ad8525ff.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

	<%@ include file = "/WEB-INF/views/common/header.jsp" %>

	<div class="wrap">

        <div class="container">

        <div class="basket">
            <div>
                <table>
                    <colgroup>
                        <col style="width: 10%">
                        <col style="width: 15%">
                        <col style="width: 20%">
                        <col style="width: 15%">
                        <col style="width: 15%">
                        <col style="width: 15%">
                    </colgroup>
                    <tr>
                        <th><input type="checkbox" id="all-check"><label for="all-check"></label></th>
                        <th>이미지</th>
                        <th>상품 정보</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th>합계</th>
                    </tr>
                <form action="/blank/goods/payment" id="payment-form" method="post">
                    <!-- 장바구니가 비어 있을 때 -->
                    <c:if test="${empty cart}">
                        <tr id="empty-box">
                            <td rowspan="2" colspan="6" id="empty-box"><label>현재 장바구니가 비어 있습니다.</label><br>지금 바로 블랭크의 굿즈를 담아 보세요!</td>
                        </tr>
                    </c:if>

                    <c:forEach items="${cartList}" var="item">
                        <tr class="cart-item-area">
                            <td><input type="checkbox" name="no" class="chBox" id="${item.no}" value="${item.no}"><label for="${item.no}"></label></td>
                            <td class="img-area"><img src="/blank/resources/upload/goods/${item.thumbnail[0]}" alt=""></td>
                            <td class="name-area">
                                <span>${item.name}</span>
                            </td>
                            <td><fmt:formatNumber pattern="###,###,###" value="${item.price}"/></td>
                            <td class="cnt-area">
                                <div class="cnt-item">
                                    <div class="cnt-btn minus-btn" onclick="minusBtnEvent(this, '${item.no}')"><i class="fa-solid fa-minus fa-xs"></i></div>
                                    <input type="text" name="cnt" value="${cart[item.no]}" onchange="changeValue('${item.no}', this.value);">
                                    <div class="cnt-btn plus-btn" onclick="plusBtnEvent(this, '${item.no}')""><i class="fa-solid fa-plus fa-xs"></i></div>
                                </div>
                            </td>
                            <td>
                                <label class="item-price"></label>
                                원
                            </td>
                        </tr>
                    </c:forEach>
                </form>
                </table>
            </div>
            <div class="btn-area">
                <div class="delete-one">선택 상품 삭제</div>
                <div class="delete-all">장바구니 비우기</div>
            </div>
        </div>
        <div class="receipt">
            <div class="cart-info">
                <div>
                    <div>
                        <span class="bold">상품 금액</span>
                        <div class="price">
                            <c:if test="${empty cart}">
                                <input type="text" class="price-area val spot" value="" readonly>
                            </c:if>
                            <c:if test="${!empty cart}">
                                <input type="text" class="price-area val spot" id="product-price" readonly>
                                <span class="unit">원</span>
                            </c:if>
                        </div>
                    </div>
                    <div>
                        <div>
                            <span class="bold del-fee-ment">
                                <span>배송비</span>
                                <span class="material-symbols-outlined error">error</span>
                                <div class="info-ment">
                                    <div>기본 요금: 3,000 원</div>
                                    <div>70,000 원 이상 구매 무료</div>
                                </div>
                            </span>
                        </div>
                        <div class="price">
                            <c:if test="${empty cart}">
                                <input type="text" class="price-area val spot" value="" readonly>
                            </c:if>
                            <c:if test="${!empty cart}">
                                <input type="text" class="price-area val" id="del-fee" readonly>
                                <span class="unit">원</span>
                            </c:if>
                        </div>
                    </div>
                    <hr>
                    <div>
                        <span class="bold">총계</span>
                        <div class="price">
                            <c:if test="${empty cart}">
                                <input type="text" class="price-area val spot empty" value="EMPTY" readonly>
                            </c:if>
                            <c:if test="${!empty cart}">
                                <input type="text" class="price-area val spot" id="total-price" readonly>
                                <span class="unit">원</span>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="order-btn-area">
                    <div id="order-select">선택 상품 주문</div>
                    <div id="order-all">전체 상품 주문</div>
                </div>
            </div>
        </div>

        </div>

    </div>
    
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
<script src="/blank/resources/js/goods/basket.js"></script>
<script>

    /* 선택 상품 주문 */
    $('#order-select').click(function() {
        var nick = '${loginMember.nick}';
        if(nick == '') {
            Swal.fire({
                title: '로그인이 필요합니다!',
                text: '로그인 창으로 이동합니다.',
                icon: 'info',
                showCancelButton: true,
                confirmButtonColor: '#567ACE',
                confirmButtonText: '이동하기'
            }).then((result) => {
                if(result.isConfirmed) {
                    location.href='/blank/member/login'
                }
            })
        } else {
            if($("input[class=chBox]:checked").length >= 1) {
                $("input[class=chBox]:not(:checked)").attr("disabled", true);
                $('#payment-form').submit();
            } else {
                Swal.fire({
                    title: '최소 한 개 이상 선택한 후 주문해 주세요!',
                    confirmButtonColor: '#567ACE'
                })
            }
        }
    })

    /* 전체 상품 주문 */
    $('#order-all').click(function() {
        var nick = '${loginMember.nick}';
        if(nick == '') {
            Swal.fire({
                title: '로그인이 필요합니다!',
                text: '로그인 창으로 이동합니다.',
                icon: 'info',
                showCancelButton: true,
                confirmButtonColor: '#567ACE',
                confirmButtonText: '이동하기'
            }).then((result) => {
                if(result.isConfirmed) {
                    location.href='/blank/member/login'
                }
            })
        } else if($('.cart-item-area').length == 0) {
            Swal.fire({
                title: '장바구니가 비어 있습니다!',
                confirmButtonColor: '#567ACE'
            })
        } else {
            $("input[class=chBox]").prop("checked", true);
            $('#payment-form').submit();
        }
    })
</script>
</html>