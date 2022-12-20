<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 / 배송지</title>
<link rel="stylesheet" href="/blank/resources/css/member/reportQ.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body>
<%@ include file = "/WEB-INF/views/common/header.jsp" %>

	<div class="wrap">
		<div class="mypage-container">
			<div><%@ include file = "/WEB-INF/views/member/mypage/mypageSidebar.jsp" %></div>
			<div class="content-container">
				<nav id="nav">
					<ul>
						<li>결제수단</li>
						<li>배송지 정보</li>
						<div class="line"></div>
					</ul>
				</nav>	
				<div id="contents">
					<div id="contents__list">
					  <div id="contents__item" class="content-first">
							<div class="span2"><h3>등록된 결제수단</h3></div>
							<div><button class="btn plus">추가</button></div>
							<div><img src="/blank/resources/images/pay/SH_CARD.png"></div>
							<div class="payAddr-flex">
								<div>신한카드</div>
								<div>XXXX-XXXX-XXXX-XXXX</div>
							</div>
							<div><button class="btn delete">삭제</button></div>
							<div><img src="/blank/resources/images/pay/BC_CARD.png"></div>
							<div>
								<div>비씨카드</div>
								<div>XXXX-XXXX-XXXX-XXXX</div>
							</div>
							<div><button class="btn delete">삭제</button></div>
							<div>사진</div>
							<div class="payAddr-flex">
								<div>은행</div>
								<div>계좌번호</div>
							</div>
							<div><button class="btn delete">삭제</button></div>
					  </div>
					  <div id="contents__item" class="content-second">
							<div>
								<div class=""><h3>등록된 배송지</h3></div>
								<div><button class="btn plus">추가</button></div>
							</div>
							<div>
								<div>
									<div>이름</div>
									<div>배송지</div>
								</div>
								<div><button class="btn delete">삭제</button></div>
							</div>
							<div>
								<div>이름</div>
								<div>배송지</div>
								<div><button class="btn delete">삭제</button></div>
							</div>
							<div>
								<div>이름</div>
								<div>배송지</div>
								<div><button class="btn delete">삭제</button></div>
							</div>
						
					  </div>
				
				
					</div>
				  </div>
			
			</div>
		</div>
	</div>	
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>
<a class="modal-notice">모달 클릭 </a>
<div class="modal">
	<div class="modal-content">
		<a class="btn-close">X</a>
		<h2>Welcome to Teams!</h2>
		<img ssrc="../resources/images/member/choi.png">
		<p>여기글씨다아앙</p>
		<a class="btn-guide">OpenGuide</a>
	</div>
</div>
</body>
<script src="/blank/resources/js/member/reportQ.js"></script>
<script>
	const modalClick = $('.modal-notice');

	modalClick.addEventListener("click", alert('바보'));

  </script>
</html>