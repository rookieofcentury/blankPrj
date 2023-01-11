    $(document).ready(function() {
        // 팝업 창 크기를 HTML 크기에 맞추어 자동으로 크기를 조정하는 함수.
        var strWidth;
        var strHeight;

        //innerWidth / innerHeight / outerWidth / outerHeight 지원 브라우저 
        if ( window.innerWidth && window.innerHeight && window.outerWidth && window.outerHeight ) {
            strWidth = $('.modal').outerWidth() + (window.outerWidth - window.innerWidth);
            strHeight = $('.modal').outerHeight() + (window.outerHeight - window.innerHeight);
        }
        else {
            var strDocumentWidth = $(document).outerWidth();
            var strDocumentHeight = $(document).outerHeight();

            window.resizeTo ( strDocumentWidth, strDocumentHeight );

            var strMenuWidth = strDocumentWidth - $(window).width();
            var strMenuHeight = strDocumentHeight - $(window).height();

            strWidth = $('.modal').outerWidth() + strMenuWidth;
            strHeight = $('.modal').outerHeight() + strMenuHeight;
        }
        
        // resize
        window.resizeTo( strWidth, strHeight );

        $('.star-jjin').css("width", $('input[name=score]').val() * 10 + "%");

    });

    $('#content-area').keyup(function() {
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

    $('#input-file').click(function() {
        if($('.review-modal-pic-preview').length != 0) {
            Swal.fire({
                icon: 'error',
                title: '한 장만 넣을 수 있습니다.',
                text: '썸네일을 삭제하고 다시 진행해 주세요!',
                confirmButtonColor: '#567ACE'
            })
        }
    });

	/* 파일 등록되면 label 바뀜 */
	$('input[name=reviewFile]').change(function() {
		console.log($(this).val());
		var text = "0";
		if($(this).val() != null) {
			text = "1";
		}
		$('#file-cnt').text(text);
	})