    <!-- CART 선택 삭제 -->
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