<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blank</title>
<link rel="stylesheet" href="/blank/resources/css/goods/payment.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

<%@ include file = "/WEB-INF/views/common/header.jsp" %>

    <div class="wrap">
        <form action="/blank/goods/order" method="post" id="order-form">
        
        <div class="container">
            <div class="cart-info">
                <div class="area-title">주문서 작성</div>
                <div>
                    <span>내 주문 내역</span>
                    <div class="cart-table">
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
                                <th>번호</th>
                                <th>이미지</th>
                                <th>상품 정보</th>
                                <th>가격</th>
                                <th>수량</th>
                                <th>합계</th>
                            </tr>
                            <input type="hidden" name="consumer" value="${loginMember.no}">
                            <c:forEach items="${orderList}" var="item">
                                <tr class="cart-product">
                                    <td>${item.no}</td>
                                    <input type="hidden" name="no" value="${item.no}">
                                    <td><img src="/blank/resources/upload/goods/${item.thumbnail[0]}" alt="" class="product-img"></td>
                                    <td class="name-option">
                                        <span class="name">${item.name}</span>
                                    </td>
                                    <td>
                                        <span class="price"><fmt:formatNumber pattern="###,###,###" value="${item.price}"/></span>
                                        <span> 원</span>
                                    </td>
                                    <td>
                                        <span><input type="text" name="cnt" value="${item.cnt}" readonly></span>
                                        <span> 개</span>
                                    </td>
                                    <td>
                                        <label class="price item-price"></label>
                                        <span> 원</span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                        <div>
                            <span class="warning">상품의 옵션 및 수량 변경, 주문 취소는 장바구니에서 진행해 주세요.</span>
                            <div>
                                상품 구매 금액
                                <input type="text" name="price" class="price val" id="product-price" readonly> 원
                                + 배송비
                                <input type="text" name="delivery" class="price val" id="del-fee" readonly> 원
                                = 합계 :
                                <input type="text" class="price val spot" id="total-price" readonly>
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
                    <div><input type="text" name="name" required></div>
                    <div>휴대폰 번호</div>
                    <div><input type="text" name="phone" id="phone" placeholder="00*-000*-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" oninput="autoHyphen(this)" maxlength="13" required></div>
                    <div class="client-checkbox"><input type="checkbox" id="name-phone-check"><label for="name-phone-check" class="flex"><span class="material-symbols-outlined">check_circle</span></label>내 정보에서 받아 오기</div>
                    <div class="address-area">주소</div>
                    <div class="address-search"><input type="text" name="address1" required><div class="search-btn">검색</div></div>
                    <div><input type="text" name="address2" required></div>
                    <div><input type="text" name="address3" required></div>
                    <div class="client-checkbox"><input type="checkbox" id="address-check"><label for="address-check" class="flex"><span class="material-symbols-outlined">check_circle</span></label>내 정보에서 받아 오기</div>
                    <div>배송 메시지</div>
                    <div><input type="text" name="message" placeholder="20자 내로 작성해 주세요."></div>
                </div>
            </div>
            <div>
                <span class="area-title">포인트 사용</span>
                <div class="point-info">
                        <div>내가 보유한 포인트</div>
                        <div class="user-point">${loginMember.point}</div>
                        <div>P</div>
                        <div>사용할 포인트</div>
                        <div><input type="number" name="usepoint" id="use-point" value="0"></div>
                        <div>P</div>
                        <div>최종 결제 금액</div>
                        <div><input type="text" name="totalprice" id="payment-price" readonly></div>
                        <div>원</div>
                </div>
                <div class="warning-ment"><input type="checkbox" id="required-button"><label for="required-button" class="flex"><span class="material-symbols-outlined">check_circle</span>위 주문서 내용을 확인하였으며, 결제에 동의합니다.</label></div>
                <div><button id="pay-button" type="button" onclick="requestPay();">결제하기</button></div>
            </div>
            <input type="hidden" name="impUid">
            <input type="hidden" name="payMethod">
            <input type="hidden" name="payment">
            <input type="hidden" name="payDate">
            <input type="hidden" name="receiptUrl">
            <input type="hidden" name="status">
            </form>
        </div>

    </div>

<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
<script>

    /* 이름, 휴대 전화 번호 정보 받기 */
    $('#name-phone-check').change(function() {
        if($('#name-phone-check').is(":checked")) {
            $('input[name=phone]').val('${loginMember.phone}');
        }
    })
    
    /* 주소 정보 받기 */
    $('#address-check').change(function() {
        if($('#address-check').is(":checked")) {
            $.ajax({
                url: "/blank/goods/payment/address",
                method: "POST",
                data: {
                    no: '${loginMember.no}'
                },
                success: function(data) {
                    console.log(data);
                    if(data == '') {
                        Swal.fire({
                            icon: 'error',
                            title: '불러오기 실패',
                            text: '저장된 정보가 없습니다. 등록 후 이용해 주세요.',
                            confirmButtonColor: '#567ACE'
                        })
                    } else {
                        $('input[name=address1]').val(data.addrNo);
                        $('input[name=address2]').val(data.addr);
                        $('input[name=address3]').val(data.addrDt);
                    }
                }
            })
        }
    })

</script>
<script src="/blank/resources/js/goods/payment.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
<script>

    var today = new Date();
    var now = today.getFullYear() + today.getMonth() + today.getDate();

    function requestPay() {
        if($('#required-button').is(':checked')) {
            IMP.init('imp04887484');
            IMP.request_pay({
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid : now + new Date().getTime(),
            name : '블랭크',
            amount : $('#payment-price').val(),
            buyer_email : '${loginMember.email}',
            buyer_name : '${loginMember.nick}',
            buyer_tel : '${loginMember.phone}',
            buyer_addr : $('input[name=address2]').val() + $('input[name=address3]').val(),
            buyer_postcode : $('input[name=address1]').val()
            }, function (rsp) { // callback
                if (rsp.success) {
                    $('input[name=impUid]').val(rsp.imp_uid);
                    $('input[name=payMethod]').val(rsp.pay_method);
                    $('input[name=payDate]').val(rsp.paid_at);
                    $('input[name=receiptUrl]').val(rsp.receipt_url);
                    $('input[name=status]').val(rsp.status);
                    $('input[name=payment]').val(rsp.pg_provider);
                    $('#order-form').submit();
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: '결제에 실패하였습니다.',
                        text: '에러내용 : ' + rsp.error_msg,
                        confirmButtonColor: '#567ACE'
                    })
                }
            });
        } else {
            Swal.fire({
                icon: 'error',
                title: '잠깐!',
                text: '주문서 내용을 다시 확인해 주세요.',
                confirmButtonColor: '#567ACE'
            })
        }
    }

</script>
<script>
    // 주소 검색 후 넣어 주기
    $('.search-btn').click(function() {
        new daum.Postcode({
            oncomplete: function(data) {
                $('input[name=address1]').val(data.zonecode);
                $('input[name=address2]').val(data.address);
                $('input[name=address3]').focus();
            }
        }).open();
    })
</script>
</html>