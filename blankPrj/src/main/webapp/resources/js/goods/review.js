	$('#content-area').keyup(function (e){
        var content = $(this).val();
        $('#countReview').html(content.length + " 자 / 최대 200 자");

        if(content.length > 200) {
            alert("최대 200 자까지 입력 가능합니다.");
            $(this).val(content.substring(0, 200));
            $('countReview').html("200 / 최대 200 자");
        }
    })

    // 썸네일
    function readURL(input) {
        if(input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                if($('.review-modal-pic-preview').length == 0) {
                    $('#input-file-button').after("<div class=\"review-modal-pic-preview\"><img src=" + e.target.result + "></div>")
                } else {
                    $('.review-modal-pic-preview img').attr("src", e.target.result);
                }
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    // 점수 주면 별 개수 달라지게
    const drawStar = (target) => {
        document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
    }

    // 창 내려갈 때마다 top 현재 위치로 fixed 지정해 주기
    $(window).on("scroll",function() {
        $('.modal').css("top", $(window).scrollTop());
    });
    
    // x 버튼 누르면 꺼질 거
    $('#x-button').click(function() {
        $('#content-area').val("");
        $('input[name=score]').val(0);
        drawStar($('input[name=score]'));
        $('.modal').css("display", "none");
    })