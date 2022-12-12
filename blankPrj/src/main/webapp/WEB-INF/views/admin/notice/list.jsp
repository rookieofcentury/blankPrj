<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="/blank/resources/css/admin/notice/list.css">
</head>
<body>

<div class="notice-board-content">
    
    <div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
    
    <main>
    
        <div class="notice-board-header">
            <div>
                <h1>공지사항 관리</h1>
            </div>
            <div>
                <h2>공지사항</h2>
            </div>           
        </div>
        
        <div class="notice-board">

            <form action="" method="get" id="notice-search-form">

                <div class="notice-search">

                    <select class="category">
                        <option value="title">제목</option>
                        <option value="name">작성자</option>
                    </select
                    ><input type="text" name="keyword">
                    <div class="search-icon"><input type="image" src="../resources/images/admin/search.png" alt="search.png"></div>
                    <a href=""><button>작성</button></a>
                    
                </div>


            </form>
    
            <div class="notice-list">
    
                <div class="notice-list-top">전체 공지사항 64개</div>
    
                <div>번호</div>
                <div>제목</div>
                <div>내용</div>
                <div>작성자</div>
                <div>작성날짜</div>
                <div>삭제 여부</div>
                <div>수정</div>
        
                <div>1</div>
                <div>[이용 안내] 시스템 점검 일정 안내</div>
                <div>안녕하세요. 블랭크 입니다. 언제나 블랭크를...</div>
                <div>admin01</div>
                <div>2022-12-04</div>
                <div>N</div>
                <div><a href=""><img src="../resources/images/admin/edit.png"></a></div>
    
            </div>

        </div>

    </main>

</div>
    
</body>
</html>