<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>Blank</title>
<link rel="stylesheet" href="/blank/resources/css/goods/order.css">
</head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                                <td class="order-num"></td>
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
                                <td onclick="callReceipt();">확인하러 가기</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div>
                    <div class="title-area">
                        <span class="title">배송 정보</span>
                        <input type="checkbox" name="delivery-form-btn" id="delivery-change-btn"><label for="delivery-change-btn" id="change-btn">변경</label><button>취소</button>
                    </div>
                    <div class="delivery-info">
                        <div>받는 분</div>
                        <div><input type="text" name="name" value="${pay.name}" readonly></div>
                        <div>휴대폰 번호</div>
                        <div><input type="tel" name="phone" id="phone" placeholder="00*-000*-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13" value="${pay.phone}" readonly></div>
                        <div class="address-area">주소</div>
                        <div class="address-search">
                            <input type="text" name="address1" value="${pay.address1}" id="postcode" readonly>
                            <button class="search-btn flex" disabled>검색</button>
                        </div>
                        <div><input type="text" name="address2" value="${pay.address2}" readonly></div>
                        <div><input type="text" name="address3" value="${pay.address3}" readonly></div>
                        <div>배송 메시지</div>
                        <div><input type="text" name="message" placeholder="20자 내로 작성해 주세요." value="${pay.message}" readonly></div>
                    </div>
                    <div class="warn-message"><i class="fa-solid fa-triangle-exclamation"></i> 주문 상품 확인 및 결제 취소는 마이페이지에서 진행해 주세요.</div>
                    <div id="order-mypage" class="flex" onclick="location.href='/blank/member/mypage'">주문 배송 조회</div>
                </div>
            </div>

            <div class="rec-box">
                <div class="rec-area">
                    <div>
                        <span>이런 상품은 어떠세요?</span>
                        <div class="under-bar"></div>
                    </div>
                    <div id="back-home-btn" onclick="location.href='/blank/goods'">홈으로 돌아가기</div>
                </div>
                <div class="goods-list">
                    <c:forEach items="${fourList}" var="item">
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

        </div>

    </div>

    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
<script>

    $(document).ready(function() {
        console.log('${pay.message}');
        var payDate = '${pay.payDate}';
        $('.order-num').text('B-' + Date.parse(payDate));
    })

    $('#delivery-change-btn').click(function() {
    if($('#delivery-change-btn').is(':checked')) {
        $('.delivery-info input').prop("readonly", false);
        $('input[name=name]').focus();
        $('.search-btn').attr("disabled", false);
    } else {
        Swal.fire({
            title: '주소를 변경하시겠어요?',
            text: "내용 점검 부탁드립니다!",
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#567ACE',
            cancelButtonColor: '#d33',
            confirmButtonText: '작성하기',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "/blank/goods/payment/address/change",
                    method: "post",
                    data: {
                        no: '${pay.no}',
                        name: $('input[name=name]').val(),
                        phone: $('input[name=phone]').val(),
                        address1: $('input[name=address1]').val(),
                        address2: $('input[name=address2]').val(),
                        address3: $('input[name=address3]').val(),
                        message: $('input[name=message]').val()
                    },
                    success: function(data) {
                        if(data == 1) {
                            Swal.fire({
                                title: '수정 완료!',
                                text: '성공적으로 수정되었습니다.',
                                icon: 'info',
                                confirmButtonColor: '#567ACE'
                            })
                        }
                    }
                })
            }
        })
        $('.delivery-info input').prop("readonly", true);
        $('.search-btn').attr("disabled", true);
    }
})
</script>
<script>
    // 주소 검색 후 넣어 주기
    $('.search-btn').click(function() {
        new daum.Postcode({
            oncomplete: function(data) {
                $('input[name=address1]').val(data.zonecode);
                $('input[name=address2]').val(data.address);
                $('input[name=address3]').val("");
                $('input[name=address3]').focus();
            }
        }).open();
    })

    // 영수증 보기
    function callReceipt() {
		var url = "${pay.receiptUrl}";
		var name = "영수증 보기";
		var option = "width = 100%, height = 100%, location = yes"
		window.open(url, name, option);
	}
</script>
<script>
    function cancelPay() {
    $.ajax({
        url: "/blank/goods/order/cancel",
        method: "POST",
        data: {
            merchant_uid: '${pay.metchantUid}',
            cancel_request_amount: '${pay.totalPrice}',
            reason: '${}',
        },
        success: {

        }
    })
  }
</script>
</html>