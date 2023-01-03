    /* name=cnt 변수 선언 */
    var cntArrItem = $('input[name=cnt]');
    var cntArr = new Array();
    cntArrItem.each(function(index, item) {
        cntArr.push($(item));
    })

    $(document).ready(function() {
        // 수량 * 가격 => 합계 넣기
        $.each(cntArr, function(index, item) {
            priceUpdate(item);
        });

        // 가격 다 모아서 => 상품 금액 넘기기
        productPrice();

        // 배송비 설정
        delieveryFee();

        // 총계 설정
        totalPriceCalc();

        // 최종 결제 금액 부여
        getPaymentPrice();
    });

    // ,로 나뉘어진 숫자를 콤마 없이 출력하는 함수
    function stringNumberToInt(stringNumber){
        return parseInt(stringNumber.replace(/,/g , ''));
    }

    /* 금액 계산 함수 */
    function priceUpdate(data) {
        var price = data.parent().parent().prev().children(':first').text();
        var parsePrice = stringNumberToInt(price);
        var calPrice = data.parent().parent().next().children(':first');

        calPrice.text(data.val() * parsePrice);
    }

    /* 상품 총 금액 계산 함수 */
    function productPrice() {
        var itemPrice = $('.item-price'); // 상품 총 금액

        var priceArr = new Array();
        itemPrice.each(function(index, item) {
            priceArr.push(item);
        })

        var total = 0;
        $.each(priceArr, function(index, item) {
            total += parseInt($(this).text());
        })

        var productPrice = $('#product-price');
        productPrice.val(total);
    }

    /* 배송비 계산 함수 */
    function delieveryFee() {
        var delFee = $('#del-fee');
        var productPrice = $('#product-price'); // 상품 총 금액
        if(parseInt(productPrice.val()) <= 70000) {
            delFee.val('3000');
        } else {
            delFee.val(0);
        }
    }

    /* 총계 계산 함수 */
    function totalPriceCalc() {
        $('#total-price').val(parseInt($('#product-price').val()) + parseInt($('#del-fee').val()));
    }

    /* 최종 결제 금액 */
    function getPaymentPrice() {
        var totalPriceVal = stringNumberToInt($('#total-price').val());
        var usePointVal = $('#use-point').val();
        $('#payment-price').val(totalPriceVal - usePointVal);
    }

    /* 휴대 전화 번호 하이픈 추가 */
    const autoHyphen = (target) => {
        target.value = target.value
          .replace(/[^0-9]/g, '')
          .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
    }

    /* 휴대 전화 번호 하이픈 제거 */
    function phoneFormat(phoneNumber) {
        // 특수문자 제거
        const value = phoneNumber.replace(/[^0-9]/g, '');
        
        // 00 OR 000 지정
        const firstLength = value.length > 9 ? 3 : 2;
      
        // ({2,3}) - ({3,4}) - ({4})
        return [
          // 첫번째 구간 (00 or 000)
          value.slice(0, firstLength),
          // 두번째 구간 (000 or 0000)
          value.slice(firstLength, value.length - 4),
          // 남은 마지막 모든 숫자
          value.slice(value.length - 4),
        ].join('-');
    }

    // 보유 포인트 이상 타이핑 금지
    $('#use-point').keyup(function() {
        var userPoint = parseInt($('.user-point').text());
        console.log(userPoint);
        if($('#use-point').val() > userPoint) {
            alert('보유한 포인트 이상 입력 불가');
            $('#use-point').val(0);
        }
        getPaymentPrice();
    })