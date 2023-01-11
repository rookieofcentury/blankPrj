<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blank</title>
<link rel="stylesheet" href="/blank/resources/css/goods/reviewDetail.css">
<script src="https://kit.fontawesome.com/77ad8525ff.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

    <div class="wrap">
        <div class="modal-container">
            <div class="name-date-area">
                <span class="review-writer">${review.writer}</span>
                <span>|</span>
                <span>${review.enrollDate}</span>
            </div>
            <div class="goods-info-area">
                <div class="goods-info-box">
                    <div>${goods.name}</div>
                    <div>&#x20A9; ${goods.price}</div>
                </div>
                <c:if test="${loginMember.nick == review.writer}">
                    <div class="btn-area">
                        <button onclick="editReview();">수정</button>
                        <button onclick="deleteReview();">삭제</button>
                    </div>
                </c:if>
            </div>
            <div class="review-modal-score">
                <span class="star">
                        ★★★★★
                    <span class="star-jjin">★★★★★</span>
                    <input type="hidden" name="hiddenNo" value="${review.no}">
                    <input type="hidden" name="hiddenMno" value="${loginMember.no}">
                    <input type="hidden" name="hiddenScore" value="${review.score}">
                    <input type="hidden" name="hiddenLike" value="${review.isLikeLm}">
                </span>
                <div class="review-like">
                    <input type="checkbox" class="likeCheck" id="likeCheck" onchange="reviewLike(this, '${review.no}'); cntUp(this);">
                    <label for="likeCheck"><i class="fa-solid fa-heart"></i></label><span>${review.like}</span></div>
            </div>
            <div class="review-modal-content">
                <div class="content-area">${review.content}</div>
            </div>
            <div class="review-img">
                <img src="/blank/resources/upload/review/${review.fileName}" onerror="this.parentNode.style.display='none';">
            </div>
        </div>
    </div>
    
</body>
<script src="/blank/resources/js/goods/reviewDetail.js"></script>
</html>