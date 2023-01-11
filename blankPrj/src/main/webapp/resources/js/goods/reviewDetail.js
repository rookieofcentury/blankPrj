    $(document).ready(function() {
        // 팝업 창 크기를 HTML 크기에 맞추어 자동으로 크기를 조정하는 함수.
        var strWidth;
        var strHeight;

        //innerWidth / innerHeight / outerWidth / outerHeight 지원 브라우저 
        if ( window.innerWidth && window.innerHeight && window.outerWidth && window.outerHeight ) {
            strWidth = $('.wrap').outerWidth() + (window.outerWidth - window.innerWidth);
            strHeight = $('.wrap').outerHeight() + (window.outerHeight - window.innerHeight);
        }
        else {
            var strDocumentWidth = $(document).outerWidth();
            var strDocumentHeight = $(document).outerHeight();

            window.resizeTo ( strDocumentWidth, strDocumentHeight );

            var strMenuWidth = strDocumentWidth - $(window).width();
            var strMenuHeight = strDocumentHeight - $(window).height();

            strWidth = $('.wrap').outerWidth() + strMenuWidth;
            strHeight = $('.wrap').outerHeight() + strMenuHeight;
        }
        
        // resize
        window.resizeTo( strWidth, strHeight );

        $('.star-jjin').css("width", $('input[name=hiddenScore]').val() * 10 + "%");

        if($('input[name=hiddenLike]').val() != 0) {
            $('#likeCheck').attr("checked", true);
        }

        var nick = $('input[name=hiddenMno]').val();
        if(nick == '') {
            $('.likeCheck').prop("disabled", true);
        }
    });

    // 좋아요 숫자 up
    function cntUp(object) {
        var text = $(object).next().next().text();
        if($(object).is(":checked")) {
            $(object).next().next().text(parseInt(text) + 1);
        } else {
            $(object).next().next().text(parseInt(text) - 1);
        }
    }

    // 리뷰 좋아요 버튼 add, cancel
    function reviewLike(object, no) {
        if($(object).is(":checked")) {
            $.ajax({
                url: "/blank/goods/review/like/add",
                method: "POST",
                data: {
                    no: no,
                    mno: $('input[name=hiddenMno]').val()
                },
                success: function(data) {
                    console.log(data);
                },
                fail: function() {
                    console.log(fail);
                }
            })
        } else {
            $.ajax({
                url: "/blank/goods/review/like/cancel",
                method: "POST",
                data: {
                    no: no,
                    mno: $('input[name=hiddenMno]').val()
                },
                success: function(data) {
                    console.log(data);
                },
                fail: function() {
                    console.log(fail);
                }
            })
        }
    }

    // 수정하러 가기
    function editReview() {
        Swal.fire({
            title: '리뷰를 수정하러 가시겠어요?',
            text: "점검 부탁드립니다!",
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#567ACE',
            cancelButtonColor: '#d33',
            confirmButtonText: '수정하러 가기',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                location.href='/blank/goods/review/edit?no=' + $('input[name=hiddenNo]').val()
            }
        })
    }

    // 삭제하기
    function deleteReview() {
        Swal.fire({
            title: '리뷰를 삭제하시겠어요?',
            text: "정말 삭제하실 건가요? 복구할 수 없어요.",
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#567ACE',
            cancelButtonColor: '#d33',
            confirmButtonText: '삭제하기',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "/blank/goods/review/delete",
                    method: "post",
                    data: {
                        no: $('input[name=hiddenNo]').val()
                    },
                    success: function(data) {
                        console.log(data);
                    }
                })
            }
            window.close();
        })
    }