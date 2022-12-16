	$('#content-area').keyup(function (e){
        var content = $(this).val();
        $('#countReview').html(content.length + " 자 / 최대 200 자");

        if(content.length > 200) {
            alert("최대 200 자까지 입력 가능합니다.");
            $(this).val(content.substring(0, 200));
            $('countReview').html("200 / 최대 200 자");
        }
    })

    function readURL(input) {
        if(input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#input-file-button').after("<div class=\"review-modal-pic-preview\"><img src=" + e.target.result + "></div>")
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    const drawStar = (target) => {
        document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
    }