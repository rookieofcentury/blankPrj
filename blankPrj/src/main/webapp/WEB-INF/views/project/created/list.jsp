<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 기획</title>
<link rel="stylesheet" href="/blank/resources/css/created/list.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

</head>
<body>

    <div id="container">
        <div class="navi-menu">
            <div class="content-editor">
                <div class="editor-logo">
                    <div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/></svg>
                        <div>내가 만든 프로젝트</div>
                    </div>
                    <img class="logo-img" src="/blank/resources/images/blank.png" onclick="location.href=''">
                    <div class="editor-buttons">
                        <div class="buttons-storage">메뉴</div>
                        <div class="buttons-request">심사요청</div>
                        <div class="buttons-goout"><img src="/blank/resources/images/project/icon_goout.png"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="top-content">
            <div class="button-wrap">
                <button>미리 보기</button>
                <div>10% 완료</div>
            </div>
            <div class="profile-wrap">
                <div><img class="profile-img" src="/blank/resources/images/blank.png"></div>
                <div>청애름의 프로젝트</div>
            </div>
        </div>
        <div class="header-menu">
            <div class="content-menu">
                <div>프로젝트 기획</div>
                <div>서베이</div>
                <div>후원금 명세</div>
                <div>후원자 관리</div>
            </div>
        </div>
        <div class="myprj-list">
            <div>
                <div class="list-box">
                    <div class="prj-img"><img src="/blank/resources/images/blank.png" alt="프로젝트 썸네일"></div>
                    <div class="prj-info">
                        <div class="prj-content">
                            <div class="content-info">
                                <div>노력은 누구나 하잖아요? 혼을 갈아 넣은 업그레이드 된 프리미엄 안경</div>
                                <div class="content-status">
                                    <div class="edit-icon"><img src="/blank/resources/images/admin/edit.png"></div>
                                    <div>작성 중</div> 
                                </div>
                                <div class="move-button">
                                    <a href="#">바로가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="myprj-list">
            <div>
                <div class="list-box">
                    <div class="prj-img"><img src="/blank/resources/images/blank.png" alt="프로젝트 썸네일"></div>
                    <div class="prj-info">
                        <div class="prj-content">
                            <div class="content-info">
                                <div>노력은 누구나 하잖아요? 혼을 갈아 넣은 업그레이드 된 프리미엄 안경</div>
                                <div class="content-status">
                                    <div class="edit-icon"><img src="/blank/resources/images/admin/edit.png"></div>
                                    <div>작성 중</div> 
                                </div>
                                <div class="move-button">
                                    <a href="#">바로가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>