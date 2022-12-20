<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                <div>무릎담요</div>
                <div>
                    <div class="image-box"><img src="" alt=""></div>
                    <div>
                        <div id="info">
                            <div>판매가</div>
                            <div>24,000 원</div>
                            <div>배송료</div>
                            <div>유료 (70,000 원 이상 구매 시 무료)</div>
                            <div>옵션 선택</div>
                            <div>
                                <select name="option" id="goods-option">
                                    <option value="none" selected disabled hidden>=== 옵션을 선택해 주세요 ===</option>
                                    <option value="1">블랭크 기본 패턴</option>
                                    <option value="2">긔엽긔 포켓몬 패턴</option>
                                </select>
                            </div>
                            <div>수량</div>
                            <div><input type="number" name="cnt" value="1" disabled min="1" max="10"></div>
                        </div>
                        <div class="option-area">
                            
                        </div>
                        <div class="btn-block">
                            <div class="btn-area">
                                <span>총 3 개</span>
                                <span>72,000 원</span>
                            </div>
                            <div class="btn-area">
                                <div class="btn-white">장바구니 담기</div>
                                <div class="btn-main">바로 구매</div>
                                <div class="btn-white share-btn" id="share-btn" onclick="Kakao.Share.createScrapButton();"><i class="fa-solid fa-share-nodes"></i></div>
                            </div>
                        </div>
                        <div class="no-stock-info flex">현재 재고가 없어 주문할 수 없는 상품입니다.</div>
                        <div class="btn-area">
                            <div class="btn-white stock-alert flex" onclick="callAlert();"><i class="fa-sharp fa-solid fa-bell"></i>&nbsp;&nbsp;재입고 알림 받기</div>
                            <div class="btn-white share-btn" id="share-btn" onclick="Kakao.Share.createScrapButton();"><i class="fa-solid fa-share-nodes"></i></div>
                        </div>
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
                        <img src="" alt="소개 이미지">
                        소개 적을 거임 여기에다가 ㅡㅡ
                    </div>
                    <div class="pd-return">
                        반품 정책 적을 거임 여기에다가 ㅡㅡ
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
</script>
</html>