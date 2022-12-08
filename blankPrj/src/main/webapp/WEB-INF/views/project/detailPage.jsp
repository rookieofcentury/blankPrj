<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#container{
    display: flex;
    flex-wrap: wrap;
}
.content-intro{
    width: 100%;
    height: 30%;
}
.intro-top{
    flex-direction: column;
    border: 1px solid blue;
    height: 10%;
    -webkit-box-align: center;
    align-items: center;
    order: 1;
    text-align: center;
    margin: 0px auto;
    display: flex;
    padding: 20px 0 15px;
    overflow: hidden;
}
.top-category{
    height: 28px;
    line-height: 28px;
    color: #567ace;
    font-weight: 800;
}
.top-title{
    text-align: center;
    line-height: 42px;
    font-size: 36px;
    font-weight: bold;
}
.content-introduction{
    border: 1px solid red;
    position: relative;
    width: 100%;
    height: 90%;
    z-index: 1;
    display: flex;
    transition-property: transform;
    box-sizing: content-box;
    -webkit-box-align: center;
    align-items: center;
}
.introduction-main{
    width: 100%;
    height: 30%;
    margin-left: auto;
    margin-right: auto;
    position: relative;
    overflow: hidden;
    --list-style: none;
    padding: 0px;
    z-index: 1;
    text-align: center;
}
.introduction-main img{
    width: 100%;
    vertical-align: bottom;
}
.introduction-sub{
    width: 100%;
    height: 100%;
    order: 4;
    --display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    margin: 0px 0px 0px 86px;
}
.sub-status{
    height: 70%;
}
.status-price, .status-period, .status-supporter{
    display: flex;
}
.status-price, .status-period, .status-supporter>div{
    margin: 0px 0px 1.75rem;
}
.price-total{
    width: 100px;
}
.status-period div:first-child{
    width: 40px;
}
.status-supporter div:first-child{
    width: 40px;
}
.sub-info{
    width: 100%;
    height: 20%;
    padding: 20px 0px 10px
}
.sub-info div{
    margin: 0px 0px 0.5rem;
}
.price, .period, .payment{
    width: 100px;
}
.info-price, .info-period, .info-payment{
    display: flex;
    margin-right: 20px;
}
.info-payment div:last-child{
    margin-left: 25px;
}
.sub-buttons{
    width: 100%;
    height: 10%;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: justify;
    justify-content: center;
}
.buttons-like{
    border: 1px solid rgb(228, 228, 228);
    border-radius: 4px;
    display: flex;
    flex-direction: column;
    font-size: 15px;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    width: 52px;
    height: 52px;
    background: rgb(255, 255, 255);
    cursor: pointer;
    border-radius: 10px;
}
.buttons-funding{
    margin-left: 5%;
    cursor: pointer;
    height: 52px;
    width: 50%;
    border: 2px solid #567ace;
    color: #567ace;
    background: rgb(255, 255, 255);
    font-size: 1.5rem;
    font-weight: bolder;
    border-radius: 20px;
}
.content-explanation{
    width: 100%; 
    height: 70%;
}
hr:first-of-type{
    width : 70%;
    background-color : #567ace51;
    height:1px;
    border:0;
    margin-left : 0;
}
hr:last-of-type{
    width : 90%;
    background-color : #567ace51;
    height:1px;
    border:0;
}
.content-navigation{
    width: 100%;
    height: 56px;
    padding: 0px 1rem;
    box-sizing: border-box;
    display: flex;
    align-items: center;
    position: relative;
    z-index: 10;
}
.content-navigation a{
    text-decoration: none;
    position: relative;
    padding: 10px 0px;
}
.content-navigation a:hover{
    color: #567ace;
}
.content-navigation a::before{
    --border-bottom: 3px solid #567ace;
    height: 5px;
    position: absolute;
    content:""; 
    display: block; 
    transition: all 250ms ease-out; 
    left: 50%; 
    width: 0;
    bottom: 0;
    background-color: #567ace;
} 
.content-navigation a:hover::before {
    transition: all 250ms ease-out; 
    left: 0%; 
    width: 100%;
} 
.content-navigation>a{
    cursor: pointer;
    line-height: 1.5;
    margin: 0px 1rem;
}
.content-explanation{
    display: flex;
    width: 1040px;          /*100%로 나중에 바꾸기*/
    flex-wrap: nowrap;
    -webkit-box-pack: justify;
    justify-content: space-between;
    gap: 38px;
    margin: 0px auto;
}
.explanation-project{
    border: 1px solid beige;
    width: 100%;
}
.explanation-side{
    padding-top: 28px;
    margin-top: 5px;
    float: right;
    width: 284px;
    overflow: hidden;
}
.side-creator{
    border: 1px solid pink;
    display: block;
    padding: 20px 16px;
}
.container-img{
    display: inline-block;
    /* background-image: */
    background-size: cover;
    background-position: 50% 38%;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    box-shadow: rgb(208 208 208) 0px 0px 1px 0px inset, rgb(208 208 208) 0px 0px 1px 0px;
    margin : 0.5rem 1rem 0.5rem 0;
}
.creator-container{
    display: flex;
    align-items: start;
    flex-wrap: wrap;
}
.container-name{
    display: flex;
    margin-top: 1rem;
}
.name-follow{
    background: rgb(255, 255, 255);
    cursor: pointer;
    border-radius: 10px;
    color: #567ace;
    border: 1px solid #567ace;
    margin-left: 1rem;
    width: 60px;
    text-align: center;
}
.side-reward{
    width: 100%;
    height: auto;
    padding: 24px 0px 0px;
}
.reward-card{
    margin: 10px 0px 14px;
    border-radius: 10px;
    background-color: rgb(255, 255, 255);
    border: 1px solid rgb(239, 239, 239);
    overflow: hidden;
}
.card-option{
    padding: 20px;
}
.option-title{
    display: flex;
    flex-direction: column;
    -webkit-box-align: center;
    margin: 4px 0px 8px;
}
.title-price{
    font-size: 24px;
    line-height: 36px;
    letter-spacing: -0.025em;
}
.title-name{
    font-size: 13px;
    line-height: 20px;
    letter-spacing: -0.015em;
}
.card-option>ul{
    padding: 0px;
    margin: 0px;
    --list-style-type: disc;
}
.card-option li{
    font-size: 12px;
    line-height: 19px;
    letter-spacing: -0.01em;
    margin: 0px 0px 4px;
    padding: 0px 0px 0px 10px;
    list-style: none;
}
.card-option li:before{
    content: "·";
    font-weight: bold;
    /* 왜 안먹지?? left: 0.6em; */
}
.option-quantity, .option-sell{
    color: #567ace;
}
.option-quantity{
    margin : 8px 0px 4px;
}
</style>
</head>
<body>
	
	 <div id="container">
		<div class="content-intro">
			<div class="intro-top">
				<a href=#>
					<span class="top-category">디자인 문구</span>
				</a>
				<h1 class="top-title">이제 키보드도 '터치'하세요 | 키보드+터치패드+거치대 = 퓨전키보드다.</h1>
			</div>
			<div class="content-introduction">
				<div class="introduction-main">
                    <div class="main-image">
                        <button type="button"><<</button>
					    <img src="" alt="프로젝트썸네일">
                        <button type="button">>></button>
                    </div>
					<div class="main-summary">
					아직도 키보드 마우스 스탠드 다 따로 들고 다니는 그대를 위해, 진정한 올인원 키보드가 왔습니다. 키보드 아래로 들어간다요오
					</div>
				</div>
				<div class="introduction-sub">
					<div class="sub-status">
						<div class="status-price">
							<div class="price-total"><strong>23,270,500</strong>원</div>
							<div class="price-fundingrate">1760%</div>
						</div>
						<div class="status-period">
							<div><strong>18</strong>일</div>
							<div>남음</div>
						</div>
						<div class="status-supporter">
							<div>후원자</div>
							<div><strong>88</strong></div>
							<div>명</div>
						</div>
					</div>
                    <hr>
					<div class="sub-info">
						<div class="info-price">
							<div class="price"><strong>목표금액</strong></div>
							<div>500,000원</div>
						</div>
						<div class="info-period">
							<div class="period"><strong>펀딩기간</strong></div>
							<div>2022.11.24~2022.12.15</div>
						</div>
						<div class="info-payment">
							<div class="payment"><strong>결제</strong></div>
							<div>100% 이상 모이면 펀딩이 성공되며, 펀딩 마감일까지 목표 금액이 100% 모일 경우 펀딩이 끝난 다음 날 결제가 진행됩니다.</div>
						</div>
					</div>
					<div class="sub-buttons">
						<div class="buttons-like">
                            <div class="like-lcon">★</div>
                            <div class="like-count">110</div>
                        </div>
						<button class="buttons-funding">프로젝트 후원하기</button>
					</div>
				</div>
			</div>
		</div>
        <hr>
        <div class="content-navigation">
            <a href="#">프로젝트 계획</a>
            <a href="#">새소식 4 </a>
            <a href="#">후기 11</a>
        </div>
		<div class="content-explanation">
            <div class="explanation-project">아아 이곳은 프로젝트 소개입니다</div>
            <div class="explanation-side">
                <div class="side-creator">
                    <div class="creator-header">창작자 소개</div>
                    <div class="creator-container">
                        <a href=#>
                            <span class="container-img"></span>
                        </a>
                        <div class="container-name">
                            <div class="name-nick"><strong>
                                <a href=#>청애름</a>
                            </strong></div>
                            <div class="name-follow">+ 팔로우</div>
                        </div>
                        <div>전통의상을 전공한 창작자가 차근차근 만들어가는 생활한복 브랜드입니다아나아</div>
                    </div>
                </div>
                <div class="side-reward">
                    <div class="reward-select">리워드 선택
                    <div class="reward-card">
                        <div class="card-option">
                            <div class="option-title">
                                <div class="title-price">29,000원</div>
                                <div class="title-name">안경세트</div>
                            </div>
                            <ul>
                                <li>안경</li>
                                <li>고급가죽케이스</li>
                                <li>안경닦이</li>
                                <li>미니드라이브</li>
                            </ul>
                            <div class="option-quantity">제한수량 200개</div>
                            <div class="option-sell">총 60개 펀딩완료</div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
		</div>
	</div>
	
</body>
</html>