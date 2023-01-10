<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            <form action="">
                <div class="grid project-content border">
                    <div>프로젝트 사진</div>
                    <div class="project-info-detail">
                        <div>${PrjVo.category}</div>
                        <div>${PrjVo.title}</div>
                        <div class="project-info-number">
                            <div><strong>${PrjVo.price}</strong>|</div>
                            <div>퍼센트|</div> 
                            <div class="red">남은기간 : </div>
                        </div>
                    </div>
                </div>
                <div class="pay-content grid">
                    <div class="project-pay-content"> 
                        <div>후원 정보</div>
                        <div class="user-info">
                            ㅇㅇㅇ
                        </div>
                        <div>후원자 정보</div>
                        <div class="project-pay-info">
                            <div>이메일</div>
                            <div>${loginMember.email}</div>
                            <div>연락처</div>
                            <div>${loginMember.phone}</div>
                        </div>
                        <div>배송지 정보</div>
                        <div class="addr-info">
                            <input type="hidden" name="addrNo">
                            <div id="addr-result">
                                    
                            </div>
                            <div>
                                    <input type="button" name="addrChange" value="변경">
                            </div>
                        </div>
                        <div>결제 수단</div>
                        <div class="card-info">
                            <input type="hidden" name="payNo">
                            <div id="card-result">
                                
                            </div>
                            <div>
                                <input type="button" name="cardChange" value="변경">
                            </div>
                        </div>
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
            </form>    
        </div>
    </div>
	
    
    
    
    
    
    
    
    
    
    <!-- 주소 선택하는 모달창  -->
    <input type="checkbox" id="addr-pop" class="hidden">
	<label for="addr-pop" class="hidden"></label>
	<div>
        <div>
            <label for="addr-pop"></label>
			<div class="pop-container">
                <div>
                    <div class="addr-title">주소지 선택</div>
                    <div class="addr-content">
                        <c:if test="${fn:length(addrVoList) != 0}">
                            <c:forEach items="${addrVoList}" var="list" varStatus="status">
                                <label>
                                    <input type="radio" id="${list.no}" name="addr" value="${list.no}" <c:if test="${status.first}">checked</c:if>   >
                                    <div class="addr-container">
                                        <div>${list.name}&nbsp;</div>
                                        <div>[${list.addrNo}]&nbsp;${list.addr}&nbsp;${list.addrDt}</div>
                                        <div>(${list.phone})</div>
                                    </div> 
                                </label>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
                <div>
                    <div><input type="submit" name="selectAddr" value="선택"></div>
                </div>
                
			</div>
		</div>
		<label for="addr-pop"></label>
	</div>


    <!-- 카드 선택하는 모달창  -->
    <input type="checkbox" id="card-pop" class="hidden">
	<label for="card-pop" class="hidden"></label>
	<div>
        <div>
            <label for="card-pop"></label>
			<div class="pop-container">
                    <div class="card-title">카드 선택</div>
                    <div class="card-content">
                        <c:if test="${fn:length(payVoList) != 0}">
							<c:forEach items="${payVoList}" var="list" varStatus="status">
										<label class="card-info-detail">
                                            <input type="radio" id="${list.no}" name="card" <c:if test="${status.first}">checked</c:if> >
                                            <div class="card-detail-container">
                                                <div>
                                                    <c:choose>
                                                        <c:when test="${list.cardType == 1}">
                                                            <img src="/blank/resources/images/pay/SH_CARD.png">
                                                        </c:when>
                                                        <c:when test="${list.cardType == 2}">
                                                            <img src="/blank/resources/images/pay/HD_CARD.png">
                                                        </c:when>
                                                        <c:when test="${list.cardType == 3}">
                                                            <img src="/blank/resources/images/pay/BC_CARD.png">
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                                <div class="card-margin">
                                                        <c:choose>
                                                        <c:when test="${list.cardType == 1}">
                                                            <div>신한카드</div>
                                                        </c:when>
                                                        <c:when test="${list.cardType == 2}">
                                                            <div>현대카드</div>
                                                        </c:when>
                                                        <c:when test="${list.cardType == 3}">
                                                            <div>비씨카드</div>
                                                        </c:when>
                                                    </c:choose>
                                                    <div>
                                                        ${list.cardNo.substring(0,4)}-
                                                        xxxx-
                                                        xxxx-
                                                        ${list.cardNo.substring(12,16)}
                                                    </div>
                                                </div>

                                            </div>
										</label>
							</c:forEach>
						</c:if>
                    </div>
                <div>
                    <div><input type="submit" name="selectCard" value="선택"></div>
                </div>
                
			</div>
		</div>
		<label for="card-pop"></label>
	</div>
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>
</body>
<script src="/blank/resources/js/pay/supportProject.js"></script>

</html>