<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 / 배송지</title>
<link rel="stylesheet" href="/blank/resources/css/member/payAddr.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<script>
    if('${msg}' != ""){
        alert('${msg}')
    }
	
</script>

<body>
<%@ include file = "/WEB-INF/views/common/header.jsp" %>

	<div class="wrap">
		<div class="mypage-container">
			<div><%@ include file = "/WEB-INF/views/member/mypage/mypageSidebar.jsp" %></div>
			<div class="content-container">
				<h2>결제 / 배송지</h2>
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
						<div>
							<div class="span2"><h3>등록된 결제수단</h3></div>
							<div></div>
							<div><button class="btn plus" id="pay-plus">추가</button></div>
						</div>
						<c:if test="${fn:length(payVoList) != 0}">
							<c:forEach items="${payVoList}" var="list">
								<form action="/blank/pay/deletecard" method="post" name="${list.no}"  onsubmit="return checkDelete();">
										<div class="card-info">
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
											<div class="payAddr-flex">
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
											<input type="hidden" name="no" value="${list.no}">
											<div><input type="submit" class="btn delete" value="삭제" name="${list.no}"></div>
										</div>
									</form>
								</c:forEach>
							</c:if>

					  </div>
					  
					  <div id="contents__item" class="content-second">
							<div>
								<div><h3>등록된 배송지</h3></div>
								<div><input type="button" class="btn plus" id="addr-plus" name="addrPlus" value="추가"></div>
							</div>
							<c:if test="${fn:length(addrVoList) != 0}">
								<c:forEach items="${addrVoList}" var="list">
									<form action="/blank/member/deleteaddr" method="post" name="${list.no}"  onsubmit="return checkDelete();">
										<input type="hidden" name="no" value="${list.no}">
										<div class="addr-container">
											<div class="addr-top">
												<div>${list.name}&nbsp;(${list.phone})</div>
												<div><input type="submit" class="btn delete" value="삭제"></div>
											</div>
											<div class="addr-down">
												<div>(${list.addrNo})&nbsp;${list.addr}</div>
												<div>${list.addrDt}</div>
											</div>
										</div>
									</form>
								</c:forEach>
							</c:if>
					  </div>
				
				
					</div>
				</div>
			
			</div>
		</div>
	</div>	

	<!-- 결제수단 선택  -->
	<input type="checkbox" id="popup" class="hidden">
	<label for="popup" class="hidden">view</label>
	<div>
		<div>
			<label for="popup"></label>
			<div class="plus-pay">
				<form action="/blank/pay/pluscard"  name="insert"id="plus-card-info" method="post" onsubmit="return putCardNo();" >
						<div class="pay-title">
							신용 / 체크 카드 등록
						</div> 
						<div class="pay-content">
							<div>
								<div class="margin-down">카드종류</div>
								<select name="cardType" id="cardType" class="margin-down">
									<option value="1">신한카드</option>
									<option value="2">현대카드</option>
									<option value="3">비씨카드</option>
								</select>
								<div class="margin-down">카드번호</div>
								<div class="margin-down">
									<input type="text" name="card1" class="card" maxlength="4" placeholder="0000">-
									<input type="text" name="card2" class="card" maxlength="4" placeholder="0000">-
									<input type="text" name="card3" class="card" maxlength="4" placeholder="0000">-
									<input type="text" name="card4" class="card" maxlength="4" placeholder="0000">
									<input type="hidden" name="cardNo">
								</div>
								<div class="margin-down">카드 유효기간</div>
								<div class="margin-down">
									<div class="card-in">
										<select name="cardExpM">
											<option value="1" >1월</option>
											<option value="2" >2월</option>
											<option value="3" >3월</option>
											<option value="4" >4월</option>
											<option value="5" >5월</option>
											<option value="6" >6월</option>
											<option value="7" >7월</option>
											<option value="8" >8월</option>
											<option value="9" >9월</option>
											<option value="10" >10월</option>
											<option value="11" >11월</option>
											<option value="12" >12월</option>
										</select>
										
										<select name="cardExpY">
											<option value="2023" >2023</option>
											<option value="2024" >2024</option>
											<option value="2025" >2025</option>
											<option value="2026" >2026</option>
											<option value="2027" >2027</option>
											<option value="2028" >2028</option>
											<option value="2029" >2029</option>
										</select>
									</div>
									
								</div>
								<div class="card-in margin-down">
										<div>
											<div class="margin-down">카드 비밀번호</div>
											<div><input type="text" name="cardPwd" class="card-input"></div>
										</div>
										<div>
											<div class="margin-down">소유주 생년월일</div>
											<div><input type="text" name="cardUserBirth" class="card-input"></div>
										</div>
								</div>
								<div class="margin-down2"><input type="checkbox" id="pay-info-check"><label for="pay-info-check">결제사 정보제공 동의</label></div>
								<div><input type="submit" class="plus-card-btn" value="등록하기" name="insert"></div>
						</div>
					</form>
				</div>
			</div>
	</div>
	<label for="popup"></label>
</div>





	<!-- 결제수단 삭제
	<input type="checkbox" id="deleteCard" class="hidden">
	<label for="deleteCard" class="hidden">view</label>
	<div>
		<div>
			<label for="deleteCard"></label>
			<div class="plus-pay">
				ㅇㅇㅇㅇ
			</div>
		</div>
	</div>
	<label for="popup"></label>
	</div> -->

	
					
	<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

	</body>
	<!-- <script>
		
		const delete1 = "${payVoList[0].no}";
		const delete2 = "${payVoList[1].no}";
		const delete3 = "${payVoList[2].no}";
	
		console.log(delete1);
		console.log(delete2);
		console.log(delete3);

		
		$('button[type=button]').click(function(){
			var delete_button = $(this).val();
			
			let isdelete = confirm('정말 삭제하시겠습니까?')

			if(isdelete){
				$.ajax({
					url : "/blank/pay/deletecard",
					type : "post",
					data : {
						"no" : delete_button
					},
					success : function(result){
	
						if(result ==1){
							
						alert('결제수단이 정상적으로 삭제 되었습니다.');
						
	
						}else{
						alert('결제수단이 삭제되지 않았습니다.')
							
						}
					},
					error : function(){
						alert('에이잭스 에러!!!!!!!!!');
					}
				}) //ajax    

			}
			else{

			}
			
		}) -->
		
	
	<input type="checkbox" id="addr-pop" class="hidden">
	<label for="addr-pop" class="hidden"></label>
	<div>
		<div>
			<label for="addr-pop"></label>
			<div>
				<div class="addr-title">주소지 등록</div>
				<div class="addr-content">
					<form action="/blank/member/addrPlus" method="post" name="addrPlus" onsubmit="putAddr();">
						<div>
							<input type="text" placeholder="받으시는 분 성함" class="width100" name="name">
						</div>
						<div>
							<input type="text" id="sample6_postcode" placeholder="우편번호" class="width70" name="addrNo">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="width30 ace"><br>
						</div>
						<div>
							<input type="text" id="sample6_address" placeholder="주소" class="width100" name="addr1"><br>
						</div>
						<div>
							<input type="text" id="sample6_detailAddress" placeholder="상세주소" class="width50" name="addrDt">
							<input type="text" id="sample6_extraAddress" placeholder="참고항목" class="width50" name="addr2">
							<input type="hidden" name="addr">
						</div>
						<div>
							<input type="text" name="phone" placeholder="휴대전화 번호" class="width100" name="phone" oninput="autoHyphen(this)">
						</div>
						<div>
							<input type="submit" class="width100 ace" name="addrPlus">
						</div>
					</form>
				</div>

			</div>
		</div>
		<label for="addr-pop"></label>
	</div>



<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>	


<script src="/blank/resources/js/member/payAddr.js"></script>
</html>


