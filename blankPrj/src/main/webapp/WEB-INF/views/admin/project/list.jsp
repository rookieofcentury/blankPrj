<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/blank/resources/css/admin/project/list.css">
</head>
<body>

<div class="project-board-content">
    
    <div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
    
    <main>
    
        <div class="project-board-header">
            <div>
                <h1>프로젝트 관리</h1>
            </div>
            <div>
                <h2>프로젝트</h2>
            </div>           
        </div>
        
        <div class="project-board">

            <form action="" method="get" id="project-search-form">
                <div class="project-search">
                    <select class="category">
                        <option value="title">제목</option>
                        <option value="creator">창작자</option>
                    </select
                    ><input type="text" name="keyword">
                    <div><input type="image" src="../resources/images/admin/search.png" alt="search.png"></div>
                </div>
            </form>
    
            <div class="project-list">
    
                <div class="project-list-top">전체 프로젝트 64개</div>
    
                <div>프로젝트 번호</div>
                <div>창작자</div>
                <div>제목</div>
                <div>카테고리</div>
                <div>목표 금액</div>
                <div>펀딩 일정</div>
                <div>진행 상태</div>
                <div>수정</div>
        
                <div>1</div>
                <div>NICK01</div>
                <div>노력은 누구나 하잖아요? 혼을 갈아 넣...</div>
                <div>패션/잡화</div>
                <div>500,000원</div>
                <div>2022-11-24 ~ 2022-12-15</div>
                <div>승인 대기</div>
                <div><a href=""><img src="../resources/images/admin/edit.png"></a></div>
    
            </div>

        </div>

    </main>
</div>
    
</body>
</html>