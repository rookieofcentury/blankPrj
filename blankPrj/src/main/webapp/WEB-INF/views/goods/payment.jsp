<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/blank/resources/css/goods/payment.css">
</head>
<body>

<%@ include file = "/WEB-INF/views/common/header.jsp" %>

    <div class="wrap">
        
        <div class="container">

            <div class="cart-info">
                <div class="area-title">주문서 작성</div>
                <div>
                    <span>내 장바구니 내역</span>
                    <div class="cart-table">
                        <table>
                            <tr>
                                <th>번호</th>
                                <th>이미지</th>
                                <th>상품 정보</th>
                                <th>가격</th>
                                <th>수량</th>
                                <th>합계</th>
                            </tr>
                            <tr class="cart-product">
                                <td>1</td>
                                <td><img src="" alt="" class="product-img"></td>
                                <td class="name-option">
                                    <span class="name">무릎담요</span>
                                    <span class="option">옵션: 블랭크 기본 패턴</span>
                                </td>
                                <td>
                                    <span class="price">24,000</span>
                                    <span> 원</span>
                                </td>
                                <td>
                                    <span>1</span>
                                    <span>개</span>
                                </td>
                                <td>
                                    <span class="price">24,000</span>
                                    <span> 원</span>
                                </td>
                            </tr>
                            <tr class="cart-product">
                                <td>2</td>
                                <td><img src="" alt="" class="product-img"></td>
                                <td class="name-option">
                                    <span class="name">무릎담요</span>
                                    <span class="option">옵션: 긔엽긔 포켓몬 패턴</span>
                                </td>
                                <td>
                                    <span class="price">24,000</span>
                                    <span> 원</span>
                                </td>
                                <td>
                                    <span>2</span>
                                    <span>개</span>
                                </td>
                                <td>
                                    <span class="price">48,000</span>
                                    <span> 원</span>
                                </td>
                            </tr>
                        </table>
                        <div>
                            <span class="warning">상품의 옵션 및 수량 변경, 주문 취소는 장바구니에서 진행해 주세요.</span>
                            <div>
                                상품 구매 금액
                                <span class="">72,000</span>
                                + 배송비
                                <span>0</span>
                                = 합계 :
                                <span>72,000</span>
                                원
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <span class="area-title">배송 정보</span>
                <div class="delivery-info">
                    <div>받는 분</div>
                    <div><input type="text" name="name"></div>
                    <div>휴대폰 번호</div>
                    <div><input type="tel" name="phone" id="phone" placeholder="00*-000*-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13"></div>
                    <div class="client-checkbox"><input type="checkbox"> 내 정보에서 받아 오기</div>
                    <div class="address-area">주소</div>
                    <div class="address-search"><input type="text" name="address1"><div class="search-btn">검색</div></div>
                    <div><input type="text" name="address2"></div>
                    <div><input type="text" name="address3"></div>
                    <div class="client-checkbox"><input type="checkbox"> 내 정보에서 받아 오기</div>
                    <div>배송 메시지</div>
                    <div><input type="text" placeholder="20자 내로 작성해 주세요."></div>
                </div>
            </div>
            <div>
                <span class="area-title">포인트 사용</span>
                <div class="point-info">
                        <div>내가 보유한 포인트</div>
                        <div></div>
                        <div>P</div>
                        <div>사용할 포인트</div>
                        <div><input type="number" id="use-point"></div>
                        <div>P</div>
                        <div>최종 결제 금액</div>
                        <div>70000</div>
                        <div>원</div>
                </div>
                <div class="warning-ment"><input type="checkbox"> 위 주문서 내용을 확인하였으며, 결제에 동의합니다.</div>
                <div id="pay-button">결제하기</div>
            </div>

        </div>

    </div>

<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
</html>