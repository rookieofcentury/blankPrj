<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Blank</title>
</head>
<body>

    <%@ include file = "/WEB-INF/views/common/header.jsp" %>

    <div class="wrap">

        <div class="container">

            <div>주문이 정상적으로 완료되었습니다!</div>
            <div class="info">
                <div>
                    <div class="order-info"></div>
                    <div class="payment-info"></div>
                </div>
                <div class="delivery-info">
                    <div>
                        <span>배송 정보</span>
                        <button>변경</button>
                    </div>
                    <table>
                        <tr>
                            <th>받는 분</th>
                            <td>송혜은</td>
                        </tr>
                        <tr>
                            <th>휴대폰 번호</th>
                            <td>010-1234-5678</td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td>06234</td>
                        </tr>
                        <tr>
                            <td>서울특별시 강남구 테헤란로 130 호산빌딩</td>
                        </tr>
                        <tr>
                            <td>5F, 6F</td>
                        </tr>
                        <tr>
                            <th>배송메시지</th>
                            <td>(없음)</td>
                        </tr>
                    </table>
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