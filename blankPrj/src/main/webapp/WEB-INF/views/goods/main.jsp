<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Blank</title>
<style>
* {
	box-sizing: border-box;
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
	grid-template-rows: 1fr 0.7fr 1.6fr 0.8fr 1.5fr;
}

#banner {
	height: 346px;
}

.content {
	display: flex;
	gap: 20px;
}

.goods-list {
    display: flex;
    flex-wrap: wrap;
    height: 100%;
    width: 100%;
}
.goods-item {
    display: flex;
    flex-direction: column;
    padding: 20px;
	gap: 10px;
	width: 25%;
    height: 50%;
}
.goods-item>div:nth-child(2) {
	display: flex;
	justify-content: space-between;
}
.goods-item>div:nth-child(2)>span:nth-child(1) {
	color: var(--gray);
}
.goods-item>div:nth-child(2)>span:nth-child(2) {
	color: var(--main-color);
	font-weight: bold;
}

.image-box {
	display: flex;
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

.editor-picks {
    display: flex;
    width: 100%;
    height: 100%;
    padding: 20px 0px;
    background-color: var(--sub-color);
}
.editor-picks>div {
    display: flex;
}
.editor-picks>div:nth-child(1) {
    width: 25%;
    flex-direction: column;
    justify-content: space-evenly;
    padding: 30px 0px 40px 70px;
    color: white;
}
.editor-picks>div:nth-child(1)>div:nth-child(1) {
    font-size: 28px;
    font-weight: bold;
}
.editor-picks>div:nth-child(1)>div:nth-child(3) {
    width: 50%;
    height: 30px;
    background-color: white;
    cursor: pointer;
    border-radius: 10px;
    color: var(--sub-color);
}

.exhibition-area {
    display: flex;
}
.exhibition-item {
    display: flex;
    flex-direction: column;
    padding: 50px 30px;
    gap: 20px;
    width: 50%;
    height: 100%;
}
.exhibition-item>div:nth-child(1) {
    display: flex;
    width: 100%;
    height: 50%;
}
.exhibition-item>div:nth-child(2) {
    display: flex;
    justify-content: space-between;
    height: 30%;
}
.exhibition-item>div:nth-child(2)>div {
    display: flex;
    width: 30%;
    height: 100%;
}
.exhibition-item>div:nth-child(3) {
    font-size: 22px;
    font-weight: bold;
}
.exhibition-item>div:nth-child(4) {
    display: flex;
    justify-content: space-between;
}
.exhibition-item>div:nth-child(4)>span:nth-child(2) {
    color: var(--gray);
}

</style>
</head>
<body>

<%@ include file = "/WEB-INF/views/common/header.jsp" %>

<div class="wrap">

    <div class="container">
        <div id="banner"></div>
        <div class="content">
            
        </div>
        <div class="content">
            <div class="goods-list">
                <div class="goods-item" onclick="location.href='/blank/goods/detail';">
                    <div class="image-box"><img src="" alt="item-pic"></div>
                    <div>
                        <span>아이템명</span>
                        <span>가격</span>
                    </div>
                </div>
                <div class="goods-item">
                    <div class="image-box"><img src="" alt="item-pic"></div>
                    <div>
                        <span>아이템명</span>
                        <span>가격</span>
                    </div>
                </div>
                <div class="goods-item">
                    <div class="image-box"><img src="" alt="item-pic"></div>
                    <div>
                        <span>아이템명</span>
                        <span>가격</span>
                    </div>
                </div>
                <div class="goods-item">
                    <div class="image-box"><img src="" alt="item-pic"></div>
                    <div>
                        <span>아이템명</span>
                        <span>가격</span>
                    </div>
                </div>
                <div class="goods-item">
                    <div class="image-box"><img src="" alt="item-pic"></div>
                    <div>
                        <span>아이템명</span>
                        <span>가격</span>
                    </div>
                </div>
                <div class="goods-item">
                    <div class="image-box"><img src="" alt="item-pic"></div>
                    <div>
                        <span>아이템명</span>
                        <span>가격</span>
                    </div>
                </div>
                <div class="goods-item">
                    <div class="image-box"><img src="" alt="item-pic"></div>
                    <div>
                        <span>아이템명</span>
                        <span>가격</span>
                    </div>
                </div>
                <div class="goods-item">
                    <div class="image-box"><img src="" alt="item-pic"></div>
                    <div>
                        <span>아이템명</span>
                        <span>가격</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="editor-picks">
            <div>
                <div>Editor Picks</div>
                <div>에디터가 골라 주는<br>이 달의 블랭크!</div>
                <div class="flex">더 보러 가기</div>
            </div>
            <div></div>
        </div>
        <div class="exhibition-area">
            <div class="exhibition-item">
                <div>이미지</div>
                <div>
                    <div>이미지1</div>
                    <div>이미지2</div>
                    <div>기획전 바로 가기 ></div>
                </div>
                <div>2023 년을 빈손으로 맞이할 수는 없죠!</div>
                <div>
                    <span>한 해를 맞이할 다이어리 문구류 모음전</span>
                    <span>2022.12.03 - 2022.12.31</span>
                </div>
            </div>
            <div class="exhibition-item">
                <div>이미지</div>
                <div>
                    <div>이미지1</div>
                    <div>이미지2</div>
                    <div>기획전 바로 가기 ></div>
                </div>
                <div>연말 맞이 선물하기 딱 좋은 블랭크 굿즈</div>
                <div>
                    <span>선물 고민하지 마시고 여기로 ♥</span>
                    <span>2022.12.03 - 2022.12.31</span>
                </div>
            </div>
        </div>

    </div>

</div>

</body>
</html>