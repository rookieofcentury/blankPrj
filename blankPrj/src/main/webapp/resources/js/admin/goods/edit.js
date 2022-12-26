// 사진 삭제
$('.delete-pic-btn').click(function() {

    // img src에서 filename 추출해서 변수 선언
    var imgsrc = $(this).prev().attr("src");
    var filename = imgsrc.substr(30, 25);

    // SWEETALERT 알림창 띄우기
    Swal.fire({
        title: '이미지를 삭제하시겠어요?',
        text: "취소 후에는 재업로드를 해 주셔야 해요!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '삭제해 주세요!',
        cancelButtonText: '취소'
      }).then((result) => {
        if (result.isConfirmed) {
            $(this).parent().remove();
            $('.thumbnail-area').append('<input type="hidden" name="delete" value="' + filename + '">');
        }
      })
})