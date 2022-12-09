<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Blank</title>
<style>

* {
	box-sizing: border-box;
    letter-spacing: -0.05em;
	font-family: Pretendard-Regular;
}

.wrap {
	display: flex;
	justify-content: center;
	align-items: center;
}

.container {
	width: 70vw;
	display: grid;
	justify-content: center;
	row-gap: 25px;
	grid-template-columns: 1fr;
	grid-template-rows: 50px minmax(auto, 0.3fr) 2fr;
}

.goods-info {
    display: flex;
    width: 100%;
    height: 100%;
    gap: 15px;
    flex-direction: column;
    align-items: center;
}
.goods-info>div:nth-child(1) {
    display: flex;
    width: 100%;
    height: 10%;
}
.goods-info>div:nth-child(2) {
    display: flex;
    width: 100%;
    height: auto;
    justify-content: space-around;
}
.goods-info>div:nth-child(2)>div:nth-child(2) {
    display: flex;
    width: 30%;
    flex-direction: column;
    justify-content: space-around;
    font-size: 18px;
    gap: 20px;
}
.option-block {
    display: flex;
    background-color: #F5F5F5;
    border-radius: 15px;
    flex-direction: column;
    font-size: 14px;
}
.option-block>div {
    display: flex;
    padding: 20px;
    justify-content: space-between;
}
.option-block>div>input {
    width: 30%;
    height: 100%;
}
.btn-block {
    display: flex;
    flex-direction: column;
    gap: 20px;
    border-top: 1px solid #343434;
    padding-top: 20px;
}

#info {
    display: grid;
    align-items: center;
    grid-template-columns: 0.4fr 1fr;
    grid-template-rows: repeat(4, 50px);
}

input, select {
    background-color: none;
    border: 1px solid #C5C5C5;
    border-radius: 10px;
    height: 40px;
    width: 80%;
    font-size: 16px;
}
input:focus, select:focus {
    outline: none;
}

.image-box {
	display: flex;
    width: 500px;
    height: 500px;
}
.image-box>img {
	width: 100%;
	height: 100%;
}
.image-box:after {
	content: "";
	display: block;
	padding-bottom: 100%;
}

.btn-area {
    display: flex;
    justify-content: space-between;
}

</style>
</head>
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
                                    <option value="1">블랭크 기본 패턴</option>
                                    <option value="2">긔엽긔 포켓몬 패턴</option>
                                </select>
                            </div>
                            <div>수량</div>
                            <div><input type="number" name="cnt"></div>
                        </div>
                        <div class="option-block">
                            <div>
                                <div>옵션: 블랭크 기본 패턴</div>
                                <div>X</div>
                            </div>
                            <div>
                                <input type="number" name="goodsCnt">
                                <div>24,000 원</div>
                            </div>
                        </div>
                        <div class="option-block">
                            <div>
                                <div>옵션: 블랭크 기본 패턴</div>
                                <div>X</div>
                            </div>
                            <div>
                                <input type="number" name="goodsCnt">
                                <div>24,000 원</div>
                            </div>
                        </div>
                        <div class="btn-block">
                            <div class="btn-area">
                                <span>총 3 개</span>
                                <span>72,000 원</span>
                            </div>
                            <div class="btn-area">
                                <div>장바구니 담기</div>
                                <div>바로 구매</div>
                                <div><i class="fa-solid fa-share-nodes"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content"></div>
        </div>
        
    </div>
    
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
</html>