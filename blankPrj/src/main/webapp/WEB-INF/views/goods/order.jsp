<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Blank</title>
<link rel="stylesheet" href="/blank/resources/css/goods/order.css">
</head>
<body>

    <%@ include file = "/WEB-INF/views/common/header.jsp" %>

    <div class="wrap">

        <div class="container">

            <div class="order-finish">주문이 정상적으로 완료되었습니다!</div>
            <div class="info">
                <div>
                    <div class="info-box">
                        <div class="title">주문 정보</div>
                        <table>
                            <tr>
                                <th>주문 번호</th>
                                <td>20221203-0000001</td>
                            </tr>
                            <tr>
                                <th>주문 일자</th>
                                <td>${pay.payDate}</td>
                            </tr>
                            <tr>
                                <th>처리 상태</th>
                                <td>결제 완료</td>
                            </tr>
                        </table>
                    </div>
                    <div class="info-box">
                        <div class="title">결제 정보</div>
                        <table>
                            <tr>
                                <th>총 주문 금액</th>
                                <td><span>${pay.price}</span> 원</td>
                            </tr>
                            <tr>
                                <th>포인트 사용</th>
                                <td><span>${pay.usepoint}</span> P</td>
                            </tr>
                            <tr>
                                <th>총 결제 금액</th>
                                <td><span>${pay.totalprice}</span> 원</td>
                            </tr>
                            <tr>
                                <th>결제 수단</th>
                                <td><a href="${pay.receiptUrl}">확인하러 가기</a></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div>
                    <div>
                        <span class="title">배송 정보</span>
                        <button>변경</button>
                    </div>
                    <div class="delivery-info">
                        <div>받는 분</div>
                        <div><input type="text" name="name" value="${pay.name}" readonly></div>
                        <div>휴대폰 번호</div>
                        <div><input type="tel" name="phone" id="phone" placeholder="00*-000*-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13" value="${pay.phone}" readonly></div>
                        <div class="address-area">주소</div>
                        <div class="address-search"><input type="text" name="address1" value="${pay.address1}" readonly></div>
                        <div><input type="text" name="address2" value="${pay.address2}" readonly></div>
                        <div><input type="text" name="address3" value="${pay.address3}" readonly></div>
                        <div>배송 메시지</div>
                        <div><input type="text" placeholder="20자 내로 작성해 주세요." value="${pay.message}" readonly></div>
                    </div>
                    <div>주문 상품 확인 및 결제 취소는 마이페이지에서 진행해 주세요.</div>
                    <div class="order-mypage" onclick="location.href=''">주문 배송 조회</div>
                </div>
            </div>

            <div>
                <div>
                    <div>
                        <span>이런 상품은 어떠세요?</span>
                        <div class="under-bar"></div>
                    </div>
                    <div>홈으로 돌아가기</div>
                </div>
                <div class="goods-list">
                    <div class="goods-item" onclick="location.href='/blank/goods/detail';">
                        <div class="image-box"><img src="" alt="item-pic"></div>
                        <div>
                            <span>아이템명</span>
                            <span>가격</span>
                        </div>
                    </div>
                    <div class="goods-item">
                        <div class="image-box"><img src="" alt="item-pic"></div>
                        <div>
                            <span>아이템명</span>
                            <span>가격</span>
                        </div>
                    </div>
                    <div class="goods-item">
                        <div class="image-box"><img src="" alt="item-pic"></div>
                        <div>
                            <span>아이템명</span>
                            <span>가격</span>
                        </div>
                    </div>
                    <div class="goods-item">
                        <div class="image-box"><img src="" alt="item-pic"></div>
                        <div>
                            <span>아이템명</span>
                            <span>가격</span>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
</html>