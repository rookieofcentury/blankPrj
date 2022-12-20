<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blank</title>
<link rel="stylesheet" href="/blank/resources/css/goods/review.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

    <div class="modal">
        <form action="/blank/goods/review/write" method="POST">
            <div class="modal-container">
                <div class="modal-goods-info">
                    <div>
                        <img src="" alt="img">
                    </div>
                    <div>
                        <span>무릎담요</span>
                        <span>24,000</span>
                        <span>리뷰 <span>3</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 평점 <span>5.0</span></span>
                    </div>
                </div>
                <div class="review-modal-score">
                    <span>상품은 어떠셨나요?</span>
                    <span class="star">
                       	 ★★★★★
                        <span>★★★★★</span>
                        <input type="range" name="score" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                    </span>
                </div>
                <div class="review-modal-content">
                    <textarea name="content" id="content-area" cols="30" rows="10" placeholder="자세한 후기는 다른 고객의 구매에 많은 도움이 되며, 오해의 소지가 있는 내용을 작성 시 검토 후 비공개 조치될 수 있습니다. 반품/환불 문의는 1:1 문의로 가능합니다."></textarea>
                    <span id="countReview">0 자 / 최대 200 자</span>
                </div>
                <div class="review-modal-pic">
                    <div>
                        <span>사진 등록</span>
                        <span>0 장 / 최대 2 장</span>
                    </div>
                    <div>
                        <label id="input-file-button" for="input-file"> + </label>
                        <input type="file" id="input-file" onchange="readURL(this);">
                        <input type="submit" value="작성하기" id="submit-button">
                    </div>
                </div>
            </div>
        </form>
    </div>
    
</body>
<script src="/blank/resources/js/goods/review.js"></script>
</html>