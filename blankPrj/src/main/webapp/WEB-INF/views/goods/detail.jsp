<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Blank</title>
<link rel="stylesheet" href="/blank/resources/css/goods/detail.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   <script>
       Kakao.init('4cca08bc633d6646753296f4efd16743');
       Kakao.isInitialized();  
   </script>
<script src="https://kit.fontawesome.com/77ad8525ff.js"></script>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

    <%@ include file = "/WEB-INF/views/common/header.jsp" %>
    
    <div class="wrap">
        
        <div class="container">
            <div class="goods-category"><a href="/blank/goods"><i class="fa-solid fa-house"></i></a> 생활용품</div>
            <div class="goods-info">
                <div>${goods.name}</div>
                <div>
                    <div class="image-box"><img src="" alt=""></div>
                    <div>
                        <div id="info">
                            <div>판매가</div>
                            <div><span id="vo-price"><fmt:formatNumber pattern="###,###,###" value="${goods.price}"/></span> 원</div>
                            <div>배송료</div>
                            <div>유료 (70,000 원 이상 구매 시 무료)</div>
                            <div></div>
                            <div></div>
                            <div>수량</div>
                            <div class="cnt-area"><input type="number" name="cnt" value="1" min="1" max="${goods.stock}"><label id="minus-btn"><i class="fa-solid fa-minus"></i></label><label id="plus-btn"><i class="fa-solid fa-plus"></i></label></div>
                        </div>
                        <c:if test="${goods.stock >= 1}">
                        <div class="btn-block">
                            <div class="btn-area">
                                <span>총 <span class="goods-cnt-box">1</span> 개</span>
                                <span><span id="final-pay"><fmt:formatNumber pattern="###,###,###" value="${goods.price}"/></span> 원</span>
                            </div>
                            <div class="btn-area">
                                <div class="btn-white" onclick="addBasket();">장바구니 담기</div>
                                <div class="btn-main">바로 구매</div>
                                <div class="btn-white share-btn" id="share-btn" onclick="Kakao.Share.createScrapButton();"><i class="fa-solid fa-share-nodes"></i></div>
                            </div>
                        </div>
                        </c:if>
                        <c:if test="${goods.stock == 0}">
                            <div class="no-stock-info flex">현재 재고가 없어 주문할 수 없는 상품입니다.</div>
                            <div class="btn-area">
                                <div class="btn-white stock-alert flex" onclick="callAlert();"><i class="fa-sharp fa-solid fa-bell"></i>&nbsp;&nbsp;재입고 알림 받기</div>
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
                                <span><span>3</span> 건</span>
                            </div>
                            <div>
                                <span>총 평점</span>
                                <div id="avg">★★★★★</div>
                                <span><span>5.0</span> / 5.0 </span>
                            </div>
                        </div>
                        <div class="review-menu">
                            <div id="review-write-btn" onclick=""><i class="fa-solid fa-pen"></i> 글쓰기</div>
                            <div class="align-standard">
                                <div><label class="standard"><input type="radio" name="standard" value="popular" checked><span>인기순</span></label></div>
                                <div><label class="standard"><input type="radio" name="standard" value="new"><span>최신순</span></label></div>
                                <div><label class="standard"><input type="radio" name="standard" value="high"><span>평점높은순</span></label></div>
                                <div><label class="standard"><input type="radio" name="standard" value="low"><span>평점낮은순</span></label></div>
                            </div>
                        </div>
                        <div class="review-item">
                            <div class="review-item-left">
                                <div class="review-score"><span>★★★★★</span></div>
                                <div class="review-like"><button><i class="fa-solid fa-heart fa-lg"></i></button><span>32</span></div>
                                <div class="review-option">블랭크 기본 패턴</div>
                                <div class="review-content">
                                    쫀떡 조아 재롱 귀여워 초롱 내 꼬 리랑이 말괄량이 대충 샘플입니다
                                    이렇게 사용합니다 최대 50 자까지 보여 줄 겁니다
                                </div>
                                <div class="review-writer">
                                    <div>nick***</div>
                                    <div><span> | </span></div>
                                    <div>2022.12.04</div>
                                </div>
                            </div>
                            <div class="review-item-pic">
                                <img src="" alt="">
                            </div>
                            <div class="review-item-more">
    
                            </div>
                        </div>
                        <div class="review-item">
                            <div class="review-item-left">
                                <div class="review-score"><span>★★★★★</span></div>
                                <div class="review-like"><button><i class="fa-solid fa-heart fa-lg"></i></button><span>32</span></div>
                                <div class="review-option">블랭크 기본 패턴</div>
                                <div class="review-content">
                                    쫀떡 조아 재롱 귀여워 초롱 내 꼬 리랑이 말괄량이 대충 샘플입니다
                                    이렇게 사용합니다 최대 50 자까지 보여 줄 겁니다
                                </div>
                                <div class="review-writer">
                                    <div>nick***</div>
                                    <div><span> | </span></div>
                                    <div>2022.12.04</div>
                                </div>
                            </div>
                            <div class="review-item-pic">
                                <img src="" alt="">
                            </div>
                            <div class="review-item-more">
    
                            </div>
                        </div>
                        <div class="review-item">
                            <div class="review-item-left">
                                <div class="review-score"><span>★★★★★</span></div>
                                <div class="review-like"><button><i class="fa-solid fa-heart fa-lg"></i></button><span>32</span></div>
                                <div class="review-option">블랭크 기본 패턴</div>
                                <div class="review-content">
                                    쫀떡 조아 재롱 귀여워 초롱 내 꼬 리랑이 말괄량이 대충 샘플입니다
                                    이렇게 사용합니다 최대 50 자까지 보여 줄 겁니다
                                </div>
                                <div class="review-writer">
                                    <div>nick***</div>
                                    <div><span> | </span></div>
                                    <div>2022.12.04</div>
                                </div>
                            </div>
                            <div class="review-item-pic">
                                <img src="" alt="">
                            </div>
                            <div class="review-item-more">
    
                            </div>
                        </div>
                        <div>페이지네이션</div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    
    <%@ include file = "/WEB-INF/views/goods/review.jsp" %>
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>
</body>
<script src="/blank/resources/js/goods/detail.js"></script>
<script>
    Kakao.Share.createScrapButton({
	  container: '#share-btn',
	  requestUrl: 'http://localhost:8888/blank/goods/detail',
	});

    function addBasket() {
        $.ajax({
            url: "/blank/goods/basket/add",
            method: "POST",
            data: {
                no: '${goods.no}',
                cnt: $('input[name=cnt]').val()
            },
            success: function(data) {
                alert(data);
            },
            error: function() {
                console.log('error');
            }
        })
    }
</script>
</html>