<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/blank/resources/css/created/status.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>

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
                                    <a href="/blank/project/created/list?gno='+sp[i].no+'">관리</a>
                                </div>
                                <div class="delete-button">
                                    <a >삭제</a>
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
    <div id="popup_layer">
        <div class="popup_box">
            <div class="popup_cont">
				<img class="logo-img" src="/blank/resources/images/blank.png">
                <p>
                    프로젝트를 삭제하시겠습니까?<br>
                    프로젝트를 삭제하시면,<br>
                    작성했던 모든 내용이 삭제됩니다.
                </p>
            </div>
            <div class="popup_btn">
                <a href="javascript:closePop();">Close</a>
                <a id="chk_today" href="javascript:closeToday();" class="close_day">Do not open for a day</a> 
            </div>
        </div>
    </div>
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>

    <script>

    /* 모달창 */
    $('.delete-button').on('click', function() {
        $('#popup_layer').css('display', 'block');
    });
    function closePop() { 
        document.getElementById("popup_layer").style.display = "none";
    }
    </script>
</body>
</html>