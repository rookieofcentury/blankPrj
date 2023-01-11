<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blank</title>
<link rel="stylesheet" href="/blank/resources/css/goods/reviewEdit.css">
<script src="https://kit.fontawesome.com/77ad8525ff.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

    <form action="/blank/goods/review/edit" method="post" enctype="multipart/form-data">
    <div class="modal">
        <div class="modal-container">
            <div></div>
            <div class="modal-goods-info">
                <div class="goods-review-img">
                    <img src="/blank/resources/upload/goods/${goods.thumbnail[0]}" alt="img">
                </div>
                <div>
                    <span>${goods.name}</span>
                    <span>&#x20A9; <span>${goods.price}</span></span>
                    <span>리뷰 <span class="review-total-cnt">${goods.reviewCnt}</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 평점 <span class="review-total-score">${goods.reviewScore}</span></span>
                </div>
            </div>
            <input type="hidden" name="no" value="${review.no}">
            <div class="review-modal-score">
                <span>상품은 어떠셨나요?</span>
                <span class="star">
                        ★★★★★
                    <span class="star-jjin">★★★★★</span>
                    <input type="range" name="score" oninput="drawStar(this)" value="${review.score}" step="1" min="0" max="10" required>
                </span>
            </div>
            <div class="review-modal-content">
                <textarea name="content" id="content-area" cols="30" rows="10" placeholder="자세한 후기는 다른 고객의 구매에 많은 도움이 되며, 오해의 소지가 있는 내용을 작성 시 검토 후 비공개 조치될 수 있습니다. 반품/환불 문의는 1:1 문의로 가능합니다.">${review.content}</textarea>
                <span id="countReview">0 자 / 최대 200 자</span>
            </div>
            <div class="review-modal-pic">
                <div>
                    <span>사진 등록</span>
                    <span><label id="file-cnt">0</label> 장 / 최대 1 장</span>
                </div>
                <div>
                    <label id="input-file-button" for="input-file"> + </label>
                    <input multiple="multiple" type="file" id="input-file" name="reviewFile" onchange="readURL(this);">
                    <input type="submit" id="submit-button" value="수정하기">
                </div>
            </div>
        </div>
    </div>
</form>

</body>
<script src="/blank/resources/js/goods/reviewEdit.js"></script>
<script>
    $(document).ready(function() {
        var file = '${review.fileName}';
        if(file != '') {
            $('#input-file-button').after("<div class=\"review-modal-pic-preview\"><img src='/blank/resources/upload/review/" + file + "'><div class='x-button'>ㅡ</div></div>")

            // x 버튼 누르면 이미지 DB에서 삭제
            $('.x-button').click(function() {
                Swal.fire({
                    title: '사진을 삭제하시겠어요?',
                    text: '서버에서 바로 삭제됩니다.',
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#567ACE',
                    confirmButtonText: '이동하기'
                }).then((result) => {
                    if(result.isConfirmed) {
                        $.ajax ({
                            url: "/blank/goods/review/attachment/delete",
                            method: "POST",
                            data: {
                                no: $('input[name=no]').val()
                            },
                            success: function(a) {
                                Swal.fire({
                                    icon: 'info',
                                    title: '삭제되었습니다.',
                                    text: '성공적으로 삭제되었습니다.',
                                    confirmButtonColor: '#567ACE'
                                })
                            }
                        })
                        $(this).parent().remove();
                    }
                })
            });
        }
        var content = $('#content-area').val();
        $('#countReview').html(content.length + " 자 / 최대 200 자");
        $('#file-cnt').text($('.review-modal-pic-preview').length);
    })
</script>
</html>