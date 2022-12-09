<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/blank/resources/css/admin/member/list.css">
</head>
<body>

<div class="member-board-content">

	<div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
	
    <main>

        <div class="member-board-header">
            <div>
                <h1>회원 관리</h1>
            </div>
        </div>
        
        <div class="member-board">

            <form action="" method="get" id="member-search-form">
                <div class="member-search">
                    <select class="category">
                        <option value="id">닉네임</option>
                        <option value="phone">핸드폰 번호</option>
                        <option value="email">이메일</option>
                    </select
                    ><input type="text" name="keyword">
                    <div><input type="image" src="../resources/images/admin/search.png" alt="search.png"></div>
                </div>
            </form>
    
            <div class="member-list">
    
                <div class="member-list-top">전체 회원 64명</div>
    
                <div>회원 번호</div>
                <div>닉네임</div>
                <div>핸드폰 번호</div>
                <div>이메일</div>
                <div>포인트</div>
                <div>은행명</div>
                <div>계좌번호</div>
                <div>예금주명</div>
                <div>계정상태</div>
                <div>수정</div>
        
                <div>1</div>
                <div>NICK01</div>
                <div>010-1234-5678</div>
                <div>user01@gamil.com</div>
                <div>20,000</div>
                <div>국민</div>
                <div>668801-01-621564</div>
                <div>사용자</div>
                <div>회원</div>
                <div><a href=""><img src="../resources/images/admin/edit.png"></a></div>
    
            </div>

        </div>

    </main>

</div>

</body>
</html>