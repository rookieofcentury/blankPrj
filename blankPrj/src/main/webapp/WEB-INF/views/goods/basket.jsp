<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
                        <th><input type="checkbox"></th>
                        <th>이미지</th>
                        <th>상품 정보</th>
                        <th>가격</th>
                        <th>수량</th>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBox" class="chBox" data-cartNum="1"></td>
                        <td><img src="" alt=""></td>
                        <td>
                            <span>무릎담요</span>
                            <span>옵션: 블랭크 기본 패턴</span>
                        </td>
                        <td><fmt:formatNumber pattern="###,###,###" value="48000"/></td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chBox" class="chBox" data-cartNum="2"></td>
                        <td><img src="" alt=""></td>
                        <td>
                            <span>무릎담요</span>
                            <span>옵션: 긔엽긔 포켓몬 패턴</span>
                        </td>
                        <td><fmt:formatNumber pattern="###,###,###" value="48000"/></td>
                        <td>2</td>
                    </tr>
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
                    <span>상품 금액</span>
                    <div class="price">
                        <span class="val spot">72,000</span>
                        <span class="unit">원</span>
                    </div>
                </div>
                <div>
                    <span>배송비</span>
                    <div class="price">
                        <span class="val">3,000</span>
                        <span class="unit">원</span>
                    </div>
                </div>
                <hr>
                <div>
                    <span>총계</span>
                    <div class="price">
                        <span class="val spot">75,000</span>
                        <span class="unit">원</span>
                    </div>
                </div>
            </div>
        </div>

        </div>

    </div>
    
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
<script src="/blank/resources/js/goods/basket.js"></script>
</html>