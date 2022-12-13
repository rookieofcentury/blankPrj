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
            <div class="goods-category">생활용품</div>
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
                                <select name="option">
                                    <option value="none" selected>=== 옵션을 선택해 주세요 ===</option>
                                    <option value="1">블랭크 기본 패턴</option>
                                    <option value="2">긔엽긔 포켓몬 패턴</option>
                                </select>
                            </div>
                            <div>수량</div>
                            <div><input type="number" name="cnt" value="1" disabled min="1" max="10"></div>
                        </div>
                        <div class="option-block">
                            <div>
                                <div>옵션: 블랭크 기본 패턴</div>
                                <div class="x-button">X</div>
                            </div>
                            <div>
                                <input type="number" name="goodsCnt" value="1" min="1">
                                <div>24,000 원</div>
                            </div>
                        </div>
                        <div class="option-block">
                            <div>
                                <div>옵션: 블랭크 기본 패턴</div>
                                <div>X</div>
                            </div>
                            <div>
                                <input type="number" name="goodsCnt" value="1" min="1">
                                <div>24,000 원</div>
                            </div>
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
                    <label for="info-btn">상품 소개</label><input type="radio" name="buttons" id="info-btn"></input>
                    <label for="return-btn">반품 정책</label><input type="radio" name="buttons" id="return-btn"></input>
                    <label for="review-btn">후기</label><input type="radio" name="buttons" id="review-btn"></input>
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
                                <div><i class="fa-solid fa-message-lines"></i></div>
                                <span><span>3</span> 건</span>
                            </div>
                            <div>
                                <span>총 평점</span>
                                <div>★★★★★</div>
                                <span><span>5.0</span> / 5.0 </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    
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