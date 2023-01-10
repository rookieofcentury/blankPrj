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
        })
        
        // 가격 다 모아서 => 상품 금액 넘기기
        productPrice();

        // 배송비 설정
        delieveryFee();

        // 총계 설정
        totalPriceCalc();
    }) 

    /* CART 선택 삭제 */
    $('.delete-one').click(function() {
        var confirmOne = confirm("정말 삭제하시겠습니까?");

        if(confirmOne) {
            var array = new Array();

            $("input[class=chBox]:checked").each(function() {
                array.push($(this).attr("id"));
            })
            console.log(array);

            $.ajax({
                url: "/blank/goods/basket/delete",
                type: "post",
                tranditional: true,
                data: {
                    chbox: array
                },
                success: function(data) {
                    $("input[class=chBox]:checked").parent().parent().remove();
                    productPrice();
                    delieveryFee();
                    totalPriceCalc();
                    location.href = "/blank/goods/basket";
                }
            })
        }
    })

    /* CART 전부 삭제 */
    $('.delete-all').click(function() {
        var confirmOne = confirm("정말 삭제하시겠습니까?");
        var array = new Array();
        
        $("input[class=chBox]").each(function() {
                array.push($(this).attr("id"));
        })
        console.log(array);

        if(confirmOne) {
            $.ajax({
                url: "/blank/goods/basket/delete",
                type: "post",
                tranditional: true,
                data: {
                	chbox: array
                },
                success: function(data) {
                    location.href = "/blank/goods/basket";
                }
            })
        }
            
    })

    /* 금액 계산 함수 */
    function priceUpdate(data) {
        var price = data.parent().parent().prev().text();
        var parsePrice = stringNumberToInt(price);
        var calPrice = data.parent().parent().next().find('label');

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
        console.log(productPrice.val());
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

    // ,로 나뉘어진 숫자를 콤마 없이 출력하는 함수
    function stringNumberToInt(stringNumber){
        return parseInt(stringNumber.replace(/,/g , ''));
    }

    /* 수량 입력했을 때 */
    cntArrItem.on("change", function() {

        // 0 이하로 내려가면 바로 1로 바뀌게 min 값 추가
        if($(this).val() == 0) {
            alert("0 이하로는 입력할 수 없습니다!");
            $(this).val(1);
        }
        priceUpdate($(this));
        productPrice();
        delieveryFee();
        totalPriceCalc();
    })

    /* 플러스 마이너스 버튼 누르면 값 바뀌게 */
    function minusBtnEvent (object, no) {
        var nextCntInput = $(object).next();
        nextCntInput.val(String(parseInt(nextCntInput.val()) - 1));
        if(nextCntInput.val() <= 0) {
            alert('0 이하로는 입력할 수 없습니다!');
            nextCntInput.val(1);
        }
        changeValue(no, nextCntInput.val());
        priceUpdate(nextCntInput);
        productPrice();
        delieveryFee();
        totalPriceCalc();
    }
    function plusBtnEvent (object, no) {
        var prevCntInput = $(object).prev();
        prevCntInput.val(String(parseInt(prevCntInput.val()) + 1));
        if(prevCntInput.val() <= 0) {
            alert('0 이하로는 입력할 수 없습니다!');
            prevCntInput.val(1);
        }
        changeValue(no, prevCntInput.val());
        priceUpdate(prevCntInput);
        productPrice();
        delieveryFee();
        totalPriceCalc();
    }

    /* 모두 체크 버튼 누르면 다 체크되고, 다시 누르면 해제되게 */
    $('#all-check').click(function() {
        if($('#all-check').is(":checked")) {
            $('input[type=checkbox]').attr('checked', true);
        } else {
            $('input[type=checkbox]').attr('checked', false);
        }
    })

    /* 개수 바뀔 때마다 session의 Map 바꿔 주기 */
    function changeValue(no, quantity) {
        $.ajax({
            url: "/blank/goods/basket/change",
            method: "POST",
            data: {
                no: no,
                quantity: quantity
            },
            success: function(data) {
                console.log(data);
            },
            error: function() {
                console.log('error');
            }
        })
    }

    /* 일정 scroll 이상 내려가면 가격창 fixed */
    var cartInfo = $(".cart-info");
    $(window).scroll(function(){
        cartInfo.css("top", $(this).scrollTop());
    });

    /* 배송비 안내 문구 */
    $('.error').hover(function() {
        $('.info-ment').css("display", "flex");
    }, function() {
        $('.info-ment').css("display", "none");
    })