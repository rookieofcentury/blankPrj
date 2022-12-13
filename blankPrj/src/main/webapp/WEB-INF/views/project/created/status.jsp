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
                    <div class="prj-img"><img src="/blank/resources/images/blank.png" alt="프로젝트 썸네일"></div>
                    <div class="prj-info">
                        <div class="prj-content">
                            <div class="content-info">
                                <div>노력은 누구나 하잖아요? 혼을 갈아 넣은 업그레이드 된 프리미엄 안경</div>
                                <div>누적 펀딩률 8,988%, 평점 4.5점! 노력을 넘어 안경을 위해 "혼"을 담은 세미콜론의 와디즈 한정 두 번째 혼 프로젝트 서포터 의견을 듣고 업그레이드 되어 돌아왔습니다</div>
                            </div>
                            <div>
                                <div class="management-button">
                                    <a href="#">관리</a>
                                </div>
                                <div class="delete-button">
                                    <a href="#">삭제</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div>작성 중 1</div>
                <div class="list-box">
                    <div class="prj-img"><img src="/blank/resources/images/blank.png" alt="프로젝트 썸네일"></div>
                    <div class="prj-info">
                        <div class="prj-content">
                            <div class="content-info">
                                <div>노력은 누구나 하잖아요? 혼을 갈아 넣은 업그레이드 된 프리미엄 안경</div>
                                <div>누적 펀딩률 8,988%, 평점 4.5점! 노력을 넘어 안경을 위해 "혼"을 담은 세미콜론의 블랭크의 한정 두 번째 혼 프로젝트 서포터 의견을 듣고 업그레이드 되어 돌아왔습니다</div>
                            </div>
                            <div>
                                <div class="management-button">
                                    <a href="#">관리</a>
                                </div>
                                <div class="delete-button">
                                    <a href="#">삭제</a>
                                </div>
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