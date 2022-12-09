<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/blank/resources/css/project_view/detailNewsDatail.css">
</head>
<body>

<%@ include file = "/WEB-INF/views/common/header.jsp" %>

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
					    <img src="/resources/imgs/10억뷰.jpg" alt="프로젝트썸네일">
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
        <div class="content-navigation">
            <a href="#">프로젝트 계획</a>
            <a href="#">새소식 4 </a>
            <a href="#">후기 11</a>
        </div>
        <hr>
		<div class="content-explanation">
            <div class="explanation-notify">
                <div class="notify-title">
                    <div class="title-news">
                        <span class="news-issue">새소식</span>
                        <span class="news-count">4</span>
                    </div>
                    <span class="title-tap">
                        <span class="tap-write">작성하기</span>
                        <label class="tap-selectbox"> 
                            <select>
                                <option value="desc">최신순</option>
                                <option value="asc">과거순</option>
                            </select>
                        </label>
                    </span>
                </div>
                <a href="#">
                    <button type="button" class="return-button">
                        <i> << </i>
                        목록 이동
                    </button>
                </a>
                <div class="explanation-news">
                    <p class="news-title">꿀 같은 혜택! 리워드 가격⬇하향⬇조정했어요</p>
                    <p class="news-date">2022.11.20 18:05</p>
                </div>
                <div class="news-content">
                    안녕하세요! 청애름 입니다.마지막 펀딩날이네요 ^^ <br>
                    많은분들께서 더 자세한 사이즈를 여쭤보셨습니다!미리 더 자세하게 안내드리지 못해 죄송합니다.  <br>
                    각 사이즈별 더 상세한 사이즈를 안내드리니, 펀딩에 참고 해주세요!
                </div>
            </div>
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
	
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
</html>