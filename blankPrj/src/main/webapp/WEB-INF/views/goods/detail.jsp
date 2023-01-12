<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Blank</title>
<link rel="stylesheet" href="/blank/resources/css/goods/detail.css">
<link rel="stylesheet" href="/blank/resources/css/goods/review.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   <script>
       Kakao.init('4cca08bc633d6646753296f4efd16743');
       Kakao.isInitialized();  
   </script>
<script src="https://kit.fontawesome.com/77ad8525ff.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
</head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

    <%@ include file = "/WEB-INF/views/common/header.jsp" %>
    
    <div class="wrap">
        
        <div class="container">
            <div class="goods-category"><a href="/blank/goods"><i class="fa-solid fa-house"></i></a> <span class="goodsCate" onclick="goSearch();">${goods.category}</span></div>
            <div class="goods-info">
                <div>${goods.name}</div>
                <div>
                    <div class="image-box"><img src="/blank/resources/upload/goods/${goods.thumbnail[0]}" alt=""></div>
                    <div>
                        <form action="/blank/goods/payment" method="post" id="payment-form">
                            <div id="info">
                                <input type="hidden" name="no" value="${goods.no}">
                                <div>판매가</div>
                                <div><span id="vo-price"><fmt:formatNumber pattern="###,###,###" value="${goods.price}"/></span> 원</div>
                                <div>배송료</div>
                                <div>유료 (70,000 원 이상 구매 시 무료)</div>
                                <div></div>
                                <div></div>
                                <div>수량</div>
                                <div class="cnt-area">
                                    <div class="cnt-btn minus-btn"><i class="fa-solid fa-minus fa-xs"></i></div>
                                    <input type="number" name="quantity" value="1" min="1" max="${goods.stock}">
                                    <div class="cnt-btn plus-btn"><i class="fa-solid fa-plus fa-xs"></i></div>
                                </div>
                            </div>
                            <c:if test="${goods.stock >= 1}">
                            <div class="btn-block">
                                <div class="btn-area">
                                    <span>총 <span class="goods-cnt-box">1</span> 개</span>
                                    <span><span id="final-pay"><fmt:formatNumber pattern="###,###,###" value="${goods.price}"/></span> 원</span>
                                </div>
                                <div class="btn-area">
                                    <div class="btn-white" onclick="addBasket();">장바구니 담기</div>
                                    <div class="btn-main" id="buy-now">바로 구매</div>
                                    <div class="btn-white share-btn" id="share-btn" onclick="Kakao.Share.createScrapButton();"><i class="fa-solid fa-share-nodes"></i></div>
                                </div>
                            </div>
                            </c:if>
                        </form>
                        <c:if test="${goods.stock == 0}">
                            <div class="no-stock-info flex">현재 재고가 없어 주문할 수 없는 상품입니다.</div>
                            <div class="btn-area">
                                <div class="btn-white stock-alert flex"><i class="fa-sharp fa-solid fa-bell"></i>&nbsp;&nbsp;재입고 알림 받기</div>
                                <div class="btn-white share-btn" id="share-btn" onclick="Kakao.Share.createScrapButton();"><i class="fa-solid fa-share-nodes"></i></div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <div>
                <div class="content-menu">
                    <label class="btn-obj"><input type="radio" name="buttons" value="info" id="info-btn"><span>상품 소개</span></label>
                    <label class="btn-obj"><input type="radio" name="buttons" value="return" id="return-btn"><span>반품 정책</span></label>
                    <label class="btn-obj"><input type="radio" name="buttons" value="review" id="review-btn"><span>후기</span></label>
                </div>
            </div>
            <div>
                <div class="content">
                    <div class="pd-intro">
                        ${goods.content}
                    </div>
                    <div class="pd-return">
                        <textarea readonly>크라우드 펀딩에 대한 안내

후원은 구매가 아닌 창의적인 계획에 자금을 지원하는 일입니다.
전자상거래법상 통신판매는 소비자의 청약 전 규격, 제조연월일 등 구체적인 상품 정보 제공이 가능한 것을 대상으로 합니다. 따라서 텀블벅에서의 후원은 통신판매에 해당하지 않고, 전자상거래법 및 소비자보호규정(수령 후 7일 내 청약철회 등)이 적용되지 않습니다.
프로젝트는 계획과 달리 진행될 수 있습니다.

예상을 뛰어넘는 멋진 결과가 나올 수 있지만 진행 과정에서 계획이 지연, 변경되거나 무산될 수도 있습니다. 본 프로젝트를 완수할 책임과 권리는 창작자에게 있습니다.

모든 프로젝트 공통

- 펀딩 종료일 후에는 즉시 제작 및 실행에 착수하는 프로젝트 특성상 단순 변심에 의한 후원금 환불이 불가능합니다.

- 예상 전달일로부터 10일 이상 선물 전달이 이뤄지지 않을 경우, 환불을 원하시는 분들께는 수수료를 포함한 후원금을 환불해드립니다.
(플랫폼 수수료: 모금액의 5%, 부가세 별도 / 결제 수수료: 결제 성공액의 3%, 부가세 별도 )

- 선물 전달을 위한 배송지 및 서베이 답변은 2022. 12. 13에 일괄 취합할 예정입니다.

- 이후 배송지 변경이나 서베이 답변 변경을 원하실 때는 ‘창작자에게 문의하기’로 개별 문의하셔야 합니다.

배송이 필요한 선물

- 파손 또는 불량품 수령 시 영업일 수 7일 이내로 교환이 가능합니다.
- 교환 및 AS 문의는 ‘창작자에게 문의하기’로 신청해주세요.
- 파손이나 불량품 교환 시 발생하는 비용은 창작자가 부담합니다. 선물 확인을 위한 포장 훼손 외에 아이템의 가치가 훼손된 경우에는 교환 및 환불이 불가합니다.
- 책 파손
- 후원 선물 박스 깨짐
- 후원자가 배송지를 잘못 기재하거나 창작자에게 사전 고지 없이 배송지를 수정해 배송사고가 발생할 경우 창작자는 책임을 지지 않습니다.</textarea>
                    </div>
                    <div class="pd-review">
                        <div class="pd-review-info">
                            <div>
                                <span>전체 상품 후기 수</span>
                                <div><i class="fa-solid fa-comment-dots fa-2x"></i></div>
                                <span><span class="review-total-cnt"></span> 건</span>
                            </div>
                            <div>
                                <span>총 평점</span>
                                <div id="avg">★★★★★<span>★★★★★</span></div>
                                <span><span class="review-total-score"></span> / 5.0 </span>
                            </div>
                        </div>
                        <div class="review-menu">
                            <div id="review-write-btn"><i class="fa-solid fa-pen"></i> 글쓰기</div>
                            <div class="align-standard">
                                <div><label class="standard"><input type="radio" name="standard" value="popular" checked><span>인기순</span></label></div>
                                <div><label class="standard"><input type="radio" name="standard" value="new"><span>최신순</span></label></div>
                                <div><label class="standard"><input type="radio" name="standard" value="high"><span>평점높은순</span></label></div>
                                <div><label class="standard"><input type="radio" name="standard" value="low"><span>평점낮은순</span></label></div>
                            </div>
                        </div>
                        <div class="review-list-area">

                        </div>
                        <div class="review-page-area">
                            <c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}" >
                                <div class="page">${num}</div>    
                            </c:forEach>
                            <c:if test="${pageVo.listCount == 0}">
                                <div class="page">1</div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    
    <form id="fileForm" method="post" enctype="multipart/form-data">
        <input type="hidden" name="writer" value="${loginMember.no}">
        <input type="hidden" name="goods" value="${goods.no}">
        <div class="modal">
            <div class="modal-container">
                <div><button id="x-button"><i class="fa-solid fa-xmark"></i></button></div>
                <div class="modal-goods-info">
                    <div class="goods-review-img">
                        <img src="/blank/resources/upload/goods/${goods.thumbnail[0]}" alt="img">
                    </div>
                    <div>
                        <span>${goods.name}</span>
                        <span>&#x20A9; <span>${goods.price}</span></span>
                        <span>리뷰 <span class="review-total-cnt"></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 평점 <span class="review-total-score"></span></span>
                    </div>
                </div>
                <div class="review-modal-score">
                    <span>상품은 어떠셨나요?</span>
                    <span class="star">
                            ★★★★★
                        <span>★★★★★</span>
                        <input type="range" name="score" oninput="drawStar(this)" value="1" step="1" min="0" max="10" required>
                    </span>
                </div>
                <div class="review-modal-content">
                    <textarea name="content" id="content-area" cols="30" rows="10" placeholder="자세한 후기는 다른 고객의 구매에 많은 도움이 되며, 오해의 소지가 있는 내용을 작성 시 검토 후 비공개 조치될 수 있습니다. 반품/환불 문의는 1:1 문의로 가능합니다."></textarea>
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
                        <label id="submit-button">작성하기</label>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>
</body>
<script src="/blank/resources/js/goods/detail.js"></script>
<script src="/blank/resources/js/goods/review.js"></script>
<script>
    Kakao.Share.createScrapButton({
	  container: '#share-btn',
	  requestUrl: 'http://localhost:8888/blank/goods/detail',
	});

    // 카테고리별 이동
    function goSearch() {
        var gCate = $('.goodsCate').text();
        if(gCate == "리빙/가전") {
            location.href='/blank/goods/search?category=1';
        } else if(gCate == "패션잡화") {
            location.href='/blank/goods/search?category=2';
        } else if(gCate == "문구류") {
            location.href='/blank/goods/search?category=3';
        } else if(gCate == "오피스") {
            location.href='/blank/goods/search?category=4';
        } else {
            location.href='/blank/goods/search?category=5';
        }
    }

    // 장바구니 추가
    function addBasket() {
        Swal.fire({
            title: '장바구니에 넣으시겠어요?',
            text: "${goods.name} " + $('input[name=quantity').val() + '개를 장바구니에 넣습니다.',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#567ACE',
            cancelButtonColor: '#d33',
            confirmButtonText: '장바구니 담기',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "/blank/goods/basket/add",
                    method: "POST",
                    data: {
                        no: '${goods.no}',
                        cnt: $('input[name=quantity]').val()
                    },
                    success: function(data) {
                        Swal.fire({
                            title: '장바구니에 넣었습니다!',
                            text: '즐거운 쇼핑 되세요!',
                            icon: 'info',
                            confirmButtonColor: '#567ACE'
                        })
                    },
                    error: function() {
                        console.log('error');
                    }
                })
            }
        })
    }

    // 바로 구매 버튼
    $('#buy-now').click(function() {
        var nick = '${loginMember.nick}';
        if(nick == '') {
            Swal.fire({
                title: '로그인이 필요합니다!',
                text: '로그인 창으로 이동합니다.',
                icon: 'info',
                showCancelButton: false,
                confirmButtonColor: '#567ACE',
                confirmButtonText: '이동하기'
            }).then((result) => {
                location.href='/blank/member/login'
            })
        } else {
            Swal.fire({
                title: '바로 구매하시겠어요?',
                text: "다른 상품들이 많이 기다리고 있어요!",
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#567ACE',
                cancelButtonColor: '#d33',
                confirmButtonText: '바로 구매',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    
                    var noArr = new Array();
                    var noVal = $('input[name=no]').val();
                    noArr.push(noVal);
                    $('#payment-form').submit();

                }
            })
        }
    })
</script>
<script>
    
    // 리뷰 작성 버튼 눌렀을 때 로그인 안 됐으면 로그인 먼저, 아닐 시 modal 창 열리기
    $('#review-write-btn').click(function() {
        var nick = '${loginMember.nick}';
        if(nick == '') {
            Swal.fire({
                title: '로그인이 필요합니다!',
                text: '로그인 창으로 이동합니다.',
                icon: 'info',
                showCancelButton: true,
                confirmButtonColor: '#567ACE',
                confirmButtonText: '이동하기'
            }).then((result) => {
                if(result.isConfirmed) {
                    location.href='/blank/member/login'
                }
            })
        } else {
            $('.modal').css("top", $(window).scrollTop());
            $('.modal').css("display", "flex");
        }
    })

    // 리뷰 작성 ajax
    $('#submit-button').click(function() {
        Swal.fire({
            title: '리뷰를 작성하시겠어요?',
            text: "내용 점검 부탁드립니다!",
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#567ACE',
            cancelButtonColor: '#d33',
            confirmButtonText: '작성하기',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                var form = $('#fileForm')[0];
                var formData = new FormData(form);
                $.ajax({
                    url: "/blank/goods/review/write",
                    enctype: 'multipart/form-data',
                    method: "POST",
                    data: formData,
                    processData: false,	// 필수
                    contentType: false,	// 필수
                    cache: false,
                    success: function(data) {
                        $('#content-area').val("");
                        $('input[name=score]').val(0);
                        $('.star span').css("width", $('input[name=score]').val() * 10 + '%');
                        $('.modal').css("display", "none");
                        Swal.fire({
                            title: '작성 완료!',
                            text: '지금 내 리뷰를 확인해 보세요!',
                            icon: 'info',
                            confirmButtonColor: '#567ACE'
                        })
                        reviewTotal();
                        reviewList();
                    },
                    error: function() {
                        console.log('error');
                    }
                })
            }
        })
    })

    // 리뷰 버튼 => 리스트 불러오기
    $('#review-btn').click(function() {
        reviewTotal();
        reviewList();
    })

    // 리뷰 개수, 평균 score 계산
    function reviewTotal() {
        $.ajax({
            url: "/blank/goods/review/cnt",
            method: "POST",
            data: {
                no: '${goods.no}'
            },
            success: function(data) {
                for(var i = 0; i < data.length; i++) {
                    var map = data[i];
                    $('.review-total-cnt').text(map.REVIEW_CNT);
                    $('.review-total-score').text(map.REVIEW_SCORE);
                    if(map.REVIEW_SCORE == null) {
                        $('.review-total-score').text("0.0");
                    }
                    $('#avg span').css("width", map.REVIEW_SCORE * 2 * 10 + '%');
                }
            }
        })
    }

    // 기준 누르면 list 바뀌게!
    $('.standard').click(function() {
        reviewList();
    })

    // 페이지 누르면 페이지마다 list 바뀌게
    $('.page').click(function() {
        reviewList($(this).text());
    })

    // 리뷰 리스트 ajax
    function reviewList() {
        $.ajax({
            url: "/blank/goods/review/list",
            method: "POST",
            data: {
                no: '${goods.no}',
                p: "1",
                standard: $('input[name=standard]:checked').val(),
                mno: '${loginMember.no}'
            },
            success: function(data) {
                var temp = "";
                $('.review-list-area').empty();
                $(data).each(function() {
                    let checked = "";
                    if(parseInt(this.isLikeLm) > 0) {
                        checked = "checked";
                    }
                    let checked2 = "";
                    if(this.fileName != null) {
                        checked2 = "<img src='/blank/resources/upload/review/" + this.fileName + "' alt=''>";
                    }
                    temp += `<div class="review-item">
                            <div class="review-item-left">
                            <div class="review-score"><span class="score-star">★★★★★<span style="width: `+ this.score * 10 + `%">★★★★★</span></span></div>
                            <div class="review-like">&nbsp;&nbsp;&nbsp;<input type="checkbox" class="likeCheck" id="likeCheck` + this.no + `" onchange="reviewLike(this, `+ this.no +`); cntUp(this)" ` + checked + `><label for="likeCheck` + this.no + `"><i class="fa-solid fa-heart"></i></label><span>`+ this.like +`</span></div>
                                <div class="review-content">` + this.content + `</div>
                                <div class="review-writer">
                                    <div>`+ this.writer +`</div>
                                    <div><span> | </span></div>
                                    <div>`+ this.enrollDate +`</div>
                                </div>
                            </div>
                            <div class="review-item-pic">`
                             + checked2 +
                            `</div>
                            <div class="review-item-more">
                                <span class="material-symbols-outlined" onclick="callReview(` + this.no + `)">more_vert</span>
                            </div>
                        </div>`;
                })
                if(data.length == 0) {
                    temp += `<div class="review-item"><div class="review-content">아직 남겨진 리뷰가 없습니다. 리뷰를 작성해 보세요!</div></div>`
                }
                $('.review-list-area').append(temp);
                var nick = '${loginMember.nick}';
                if(nick == '') {
                    $('.likeCheck').prop("disabled", true);
                }
            }
        })
    }

    // 리뷰 리스트 ajax - 페이징
    function reviewList(p) {
        $.ajax({
            url: "/blank/goods/review/list",
            method: "POST",
            data: {
                no: '${goods.no}',
                p: p,
                standard: $('input[name=standard]:checked').val(),
                mno: ${loginMember.no}
            },
            success: function(data) {
                var temp = "";
                $('.review-list-area').empty();
                $(data).each(function() {
                    let checked = "";
                    if(parseInt(this.isLikeLm) > 0) {
                        checked = "checked";
                    }
                    let checked2 = "";
                    if(this.fileName != null) {
                        checked2 = "<img src='/blank/resources/upload/review/" + this.fileName + "' alt=''>";
                    }
                    temp += `<div class="review-item">
                            <div class="review-item-left">
                            <div class="review-score"><span class="score-star">★★★★★<span style="width: `+ this.score * 10 + `%">★★★★★</span></span></div>
                                <div class="review-like">&nbsp;&nbsp;&nbsp;<input type="checkbox" class="likeCheck" id="likeCheck` + this.no + `" onchange="reviewLike(this, `+ this.no +`); cntUp(this)" ` + checked + `><label for="likeCheck` + this.no + `"><i class="fa-solid fa-heart"></i></label><span>`+ this.like +`</span></div>
                                <div class="review-content">` + this.content + `</div>
                                <div class="review-writer">
                                    <div>`+ this.writer +`</div>
                                    <div><span> | </span></div>
                                    <div>`+ this.enrollDate +`</div>
                                </div>
                            </div>
                            <div class="review-item-pic">`
                             + checked2 +   
                            `</div>
                            <div class="review-item-more">
                                <span class="material-symbols-outlined" onclick="callReview(` + this.no + `)">more_vert</span>
                            </div>
                        </div>`;
                })
                if(data.length == 0) {
                    temp += `<div class="review-item"><div class="review-content">아직 남겨진 리뷰가 없습니다. 리뷰를 작성해 보세요!</div></div>`
                }
                $('.review-list-area').append(temp);
                var nick = '${loginMember.nick}';
                if(nick == '') {
                    $('.likeCheck').prop("disabled", true);
                }
            }
        })
    }

    // 리뷰 좋아요 버튼 add, cancel
    function reviewLike(object, no) {
        if($(object).is(":checked")) {
            $.ajax({
                url: "/blank/goods/review/like/add",
                method: "POST",
                data: {
                    no: no,
                    mno: '${loginMember.no}'
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
                    mno: '${loginMember.no}'
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

    // 좋아요 숫자 up
    function cntUp(object) {
        var text = $(object).next().next().text();
        if($(object).is(":checked")) {
            $(object).next().next().text(parseInt(text) + 1);
        } else {
            $(object).next().next().text(parseInt(text) - 1);
        }
    }

</script>
<script>
    // DB에 이미 등록된 회원이거나 로그인하지 않았으면 재고 팝업 안 띄우게
    $('.stock-alert').click(function() {
        var nick = '${loginMember.nick}';
        if(nick == '') {
            Swal.fire({
                title: '로그인이 필요합니다!',
                text: '로그인 창으로 이동합니다.',
                icon: 'info',
                showCancelButton: true,
                confirmButtonColor: '#567ACE',
                confirmButtonText: '이동하기'
            }).then((result) => {
                if(result.isConfirmed) {
                    location.href='/blank/member/login'
                }
            })
        } else {
            $.ajax({
                url: "/blank/goods/stockAlert/check",
                method: "post",
                data: {
                    no: '${goods.no}',
                    phone: '${loginMember.phone}'
                },
                success: function(data) {
                    if(data == 'false') {
                        callAlert();
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: '이미 등록된 회원입니다.',
                            text: '재고가 들어올 때까지 기다려 주세요!',
                            confirmButtonColor: '#567ACE'
                        })
                    }
                }
            })
        }
    })
</script>
</html>