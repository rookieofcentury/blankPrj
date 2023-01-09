<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/blank/resources/css/pay/supportProject.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	    <%@ include file = "/WEB-INF/views/common/header.jsp" %>
    <div class="wrap">
        <div class="pay-container grid">
            <div class="grid project-content border">
                <div>프로젝트 사진</div>
                <div class="project-info-detail">
                    <div>${PrjVo.category}</div>
                    <div>${PrjVo.title}</div>
                    <div class="project-info-number">
                        <div>${PrjVo.price}</div>
                        <div>퍼센트</div> 
                        <div class="red">남은기간 : </div>
                    </div>
                </div>
            </div>
            <div class="pay-content grid">
                <div class="project-pay-content border"> 
                    <div>후원 정보</div>
                    <div class="project-pay-info info"></div>
                    <div>후원자 정보</div>
                    <div class="user-info info"></div>
                    <div>베송지 정보</div>
                    <div class="addr-info info"></div>
                    <div>결제 수단</div>
                    <div class="pay-info info"></div>
                </div>
                <div id="project-pay-check">
                    <div class="final-pay-check border">
                        <div>최종결제금액</div>
                        <div>최종결제일자</div>
                    </div>
                    <div class="border">
                        <div class="no-pay">프로젝트가 무산되거나 중단된 경우, 예약된 결제는 자동으로 취소됩니다.</div>
                        <div><input type="checkbox" id="info-check"><label for="info-check">개인정보 제 3자 제공동의(필수)</label><a>내용보기</a></div>
                        <div><input type="checkbox" id="pay-check"><label for="pay-check">후원 시 유의사항</label><a>내용보기</a></div>
                        <div><button class="pay-btn">후원하기</button></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>
	
</body>
<script src="/blank/resources/js/pay/supportProject.js"></script>

</html>