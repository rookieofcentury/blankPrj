<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file = "/WEB-INF/views/common/header.jsp" %>

    <div class="wrap">
        
        <div class="container">

            <div class="cart-info">
                <div>주문서 작성</div>
                <div>
                    <span>내 장바구니 내역</span>
                    <div>
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
                                <td><img src="" alt=""></td>
                                <td class="name-option">
                                    <span class="name">무릎담요</span>
                                    <span class="option">옵션: 블랭크 기본 패턴</span>
                                </td>
                                <td>
                                    <span>24,000</span>
                                    <span> 원</span>
                                </td>
                                <td>
                                    <span>1</span>
                                    <span>개</span>
                                </td>
                                <td>
                                    <span>24,000</span>
                                    <span> 원</span>
                                </td>
                            </tr>
                            <tr class="cart-product">
                                <td>2</td>
                                <td><img src="" alt=""></td>
                                <td class="name-option">
                                    <span class="name">무릎담요</span>
                                    <span class="option">옵션: 긔엽긔 포켓몬 패턴</span>
                                </td>
                                <td>
                                    <span>24,000</span>
                                    <span> 원</span>
                                </td>
                                <td>
                                    <span>2</span>
                                    <span>개</span>
                                </td>
                                <td>
                                    <span>48,000</span>
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
                <span>배송 정보</span>
                <div>
                    <div>받는 분</div>
                    <div><input type="text" name="name" value="송혜은"></div>
                    <div>휴대폰 번호</div>
                    <div><input type="tel" name="phone" id="phone" placeholder="00*-000*-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13"></div>
                    <div><input type="checkbox"> 내 정보에서 받아 오기</div>
                    <div>주소</div>
                    <div><input type="text" name="address"></div>
                    <div><input type="text"></div>
                    <div><input type="text"></div>
                    <div><input type="checkbox"> 내 정보에서 받아 오기</div>
                    <div>배송 메시지</div>
                    <div><input type="text" placeholder="20자 내로 작성해 주세요."></div>
                </div>
            </div>
            <div>
                <span>포인트 사용</span>
                <div>
                    <div>
                        <div>내가 보유한 포인트</div>
                        <div></div>
                        <div>P</div>
                    </div>
                    <div>
                        <div>사용할 포인트</div>
                        <div><input type="number"></div>
                        <div>P</div>
                    </div>
                    <div>
                        <div>최종 결제 금액</div>
                        <div></div>
                        <div>원</div>
                    </div>
                </div>
                <div><input type="checkbox"> 위 주문서 내용을 확인하였으며, <br>결제에 동의합니다.</div>
                <div><input type="submit" value="결제하기"></div>
            </div>

        </div>

    </div>

<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
</html>