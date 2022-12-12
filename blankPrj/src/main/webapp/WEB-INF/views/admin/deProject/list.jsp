<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고된 프로젝트</title>
<link rel="stylesheet" href="/blank/resources/css/admin/deProject/list.css">
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
                <h2>신고된 프로젝트</h2>
            </div>           
        </div>
        
        <div class="project-board">

            <form action="" method="get" id="project-search-form">
            
                <div class="project-search">
                
                    <select class="category">
                        <option value="title">제목</option>
                        <option value="name">작성자</option>
                    </select
                    ><input type="text" name="keyword">
                    <div class="search-icon"><input type="image" src="../resources/images/admin/search.png" alt="search.png"></div>
                
                </div>
                
            </form>
    
            <div class="project-list">
    
                <div class="project-list-top">전체 신고 프로젝트 64개</div>
    
                <div>신고 번호</div>
                <div>작성자</div>
                <div>제목</div>
                <div>내용</div>
                <div>신고 프로젝트</div>
                <div>신고 일자</div>
                <div>처리 상태</div>
                <div>수정</div>
        
                <div>1</div>
                <div>홍현정</div>
                <div>굉장히 불쾌합니다.</div>
                <div>프로젝트가 너무 쩔잖아요. 질투 유발로 신고합...</div>
                <div>3</div>
                <div>2022-12-04</div>
                <div>접수 대기</div>
                <div><a href=""><img src="../resources/images/admin/edit.png"></a></div>
    
            </div>

        </div>

    </main>
</div>
    
</body>
</html>