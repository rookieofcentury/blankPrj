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
    }) 

    /* CART 선택 삭제 */
    $('.delete-one').click(function() {
        var confirmOne = confirm("정말 삭제하시겠습니까?");

        if(confirmOne) {
            var array = new Array();

            $("input[class=chBox]:checked").each(function() {
                array.push($(this).attr("id"));
            })

            $.ajax({
                url: "/blank/goods/basket/delete",
                type: "post",
                data: {
                    chbox: array
                },
                success: function(data) {
                    console.log("success !");
                    $("input[class=chBox]:checked").parent().remove();
                }
            })
        }
    })

    /* CART 전부 삭제 */
    $('.delete-all').click(function() {
        var confirmOne = confirm("정말 삭제하시겠습니까?");

        if(confirmOne) {
            $.ajax({
                url: "/blank/goods/basket/delete",
                type: "post",
                data: {
                    chbox: 'all'
                },
                success: function() {
                    location.href = "/blank/goods/basket";
                }
            })
        }
            
    })

    /* 금액 계산 */
    function priceUpdate(data) {
        var price = data.parent().parent().prev().text();
        var parsePrice = stringNumberToInt(price);
        var calPrice = data.parent().parent().next().find('label');

        calPrice.text(data.val() * parsePrice);
    }
    
    /* 상품 총 금액 계산 */
    function productPrice() {
        var itemPrice = $('.item-price'); // 상품 총 금액
        console.log(itemPrice);

        var priceArr = new Array();
        itemPrice.each(function(index, item) {
            priceArr.push(item);
        })
        console.log(priceArr[0]);
        var total = 0;
        $.each(priceArr, function(index, item) {
            total += parseInt($(this).text());
            console.log(parseInt($(this).text()));
        })
        var productPrice = $('#product-price');
        productPrice.val(total);
    }

    /* 배송비 계산 */
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
    })

    /* 플러스 마이너스 버튼 누르면 값 바뀌게 */
    $('.minus-btn').click(function() {
        var nextCntInput = $(this).next();
        nextCntInput.val(String(parseInt(nextCntInput.val()) - 1));
        if(nextCntInput.val() <= 0) {
            alert('0 이하로는 입력할 수 없습니다!');
            nextCntInput.val(1);
        }
        priceUpdate(nextCntInput);
        productPrice();
        delieveryFee();
    })
    $('.plus-btn').click(function() {
        var prevCntInput = $(this).prev();
        prevCntInput.val(String(parseInt(prevCntInput.val()) + 1));
        if(prevCntInput.val() <= 0) {
            alert('0 이하로는 입력할 수 없습니다!');
            prevCntInput.val(1);
        }
        priceUpdate(prevCntInput);
        productPrice();
        delieveryFee();
    })

    /* 모두 체크 버튼 누르면 다 체크되게 */
    $('#all-check').click(function() {
        $('input[type=checkbox]').attr("checked", true);
    })

    /* 개수 바뀔 때마다 session의 Map 바꿔 주기 */
    function changeValue(no, quantity) {
        $.ajax({
            url: "/blank/goods/basket/change",
            method: "POST",
            data: {
                no: no,
                cnt: quantity
            },
            success: function(data) {
                console.log(data);
            },
            error: function() {
                console.log('error');
            }
        })
    }