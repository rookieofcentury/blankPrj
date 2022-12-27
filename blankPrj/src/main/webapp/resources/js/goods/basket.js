    /* CART 선택 삭제 */
    $('.delete-one').click(function() {
        var confirmOne = confirm("정말 삭제하시겠습니까?");

        if(confirmOne) {
            var array = new Array();

            $("input[class='chBox':checked").each(function() {
                array.push($(this).attr("data-cartNum"));
            })

            $.ajax({
                url: "/goods/cart/delete",
                type: "post",
                data: {chbox:array},
                success: function() {
                    location.href = "/goods/cart";
                }
            })
        }
    })

    /* 플러스 마이너스 버튼 누르면 값 바뀌게 */
    $('.minus-btn').click(function() {
        var nextCntInput = $(this).next();
        nextCntInput.val(String(parseInt(nextCntInput.val()) - 1));
    })
    $('.plus-btn').click(function() {
        var prevCntInput = $(this).prev();
        prevCntInput.val(String(parseInt(prevCntInput.val()) + 1));
    })

    /* 개수 바뀔 때마다 값 계산해서 바꿔 주기 */
    $('input[name=cnt]').on("change", function() {
        
    })

    /* 모두 체크 버튼 누르면 다 체크되게 */
    $('#all-check').click(function() {
        $('input[type=checkbox]').attr("checked", true);
    })