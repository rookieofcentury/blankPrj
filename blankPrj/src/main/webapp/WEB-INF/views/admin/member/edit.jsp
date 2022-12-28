<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="/blank/resources/css/admin/menu.css">
<link rel="stylesheet" href="/blank/resources/css/admin/member/edit.css">
</head>
<body>

	<div class="edit-board-content">
	
	    <div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
	    
	    <main>
	
	        <div class="edit-board-header">
	            <div>
	                <h1>회원 관리</h1>
	            </div>
	        </div>
	        
	        <div class="edit-board">
	            
	            <div class="member-edit-close">
	                                회원 정보 수정
	                <img src="../resources/images/admin/close.png" onclick="goBack();">
	            </div>
	            
   	            <script type="text/javascript">
	            	
	            	function goBack(){
	            		window.history.back();
	            	}
	            
	            </script>
	            
            <form action="/blank/admin/memberEdit" method="post">
            	<div class="edit-list">
	    
	                <div class="edit-title">회원번호</div>
	                <div>${selectMember.no}</div>
	                <div><input type="hidden" value="${selectMember.no}" name="no"></div>
	    
	                <div class="edit-title">닉네임</div>
	                <div>
	                    <input
	                        type="text"
	                        value="${selectMember.nick}"
	                        name="nick"
	                    />
	                </div>
	                <div><button class="check-btn">중복확인</button></div>
	                
	                <div class="edit-title">성별</div>
	                <div name="gender">${selectMember.gender}</div>
	                <div></div>
	    
	                <div class="edit-title phone-number">핸드폰 번호</div>
	                <div class="phone-number">
	                    <input
	                        type="text"
	                        value="${selectMember.phone}"
	                        name="phone"
	                    />
	                </div>
	                <div class="phone-number"></div>
	    
	                <div class="edit-title">이메일</div>
	                <div>
	                    <input
	                        type="text"
	                        value="${selectMember.email}"
	                        name="email"
	                    />
	                </div>
	                <div><button class="check-btn">중복확인</button></div>
	    
	                <div class="edit-title">포인트</div>
	                <div>
	                    <input
	                        type="text"
	                        value="${selectMember.point}"
	                        name="point"
	                    />
	                </div>
	                <div></div>
	    
	                <div class="edit-title bank-name">은행명</div>
	                <div class="bank-name">
	                    <input
	                        type="text"
	                        value="${selectMember.bank}"
	                        name="bank"
	                    />
	                </div>
	                <div class="bank-name"></div>
	    
	                <div class="edit-title account-number">계좌번호</div>
	                <div class="account-number">
	                    <input
	                        type="text"
	                        value="${selectMember.account}"
	                        name="account"
	                    />
	                </div>
	                <div class="account-number"></div>
	    
	                <div class="edit-title">예금주</div>
	                <div>
	                    <input
	                        type="text"
	                        value="${selectMember.depositor}"
	                        name="depositor"
	                    />
	                </div>
	                <div></div>
	    
	                <div class="edit-title">계정상태</div>
	                <div name="status">${selectMember.status}</div>
	                <div></div>
	    
	                <div class="edit-title">가입일</div>
	                <div name="enrollDate">${selectMember.enrollDate}</div>
	                <div></div>
	    
	                <div id="edit-submit">
	                    <input type="submit" value="수정" class="edit-submit-btn"/>
					</div>
	    
	            </div>
            </form>
	            
	
	        </div>
	
	    </main>
	
	</div>

</body>
</html>