<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헬프센터 관리 | 고객센터</title>
<link rel="stylesheet" href="/blank/resources/css/admin/help/list.css">
</head>
<body>

    <div class="help-board-content">
    
        <div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
        
        <main>
        
            <div class="help-board-header">
                <div>
                    <h1>헬프센터 관리</h1>
                </div>
                <div>
                    <h2>고객센터</h2>
                </div>           
            </div>
            
            <div class="help-board">
    
                <form action="" method="get" id="help-search-form">
                
                    <div class="help-search">
                    
                        <select class="category">
                            <option value="title">제목</option>
                            <option value="name">작성자</option>
                        </select
                        ><input type="text" name="keyword">
                        <div class="search-icon"><input type="image" src="../resources/images/admin/search.png" alt="search.png"></div>
                    
                    </div>
                    
                </form>
        
                <div class="help-list">
        
                    <div class="help-list-top">전체 문의 64건</div>
        
                    <div>번호</div>
                    <div>제목</div>
                    <div>내용</div>
                    <div>작성자</div>
                    <div>작성 날짜</div>
                    <div>처리 여부</div>
                    <div>수정</div>
            
                    <div>1</div>
                    <div>문의합니다.</div>
                    <div>그 어쩌구 저쩌구는 어디에 있나요?</div>
                    <div>user01</div>
                    <div>2022-12-04</div>
                    <div>답변 대기</div>
                    <div><a href=""><img src="../resources/images/admin/edit.png"></a></div>
        
                </div>
    
            </div>
    
        </main>
    </div>
    
</body>
</html>