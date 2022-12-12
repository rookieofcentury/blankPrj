<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/blank/resources/css/created/status.css">

</head>
<body>

    <%@ include file = "/WEB-INF/views/common/header.jsp" %>

    <div id="container">
        <div class="header">
            <span>내가 만든 프로젝트</span>
        </div>
        <div class="taps">
            <div>전체</div>
            <div>작성중</div>
            <div>심사중</div>
            <div>승인됨</div>
            <div>반려됨</div>
            <div>진행중</div>
            <div>종료</div>
        </div>
        <div class="myprj-list">
            <div>
                <div>작성 중 1</div>
                <div class="list-box">
                    <div class="prj-img">img</div>
                    <div class="prj-info">
                        <div class="prj-content">
                            <div>
                                <div></div>
                                <div></div>
                                <div></div>
                            </div>
                            <div>
                                <div></div>
                                <div></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
</html>