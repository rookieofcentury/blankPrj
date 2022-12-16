<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="edit-board-content">
	
	    <div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
	    
	    <main>
	
	        <div class="edit-board-header">
	            <div>
	                <h1>굿즈 관리</h1>
	            </div>
	        </div>
	        
	        <div class="edit-board">
	            
	            <div class="member-edit-close">
	                                회원 정보 수정
	                <img src="../resources/images/admin/close.png">
	            </div>
	            
	            <div class="edit-list">
	    
	                <div class="edit-title">회원번호</div>
	                <div>1</div>
	                <div></div>
	    
	                <div class="edit-title">닉네임</div>
	                <div>
	                    <input
	                        type="text"
	                        value="nick01"
	                        name="nick"
	                    />
	                </div>
	                <div></div>
	    
	                <div class="edit-title phone-number">핸드폰 번호</div>
	                <div class="phone-number">
	                    <input
	                        type="text"
	                        value="010-0000-0000"
	                        name="phone"
	                    />
	                </div>
	                <div class="phone-number"></div>
	    
	                <div class="edit-title">이메일</div>
	                <div>
	                    <input
	                        type="text"
	                        value="user01@gmail.com"
	                        name="email"
	                    />
	                </div>
	                <div><button class="check-email-btn">중복확인</button></div>
	    
	                <div class="edit-title">포인트</div>
	                <div>
	                    <input
	                        type="text"
	                        value="20,000p"
	                        name="point"
	                    />
	                </div>
	                <div></div>
	    
	                <div class="edit-title bank-name">은행명</div>
	                <div class="bank-name">
	                    <input
	                        type="text"
	                        value="국민"
	                        name="bank"
	                    />
	                </div>
	                <div class="bank-name"></div>
	    
	                <div class="edit-title account-number">계좌번호</div>
	                <div class="account-number">
	                    <input
	                        type="text"
	                        value="668801-01-621564"
	                        name="account"
	                    />
	                </div>
	                <div class="account-number"></div>
	    
	                <div class="edit-title">예금주</div>
	                <div>
	                    <input
	                        type="text"
	                        value="홍현정"
	                        name="depositor"
	                    />
	                </div>
	                <div></div>
	    
	                <div class="edit-title">계정상태</div>
	                <div>가입</div>
	                <div></div>
	    
	                <div class="edit-title">가입일</div>
	                <div>2022-12-12</div>
	                <div></div>
	    
	                <div id="edit-submit">
	                    <input type="submit" value="수정" class="edit-submit-btn"/>
					</div>

</body>
</html>