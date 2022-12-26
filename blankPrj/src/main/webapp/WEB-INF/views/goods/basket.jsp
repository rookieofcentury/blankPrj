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
                        <th><label for="all-check"><div><input type="checkbox" id="all-check"></div></label></th>
                        <th>이미지</th>
                        <th>상품 정보</th>
                        <th>가격</th>
                        <th>수량</th>
                    </tr>
                    <c:if test="${cart == null}">
                        <tr id="empty-box">
                            <td rowspan="2" colspan="5" id="empty-box"><label>현재 장바구니가 비어 있습니다.</label><br>지금 바로 블랭크의 굿즈를 담아 보세요!</td>
                        </tr>
                    </c:if>
                    <c:forEach items="${cartList}" var="item">
                        <tr>
                            <td><input type="checkbox" name="chBox" class="chBox" data-cartNum="${item.no}"></td>
                            <td><img src="" alt=""></td>
                            <td>
                                <span>${item.name}</span>
                            </td>
                            <td><fmt:formatNumber pattern="###,###,###" value="${item.price}"/></td>
                            <td>${cart}</td>
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
                            <span class="val">72,000</span>
                            <span class="unit">원</span>
                        </div>
                    </div>
                    <div>
                        <span class="bold">배송비</span>
                        <div class="price">
                            <span class="val">3,000</span>
                            <span class="unit">원</span>
                        </div>
                    </div>
                    <hr>
                    <div>
                        <span class="bold">총계</span>
                        <div class="price">
                            <span class="val spot" id="total-price">75,000</span>
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