    function requestPay() {
        IMP.init('imp04887484');
        IMP.request_pay({
        pg: "kakaopay",
        pay_method: "card",
        merchant_uid : 'merchant_'+new Date().getTime(),
        name : '결제테스트',
        amount : $('#payment-price').val(),
        buyer_email : 'iamport@siot.do',
        buyer_name : '구매자',
        buyer_tel : '010-1234-5678',
        buyer_addr : '서울특별시 강남구 삼성동',
        buyer_postcode : '123-456'
        }, function (rsp) { // callback
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                alert(msg);
                $('#order-form').submit();
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                alert(msg);
            }
        });
    }
  