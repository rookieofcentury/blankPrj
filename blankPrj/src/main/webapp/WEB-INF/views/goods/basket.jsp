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
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

	<%@ include file = "/WEB-INF/views/common/header.jsp" %>

	<div class="wrap">

        <div class="container">

        <div class="basket">
            <div>
                <table>
                    <tr>
                        <th><input type="checkbox" id="all-check"><label for="all-check"></label></th>
                        <th>이미지</th>
                        <th>상품 정보</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th>합계</th>
                    </tr>

                    <!-- 장바구니가 비어 있을 때 -->
                    <c:if test="${empty cart}">
                        <tr id="empty-box">
                            <td rowspan="2" colspan="6" id="empty-box"><label>현재 장바구니가 비어 있습니다.</label><br>지금 바로 블랭크의 굿즈를 담아 보세요!</td>
                        </tr>
                    </c:if>

                    <c:forEach items="${cartList}" var="item">
                        <tr>
                            <td><input type="checkbox" name="chBox" class="chBox" id="${item.no}"><label for="${item.no}"></label></td>
                            <td class="img-area"><img src="" alt=""></td>
                            <td class="name-area">
                                <span>${item.name}</span>
                            </td>
                            <td><fmt:formatNumber pattern="###,###,###" value="${item.price}"/></td>
                            <td class="cnt-area">
                                <div class="cnt-item">
                                    <div class="cnt-btn minus-btn"><i class="fa-solid fa-minus fa-xs"></i></div>
                                    <input type="text" name="cnt" value="${cart[item.no]}" onchange="changeValue('${item.no}', this.value);">
                                    <div class="cnt-btn plus-btn"><i class="fa-solid fa-plus fa-xs"></i></div>
                                </div>
                            </td>
                            <td>
                                <label class="item-price"></label>
                                원
                            </td>
                        </tr>
                    </c:forEach>
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
                            <input type="text" class="price-area val spot" id="product-price" readonly>
                            <span class="unit">원</span>
                        </div>
                    </div>
                    <div>
                        <span class="bold">배송비</span>
                        <div class="price">
                            <input type="text" class="price-area" id="del-fee" readonly>
                            <span class="unit">원</span>
                        </div>
                    </div>
                    <hr>
                    <div>
                        <span class="bold">총계</span>
                        <div class="price">
                            <input type="text" class="price-area val spot" id="total-price" readonly>
                            <span class="unit">원</span>
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
</html>