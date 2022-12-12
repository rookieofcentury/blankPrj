<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헬프센터 관리 | 자주 묻는 질문(FAQ)</title>
<link rel="stylesheet" href="/blank/resources/css/admin/faq/list.css">
</head>
<body>

<div class="faq-board-content">
    
    <div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
    
    <main>
    
            <div class="faq-board-header">
                <div>
                    <h1>헬프센터 관리</h1>
                </div>
                <div>
                    <h2>자주 묻는 질문(FAQ)</h2>
                </div>           
            </div>
            
            <div class="faq-board">
    
                <form action="" method="get" id="faq-search-form">
    
                    <div class="faq-search">
    
                        <select class="category">
                            <option value="title">제목</option>
                            <option value="name">작성자</option>
                        </select
                        ><input type="text" name="keyword">
                        <div class="search-icon"><input type="image" src="../resources/images/admin/search.png" alt="search.png"></div>
                        <a href=""><button>작성</button></a>
                        
                    </div>
    
    
                </form>
        
                <div class="faq-list">
        
                    <div class="faq-list-top">전체 FAQ 64개</div>
        
                    <div>번호</div>
                    <div>제목</div>
                    <div>내용</div>
                    <div>작성자</div>
                    <div>작성날짜</div>
                    <div>삭제 여부</div>
                    <div>수정</div>
            
                    <div>1</div>
                    <div>[FAQ] 블랭크(blank)는 무엇인가요?</div>
                    <div>안녕하세요. 블랭크(blank)는 영어로는 빈 공간이...</div>
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