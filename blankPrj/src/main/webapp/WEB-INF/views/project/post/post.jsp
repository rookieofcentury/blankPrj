<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 등록</title>

<link rel="shortcut icon" href="/blank/resources/images/member/blank.ico">
<link rel="stylesheet" href="/blank/resources/css/project_post/post.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!-- 웹에디터 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>

<!-- 제이쿼리 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!-- alert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<!-- 날짜위젯 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<body>
<form action="/blank/project/post" method="post" id="postPrj" enctype="multipart/form-data" onsubmit="return checkAll();">
<div class="navi-menu">
        <div class="content-editor">
            <div class="editor-logo">
                <img class="logo-img" src="/blank/resources/images/blank.png" onclick="location.href='/blank'">
                <div><h1>프로젝트 등록</h1></div>
            </div>
            <div class="editor-buttons">
                <button type="button" id="storage" class="buttons-storage">임시저장</button>
                <button type="submit" class="buttons-request">심사요청</button>
                <div class="buttons-goout" onclick="location.href='/blank/project/created/'">
                    <img src="/blank/resources/images/project/icon_goout.png">
                </div>
            </div>
        </div>
</div>

<div id="mem-header"></div>
    <div id="mem-full">
        
            <input type="radio" id="default-info" name="mem-navi" checked>
            <label for="default-info" ><span id="icon1" class="material-symbols-outlined">기본정보</span></label>
            <input type="radio" id="option-create" name="mem-navi">
            <label for="option-create" ><span class="material-symbols-outlined md-24">옵션설계</span></label>
            <input type="radio" id="creator-info" name="mem-navi">
            <label for="creator-info" ><span class="material-symbols-outlined">창작자정보</span></label>
          
		<div id="mem-mp-main" class="mp-main1 main" >
		<div id="container">
        <div class="content">
                        <div id="mem-mp1-content">
							<div class="content-title">
				              <div class="title-info">
				                  <div>제목</div>
				                  <div>프로젝트의 주제, 특징이 드러나는 제목을 붙여주세요.</div>
				              </div>
				              <div class="title-write">
				                  <div><input type="text" placeholder="내용 입력" name="title" value='<c:out value="${prjInfo.title}"/>'></div>
				                  <p>40글자 남음</p>
				              </div>
				          </div>
            <div class="content-category">
                <div class="category-info">
                    <div>카테고리</div>
                    <div>프로젝트 성격과 가장 일치하는 카테고리를 선택해주세요.<br>적합하지 않을 경우 운영자에 의해 조정될 수 있습니다.</div>
                </div>
                <div class="category-select">
                    <select name="category" id="cate-option">
                        <c:forEach items="${category}" var="cate">
                        <option value="${cate.no}">${cate.name}</option>
						</c:forEach>
                    </select>
                    <div></div>
                </div>
            </div>
            <div class="content-img">
                <div class="img-info">
                    <div>대표이미지</div>
                    <div>프로젝트의 내용을 쉽게 파악하고 좋은 인상을 받을 수 있도록 이미지로 등록해 주세요.</div>
                </div>
                <div class="img-upload">
                    <c:if test="${not empty prjInfo.changeName}">
                        <img id="img-view" src="/blank/resources/upload/project/${prjInfo.changeName}" alt="플젝 사진" />
                    </c:if>
                    <input type="file" name="prjfile" id="input-prjfile" value='<c:out value="${prjInfo.changeName}"/> '>
                </div>
            </div>
            <div class="content-price">
                <div class="price-info">
                    <div>목표금액</div>
                    <div>프로젝트를 완수하기 위해 필요한 금액을 설정해주세요.</div>
                </div>
                <div class="price-box">
                    <div class="price-write"><input type="number" placeholder="최소 50만원 이상의 금액을 입력해 주세요" name="price" value='<c:out value="${prjInfo.price}"/>'>  <!-- onkeyup="inputNumberFormat(this)" --> </div>
                    <div>원</div>
                </div>
            </div>
            <div class="content-date">
                <div class="date-info">
                    <div>펀딩 일정</div>
                    <div>설정한 일시가 되면 펀딩이 자동 시작됩니다.</div>
                </div>
                <div class="date-write">
                    <ol>
                        <li>
                            <div class="date-start">
                                <div class="start-day">
                                    <p>시작일</p>
                                    <input name="startDate" type="date" autocomplete="off" readonly="readonly" value='${fn:substring(prjInfo.startDate,0,10)}'>
                                </div>
                                <div class="start-time">
                                    <p>시작시간</p>
                                    <select name="time" id="time-option">
                                        <option value="${tt.no}">==시작시간 선택==</option>
                                         <c:forEach items="${time}" var="tt">
                                        <option value="${tt.no}">${tt.time}시</option>
										</c:forEach> 
                                    </select>
                                </div>
                            </div>
                            <div class="date-period">
                                <!-- <p>펀딩기간</p> -->
                                <p></p>
                            </div>
                        </li>
                        <li>
                            <div class="date-end">
                                <div class="end-day">
                                    <p>종료일</p>
                                    <input name="endDate" type="date" autocomplete="off" readonly="readonly"  value='${fn:substring(prjInfo.endDate,0,10)}'>
                                </div>
                                <div class="date-calculate">
                                    <div class="calculate-notice">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-triangle" viewBox="0 0 16 16">
                                            <path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/>
                                            <path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
                                        </svg> 
                                        <p>정산일</p>
                                    </div>
                                    <div>후원자 결제 종료 다음 날부터 7영업일</div>
                                </div>
                            </div>
                        </li>
                    </ol>
                </div>
            </div>
            <div class="content-plan">
                <div class="plan-info">
                    <div>예상 전달일</div>
                    <div>예상 전달일은 후원자를 기준으로 잡아주세요. <br>발송할 수 있는 날짜에 1~3일 정도 더하여 정해주시는걸 추천드려요.</div>
                </div>
                <div class="plan-write">
                    <div>
                        <div><input name="deliveryDate" type="date" autocomplete="off" readonly="readonly" value='${fn:substring(prjInfo.deliveryDate,0,10)}'></div>
                    </div>
                </div>
            </div>
            <div class="content-url">
                <div class="url-info">
                    <div>프로젝트 페이지 주소</div>
                    <div>프로젝트페이지로 접속하기 위한 URL을 설정해 주세요.</div>
                </div>
                <div class="url-write">
                    <div class="url-blank">www.blank.com/</div>
                    <div class="url-text"><input type="text" placeholder="URL을 입력해 주세요" name="url" value='<c:out value="${prjInfo.url}"/>'></div>
                    <p>영문으로 최소 3자 이상 입력해 주세요</p>
                </div>
            </div>
            <div class="content-summary">
                <div class="summary-info">
                    <div>프로젝트 요약</div>
                    <div>프로젝트를 빠르게 이해할 수 있도록 간략하게 소개해 주세요.</div>
                </div>
                <div class="summary-write">
                    <div class="summary-text">
                        <textarea placeholder="내용 입력" name="summary" value='<c:out value="${prjInfo.summary}"/>'></textarea>
                    </div>
                    <p>100글자 남음</p>
                </div>
            </div>
            <div class="content-stroy">
                <div class="story-box">
                    <div class="story-info">
                        <div>프로젝트 스토리</div>
                        <div>무엇을 만들기 위한 프로젝트인지 분명히 알려주세요.</div>
                    </div>
                    <div class="story-write">
                        <div class=story-notice>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-triangle" viewBox="0 0 16 16">
                                <path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/>
                                <path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
                            </svg> 
                            <p>작성의 어려움을 겪고있다면 아래 내용이 포함되도록 작성해 보세요!</p>
                        </div>
                        <div class="story-tip">
                            Q. 무엇을 만들기 위한 프로젝트 인가요?<br>
                            Q. 프로젝트를 간단히 소개한다면?<br>
                            Q. 이 프로젝트를 시작하게 된 배경이 무엇인가요?
                        </div>
                    </div>
                </div>
                <div class="story-editor">
                    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
                    <textarea name="story" id="prj-content" required></textarea>
                </div>
            </div>    
            </div>
            </div>
            </div>   
		</div>

    <!-- 컨텐츠 2 -->
	<div class="mp-main2 main">
        <div class="main2-header">
            <div><h2>↓ 세트를 구성할 아이템을 추가해 주세요 ↓</h2></div>
        </div>
        <!-- 아이템 추가 모달창 -->
        <div id="label-center">
            <input type="checkbox" id="itemPopup">
            <label for="itemPopup">아이템 추가</label>
            <div>
                <div>
                        <div class="content-box">
                            <div class="preview-item">
                                <div class="preview-set">
                                    <div>내가 만든 아이템</div>
                                    <!-- <% if(1 < 2){%>
                                        <ul class="set-box">
                                            <li class="item-list">
                                                <button type="button" class="itemBox">
                                                    <div class="item-box">
                                                        <strong>과일</strong>
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
                                                            <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
                                                        </svg>
                                                    </div>
                                                    <ol type="1" class="set-item">
                                                        <li>사과</li>
                                                    </ol>
                                                </button>
                                            </li>
                                        </ul>
                                    <%}else{ %>
                                        <div class="set-none">만든 아이템이 없습니다.</div>
                                    <%}%> -->
                                </div>
                            </div>
                            <div class="making-box">
                                <div class="making-set">
                                    <div>
                                        <div class="post-set">
                                            <div class="set-notice">
                                                <strong>아이템명</strong>
                                                <div>아이템은 세트에 포함되는 구성 품목입니다. <br>세트를 구성할 아이템을 만들어 보세요.</div>
                                            </div>
                                            <div class="item-option">
                                                <input placeholder="아이템을 입력해 주세요" name="itemName">
                                                <!-- <span>10글자 남음</span> -->
                                            </div>
                                        </div>
                                        <div class="post-set">
                                            <div class="set-notice">
                                                <strong>옵션 추가</strong>
                                            </div>
                                            <div class="add-option">
                                                <!-- <p class="none" onclick='noneOption()'>없음</p>
                                                <p class="add">추가</p> -->
                                                <input type="radio" id="option-none" name="radio" selected >
                                                <label for="option-none" ><p class="none">없음</p></label>
                                                <input type="radio" id="option-add" name="radio">
                                                <label for="option-add" ><p class="add">추가</p></label>
                                            </div>
                                        </div>
                                            <div class="textbox">
                                                <textarea name="addOption" cols="77" rows="5" placeholder="콤마(,)로 구분해서 작성하시면 항목이 생성됩니다.&#13;&#10; ex) 블랙, 화이트, 레드"></textarea>
                                            </div>
                                        <div class="item-submit">
                                            <input type="button" value="적용" name="apply">
                                            <input type="button" value="추가" name="itemSave">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <label for="itemPopup"></label>
                </div>
                <label for="itemPopup"></label>
            </div>
        </div>

        <div id="option-container">
            <div class="content">
            <div id="mem-mp2-content">
                <div class="content-box">
                    <div class="preview-box">
                        <div class="preview-range">
                            <div>내가 만든 세트</div>
                            <% if(1 < 2){%>
                                <ul class="mySet">
                                    <!-- <li class="set-list">
                                        <button type="button">
                                            <div class="set-buttons">
                                                <strong>29,000원</strong>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
                                                    <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
                                                </svg>
                                            </div>
                                            <p class="set-name">과일 세트</p>
                                            <ul class="set-item">
                                                <li>사과 x 1</li>
                                                <li>바나나 x 1</li>
                                            </ul>
                                            <div class="set-quantity">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">
                                                    <path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
                                                </svg>
                                                <div>제한 수량</div>
                                                <div>200</div>
                                                <div>개</div>
                                            </div>
                                        </button>
                                        <button type="button">
                                        </button>
                                    </li> -->
                                </ul>
                            <%}else{ %>
                                <div class="set-none">만든 세트가 없습니다.</div>
                            <%}%>
                        </div>
                    </div>
                    <div class="making-box">
                        <div class="making-set">
                            <div>
                                <div class="post-set">
                                    <div class="set-notice">
                                        <div>세트 아이템</div>
                                        <div>세트는 후원자에게 프로젝트의 가치를 전달하는 수단입니다. <br>다양한 금액대로 여러 개의 선물을 만들어주세요.</div>
                                    </div>
                                    <div class="set-option">
                                        <select class="myitemList">
                                            <option>== 아 이 템 선 택 ==</option>
                                            <!-- <option>사과 (블루,레드,그린)</option>-->
                                        </select>
                                        <select class="myitemOption">
                                            <option>== 옵 션 선 택 ==</option>
                                        </select>
                                    </div>
                                </div>
                                <ul class="selected">
                                    <!--<li>
                                        <div>
                                            <div class="selected-item">사과</div>
                                            <div>
                                                <div class="quantity-box">
                                                    <button>
                                                        <img src="/blank/resources/images/project/minus.svg">
                                                    </button>
                                                    <input type="number" value="1" name="optionQuantity">
                                                    <button>
                                                        <img src="/blank/resources/images/project/plus.svg">
                                                    </button>
                                                </div>
                                                <button class="delete-button">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
                                                        <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
                                                    </svg>
                                                </button>
                                            </div>
                                        </div>
                                         <ol type="1">
                                            <li class="selected-opt">민트</li>
                                        </ol> 
                                    </li>
                                    <li>
                                    </li> -->
                                </ul>
                                <div class="set-insert">
                                    <div class="info-name">세트명</div>
                                    <div><input type="text" placeholder="세트명을 입력해 주세요." name="setName"></div>
                                </div>
                                <div class="set-insert">
                                    <div class="info-quantity">수량 설정</div>
                                    <div class="text-price">
                                        <div><input type="number" placeholder="수량을 입력해 주세요."  name="setQuantity"></div>
                                        <div>개</div>
                                    </div>
                                </div>
                                <div class="set-insert">
                                    <div class="info-price">
                                        <div>금액 설정</div>
                                        <div>배송되는 선물은 배송비를 포함해주세요.</div>
                                    </div>
                                    <div class="text-quantity">
                                        <div><input type="number" placeholder="금액을 입력해 주세요." name="setPrice"></div>
                                        <div>원</div>
                                    </div>
                                </div>
                                <div class="button-submit"><input type="button" value="저장" name="save"></div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>   
    </div>


    <!-- 컨텐츠 내용 3 -->
    <div class="mp-main3 main">
	<div id="container">
        <div class="content">
        <div id="mem-mp3-content">
            <!-- <div class="content-title">
                <div class="title-info">
                    <div>이름</div>
                    <div>창작자 개인이나 팀을 대표할 수 있는 이름을 써주세요.</div>
                </div>
                <div class="title-write">
                    <div><input type="text" placeholder="내용 입력" name="name"></div>
                    <p class="title-length">40글자 남음</p>
                </div>
            </div>
            <div class="content-category">
                <div class="category-info">
                    <div>대표이미지</div>
                    <div>3MB 이하의 JPG, JPEG, PNG 파일<br>해상도 1200x675 픽셀 이상</div>
                </div>
                <div>
                    <div>등록하기</div>
                </div>
            </div> -->
            <div class="content-title">
                <div class="title-info">
                    <div>소개</div>
                    <div>창작자님의 이력과 간단한 소개를 써주세요.</div>
                </div>
                <div class="creator-write">
                    <div><input type="text" placeholder="내용 입력" name="info"></div>
                    <p>40글자 남음</p>
                </div>
            </div>
            <!-- <div class="content-email">
                <div class="email-info">
                    <div>이메일</div>
                    <div>펀딩서비스 이용을 위해 추가 계약이나 약정이 필요할 수 있어요.<br>추가 발송될 전자 약정서를 체결할 이메일을 입력해 주세요.</div>
                </div>
                <div class="email-box">
                    <div class="email-area">
                        <div class="email-write"><input type="text" placeholder="이메일 입력" name="email"></div>
                        <div>
                            <input type="checkbox" id="info-check" name="">
                            <label for="info-check">회원정보와 동일</label>
                        </div>
                    </div>
                    <div>인증하기</div>
                </div>
            </div>
            <div class="content-phone">
                <div class="phone-info">
                    <div>전화번호</div>
                    <div>창작자 본인 명의의 휴대폰 번호를 입력해주세요.</div>
                </div>
                <div class="phone-box">
                    <div class="phone-write"><input type="text" placeholder="내용 입력" name="phone"></div>
                    <div>
                        <input type="checkbox" id="email-check" name="">
                        <label for="email-check"> 회원정보와 동일</label>
                    </div>
                </div>
            </div> -->
            <div class="content-policy">
                <div class="policy-info">
                    <div>정산 정책 확인</div>
                    <div>블랭크의 정산 정책을 반드시 확인해 주세요.</div>
                </div>
                <div class="policy-box">
                    <button type="button" id="show">
                        <div class="policy-agree"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">
                            <path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
                        </svg>확인하기</div></button>
                    <div class="background">
                        <div class="window">
                            <div class="popup">
                            <div id="close">
                                <div>
                                    <strong>이런 순서로 진행돼요</strong>
                                    <ul>
                                        <li>프로젝트가 성공적으로 종료되면 종료일 기준 약 10영업일 이내에 바로정산(1차 정산)이 시작됩니다.</li>
                                        <li>바로정산 단계에서는 최종 금액의 일부가 먼저 지급됩니다.</li>
                                    
                                    <ol type="1" class="popup-ol">
                                        <li>최종 결제 금액이 1,000만 원 미만<br>
                                            최종 결제 금액에서 블랭크 중개 수수료, 결제(카드사 수수료 등) 수수료를 제외한 금액의 80%가 지급됩니다.
                                        </li>
                                        <li>최종 결제 금액이 1,000만 원 이상<br>
                                            최종 결제 금액에서 블랭크 중개 수수료, 결제(카드사 수수료 등) 수수료를 제외한 금액의 60%가 지급됩니다.
                                        </li>
                                    </ol>
                                        <li>리워드 발송과 펀딩금 반환이 완료되면 최종 펀딩 금액이 확정됩니다.</li>
                                        <li>최종 펀딩 금액 확정 5영업일 이내에 최종정산(2차 정산)이 진행됩니다.</li>
                                    </ul>
                                    <br>
                                    <strong>이렇게 알려 드려요</strong>
                                    <ul>
                                        <li>바로정산과 최종정산이 시작되면 정산 내역서와 함께 정산에 대한 안내가 메일로 발송됩니다.</li>
                                    </ul>
                                </div>
                                <div class="close-button">
                                    <input type="checkbox" id="policy-check">
                                    <label for="policy-check">정산 정책을 확인하였습니다.</label>
                                    <!-- <div>팝업닫기</div>  -->
                                </div>
                            </div>
                            </div>
                        <div>
                            <div></div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-calculate">
                <div class="calculate-info">
                    <div>정산 계좌정보</div>
                    <div>펀딩 성공시 정산금을 수령할 계좌정보를 입력해 주세요.</div>
                </div>
                <div class="calculate-write">
                    <div><input type="text" placeholder="은행명 입력" name="bank" value='<c:out value="${memberInfo.bank}"/>'></div>
                    <div><input type="text" placeholder="계좌번호 입력" name="account" value='<c:out value="${memberInfo.account}"/>'></div>
                    <p>특수 문자(-)없이 숫자만 입력해 주세요</p>
                    <div><input type="text" placeholder="예금주명 입력" name="depositor" value='<c:out value="${memberInfo.depositor}"/>'></div>
                </div>
            </div>
            </div>
            </div>
            </div>
            </div>
            </form>
            
   <script>

   const config = {
            dateFormat: 'yy-mm-dd',
            changeMonth: true,
            changeYear: true,
            showOn: "both",
            buttonImageOnly: true,
            buttonImage: "/blank/resources/images/project/calendar2-date.svg",
            buttonText: "Calendar",
            showOtherMonths: true,
            selectOtherMonths: true,
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년'
       }

       $(function() {
           $( "input[name='startDate']" ).datepicker(config);
       });
       $(function() {
           $( "input[name='endDate']" ).datepicker(config);
       });
       $(function() {
           $( "input[name='deliveryDate']" ).datepicker(config);
       });

       const editor = new toastui.Editor({
            el: document.querySelector('.story-editor'),
            previewStyle: 'vertical',
            height: '500px',
            initialEditType: 'markdown',
            initialValue: '안녕하세요. 블랭크입니다.',
            language : 'ko'
        });
       
       //온 서브밋을 위한 변수 선언;
       let titleCheckReturn = false;
       let priceCheckReturn = false;
       let urlCheckReturn = false;
       let summaryCheckReturn = false;

       //글자수 체크(제목)
       $('input[name="title"]').keyup(function(e) {
           titleCheckReturn = false;
           var content = $(this).val();
           $('.title-write > p').text(40 - content.length + "글자 남음"); 
           document.querySelector(".title-write > p").style.color = "red";
           if (content.length > 40) {
               alert("최대 40글자까지 입력 가능합니다.");
               $(this).val(content.substring(0, 40));
               $('.title-write > p').text("0글자 남음");
           }else{
               titleCheckReturn = true;
           }
       });
       //유효성 체크(제목)
       var replaceKorean =   /[ㄱ-ㅎㅏ-ㅣ]/gi;
       $("input[name='title']").on("focusout", function() {
           var x = $(this).val();
           if (x.length > 0) {
               if (x.match(replaceKorean)) {
               }
               $(this).val(x);
           }
           }).on("keyup", function() {
               $(this).val($(this).val().replace(replaceKorean, ""));
       });

       //글자수 체크(목표금액)
       $("input[name='price']").on("focusout", function() {
           priceCheckReturn = false;
           var x = $(this).val();
           if (x < 500000) {
            // Swal.fire('50만원 이상의 금액을 입력해 주세요', '화끈하시네요~!', 'success');
            Swal.fire({
                title: '안내 메시지',
                text: "50만원 이상의 금액을 입력해 주세요",
                icon: 'error',
                confirmButtonColor: '#567ACE'
            });
            // swal("50만원 이상의 금액을 입력해 주세요");
           }else{
               priceCheckReturn = true;
           }
       });

       //펀딩일수 계산
       $("input[name='endDate']").on("focusout", function() {
           var date1 = $("input[name='startDate']").datepicker({ dateFormat: 'dd-mm-yy' }).val();
           var date2 = $("input[name='endDate']").datepicker({ dateFormat: 'dd-mm-yy' }).val();

           var today = new Date();
           var year = today.getFullYear();
           var month = ('0' + (today.getMonth() + 1)).slice(-2);
           var day = ('0' + today.getDate()).slice(-2);
           var dateString = year + '-' + month  + '-' + day;
        
           if (!$("input[name='startDate']").val()) {
               Swal.fire({
                    title: '안내 메시지',
                    text: "시작일을 입력해 주세요",
                    icon: 'error',
                    confirmButtonColor: '#567ACE'
                });
           }
           if (date2 > date1){ 
               Swal.fire({
                    title: '안내 메시지',
                    text: "시작일이 종료일보다 늦어요",
                    icon: 'error',
                    confirmButtonColor: '#567ACE'
                }); 
           }
            if (date1 < dateString){
                Swal.fire({
                    title: '안내 메시지',
                    text: "오늘 날짜 이후로 선택해 주세요",
                    icon: 'error',
                    confirmButtonColor: '#567ACE'
                }); 
            }
       });

       
       //글자수 체크(url)
       $("input[name='url']").on("focusout", function() {
           var content = $(this).val();
           if (content.length < 3) {
               Swal.fire({
                    title: '안내 메시지',
                    text: "3자 이상 입력해주세요",
                    icon: 'error',
                    confirmButtonColor: '#567ACE'
                });
           }
       });
       //유효성 체크(url)
       var checkKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
       var checkEnglish = /[a-zA-Z]/;   
       var checkEmoji = /[~!@#$%^&*()_+|<>?:{}]/; 
       var checkBlank = /\s/g;
       $('input[name="url"]').keyup(function(e) {
           urlCheckReturn = false;
           var content = $(this).val();
           if(checkEnglish.test(content) && !checkKorean.test(content) && !checkEmoji.test(content) ) {
               urlCheckReturn = true;
           }
       }).on("keyup", function() {
               $(this).val($(this).val().replace(checkKorean, ""));
               $(this).val($(this).val().replace(checkEmoji, ""));
               $(this).val($(this).val().replace(checkBlank, ""));
       });

       //글자수 체크(요약)
       $('.summary-text > textarea').keyup(function(e) {
           summaryCheckReturn = false;
           var content = $(this).val();
           $('.summary-text + p').text(100 - content.length + "글자 남음"); 
           document.querySelector(".summary-text + p").style.color = "red";
           if(content.length > 0){
               content.match(replaceKorean)
               $(this).val($(this).val().replace(replaceKorean, ""));
               if (content.length > 100) {
                    Swal.fire({
                        title: '안내 메시지',
                        text: "최대 100글자까지 입력 가능합니다",
                        icon: 'error',
                        confirmButtonColor: '#567ACE'
                    });
                   $(this).val(content.substring(0, 100));
                   $('.summary-text + p').text("0글자 남음");
               }
           }   summaryCheckReturn = true;
       });
       
       //창작자 정보
       //모달창
        function show () {
            document.querySelector(".background").className = "background show";
        }
        function close () { 
            document.querySelector(".background").className = "background";
        }
        document.querySelector("#show").addEventListener('click', show);
        document.querySelector("#close").addEventListener('click', close);

        //온 서브밋을 위한 변수 선언;
        let nameCheckReturn = false;
        let infoCheckReturn = false;
        let bankCheckReturn = false;
        let accountCheckReturn = false;
        let depositorCheckReturn = false;

        //글자수 체크(이름)
        $('input[name="name"]').keyup(function(e) {
            let nameCheckReturn = false;
            var content = $(this).val();
            $('.title-length').text(40 - content.length + "글자 남음"); 
            document.querySelector(".title-length").style.color = "red";
            if (content.length > 40) {
                alert("최대 40글자까지 입력 가능합니다.");
                $(this).val(content.substring(0, 40));
                $('.title-length').text("0글자 남음");
            }
        });
        var replaceKorean =   /[ㄱ-ㅎㅏ-ㅣ]/gi;
        
        $("input[name='name']").on("focusout", function() {
        var x = $(this).val();
            if (x.length > 0) {
                if (x.match(replaceKorean)) {
                }
                $(this).val(x);
            }
            }).on("keyup", function() {
                //$(this).val($(this).val().replace(replaceEmoji, ""));
                $(this).val($(this).val().replace(replaceKorean, ""));
        });
    
         //글자수 체크(소개)
        $('input[name="info"]').keyup(function(e) {
            var content = $(this).val();
            $('.creator-write > p').text(40 - content.length + "글자 남음"); 
            document.querySelector(".creator-write > p").style.color = "red";
            if (content.length > 40) {
                Swal.fire({
                    title: '안내 메시지',
                    text: "최대 40글자까지 입력 가능합니다",
                    icon: 'error',
                    confirmButtonColor: '#567ACE'
                });
                $(this).val(content.substring(0, 40));
                $('.creator-write > p').text("0글자 남음");
            }else{
                infoCheckReturn = true;
            }
        });
        //유효성 체크(소개)
        var replaceKorean =   /[ㄱ-ㅎㅏ-ㅣ]/gi;
        $("input[name='info']").on("focusout", function() {
        var x = $(this).val();
            if (x.length > 0) {
                if (x.match(replaceKorean)) {
                }
                $(this).val(x);
            }
            }).on("keyup", function() {
                $(this).val($(this).val().replace(replaceKorean, ""));
        });

        //유효성 체크(은행명)
        var checkNumber = /[0-9]/;    // 숫자 
        var checkEnglish = /[a-zA-Z]/;    // 문자 
        var checkEmoji = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
        var checkKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
        $('input[name="bank"]').keyup(function(e) {
            var content = $(this).val();
            if( checkKorean.test(content) && !checkNumber.test(content) && !checkEnglish.test(content) && !checkEmoji.test(content) ) {
                bankCheckReturn = true;
            }else{
                Swal.fire({
                    title: '안내 메시지',
                    text: "한글만 입력 가능합니다! 다시 입력해주세요~",
                    icon: 'error',
                    confirmButtonColor: '#567ACE'
                });
                bankCheckReturn = false;
            }
        });

        //유효성 체크(계좌번호)
        var checkNumber = /^[0-9]*$/;
        $('input[name="account"]').keyup(function(e) {
            var content = $(this).val();
            if(!checkNumber.test(content)){
                Swal.fire({
                    title: '안내 메시지',
                    text: "숫자만 입력 가능합니다! 다시 입력해주세요~",
                    icon: 'error',
                    confirmButtonColor: '#567ACE'
                });
                accountCheckReturn = false;
            }
            accountCheckReturn = true;
        });

        //유효성 체크(예금주)
        var checkNumber = /[0-9]/;   
        var checkEnglish = /[a-zA-Z]/;   
        var checkEmoji = /[~!@#$%^&*()_+|<>?:{}]/; 
        var checkKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; 
        $('input[name="depositor"]').keyup(function(e) {
            var content = $(this).val();
            if( checkKorean.test(content) && !checkNumber.test(content) && !checkEnglish.test(content) && !checkEmoji.test(content) ) {
                depositorCheckReturn = true;
            }else{
                Swal.fire({
                    title: '안내 메시지',
                    text: "한글만 입력 가능합니다! 다시 입력해주세요~",
                    icon: 'error',
                    confirmButtonColor: '#567ACE'
                });
                depositorCheckReturn = false;
            }
        });

        //정책 체크박스
        $(document).ready(function() {
            $('input[id="policy-check"]').on('click', function() {
                if ( $(this).prop('checked') ) {
                    $('.policy-agree').text("동의 완료"); 
                    $('.policy-agree').addClass("agree");
                } else {
                    $('.policy-agree').removeClass("agree");
                    $('.policy-agree').text("확인하기"); 
                    $('.policy-agree').off('click');
                }
            });
        });
       
       /*옵션 없음, 추가*/
       $("#option-add").click(function(){
            $(".textbox").show();
        });
        $("#option-none").click(function(){
            $(".textbox").hide();
        });

       //임시저장
        $('.buttons-storage').click(function() {
            var option = $('.selected-item').text();

            var price2 = $('input[name="price"]').val();
    
            let string = location.href.split('=');
            let query = string[1];
            
            var form = $('#postPrj')[0];
            var formData = new FormData(form);

            formData.append("option", option);
            formData.append("prjNo", query);
            formData.append("story", editor.getHTML());
            
            $.ajax({
                url  : "/blank/project/savePrj",
                type : "POST",
                data : formData,
                cache: false,
                contentType : false,
                processData: false , 
                enctype : "multipart/form-data",
	    	    success : function(x){
	    		   if(x == 1){
                    Swal.fire({
                        title: '안내 메시지',
                        text: "임시저장 되었습니다~",
                        icon: 'success',
                        confirmButtonColor: '#567ACE'
                    });
	    	   		}
	    	    },
	    	    error : function(x){
	    	        console.log("받아온 리절트" + x);
	    	    }
	       })
       });

        //온서브밋
       function checkAll(){
            if(!titleCheckReturn){ 
                Swal.fire({
                        title: '안내 메시지',
                        text: "제목이 입력되지 않았습니다",
                        icon: 'error',
                        confirmButtonColor: '#567ACE'
                    });
                return false;
            }
            if(!priceCheckReturn){ alert('목표금액이 입력되지 않았습니다.'); return false;}
            if(!urlCheckReturn){ alert('url이 입력되지 않았습니다'); return false;}
            if(!summaryCheckReturn){ alert('요약이 입력되지 않았습니다.'); return false;}
            
            if(!infoCheckReturn){ alert('소개가 입력되지 않았습니다.'); return false;}
            if(!bankCheckReturn){ alert('은행명이 입력되지 않았습니다'); return false;}
            if(!accountCheckReturn){ alert('계좌번호가 입력되지 않았습니다.'); return false;}
            if(!depositorCheckReturn){ alert('예금주가 입력되지 않았습니다.') ;return false;}
            Swal.fire({
            title: '안내 메시지',
            text: "심사요청 완료",
            icon: 'success',
            confirmButtonColor: '#567ACE'
        });
            return true;
       }

       let map = new Map([]);
       /*아이템 추가*/
       $('input[name=itemSave]').click(function(){
           var itemName = $('input[name=itemName]').val();
           var optionName = $('textarea[name=addOption]').val();
           
            var list = '';
            list +=  '<ul class="set-box">' + '<li class="item-list">' + '<button type="button" class="itemBox">'
            list += '<div class="item-box">' + '<div class="item-name">' + itemName + '</div>' 
            list +=  '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">' + 
                    '<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>' + '</svg>'
            list += '</div>' + '<ol type="1" class="set-item">' + '<li class="itemOption">' + optionName + '</li>' + '</ol>' 
            list += '</button>' + '</li>' + '</ul>'

            map.set(itemName,optionName);

            $(".preview-set").append(list);
            $('input[name=itemName]').val("");
            $('textarea[name=addOption]').val("");
        });

        /* select option에 집어넣기 (item) */   
        $('input[name=apply]').click(function(){
            if($(".item-name").text()){
                $('input[id*="itemPopup"]+ label + div').css("display", "none");

                var allItem = document.querySelectorAll( '.itemBox' );
                allItem.forEach(element => {
                const itemName = element.querySelector('.item-name').innerHTML;
                const itemOption = element.querySelector('.itemOption').innerHTML;

                var list = '';
                list += '<option value=' +  itemName +  '>' + itemName + '</option>';
                $(".myitemList").append(list);
                $('input[name=itemName]').val("");
                $('textarea[name=addOption]').val("");
                });
            }else{
                alert("아이템을 등록해 주세요")
            }
        });

        /* option에 집어넣기 (option) */
        var i = 0;
        $('.myitemList').change(function(){
            var opt = $('.myitemList option:selected').val();

            $(".myitemOption").empty();

            map.forEach(function(value, key) {
                // console.log('key : ' + key);
                // console.log('value : ' + value);
                if(key == opt){
                    var words = value.split(',');
                    for (var j = 0; j < words.length; j++){
                        var optionValue = i + 1;
                            var list = '';
                            list += '<option value=' +  optionValue +  '>' + words[j] + '</option>';
                            $(".myitemOption").append(list);
                        }
                    }
            });
        });

        /* item option append*/
        $('.myitemOption').change(function(){
            var item = $('.myitemList option:selected').val();
            var option = $('.myitemOption option:selected').text();
            
            var list = '';
            list += '<li>' + '<div>' + '<div class="selected-item">' + item + ' ' + '(' + option + ')' + '</div>' + '<div>' + '<div class="quantity-box">';
            list += '<button>' + '<img src="/blank/resources/images/project/minus.svg">' + '</button>';
            list += '<input type="number" value="1" name="optionQuantity">' + '<button>' + '<img src="/blank/resources/images/project/plus.svg">' + '</button>' + '</div>';
            list += '<button class="delete-button">' + '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">' + 
                    '<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>' + '</svg>';
            list += '</button>' + '</div>' + '</div>' ;
            //'<ol type="1">' + '<li class="selected-opt">' + option + '</li>' + '</ol>' + '</li>';
            $(".selected").append(list);
            
        });

    /* 플러스 마이너스 버튼 누르면 값 바뀌게 */
    $('.quantity-box > button:first-child').click(function() {
            var nextCntInput = $(this).next();
            nextCntInput.val(String(parseInt(nextCntInput.val()) - 1));
            if(nextCntInput.val() <= 0) {
                alert('0 이하로는 입력할 수 없습니다!');
                nextCntInput.val(1);
            }
        })
    $('.quantity-box > button:last-child').click(function() {
        var prevCntInput = $(this).prev();
        prevCntInput.val(String(parseInt(prevCntInput.val()) + 1));
        if(prevCntInput.val() <= 0) {
            alert('0 이하로는 입력할 수 없습니다!');
            prevCntInput.val(1);
        }
    });

    /*세트 append*/
    $('input[name=save]').click(function(){
        if(!$('input[name=setName]').val().trim() == '' && !$('input[name=setPrice]').val().trim() == '' && !$('input[name=setQuantity]').val().trim() == ''){
            var list = '';
            list += '<li class="set-list">' + '<button type="button">' + '<div class="set-buttons">' + '<strong>' + $('input[name=setPrice]').val() + '원' + '</strong>' 
                list += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">' + '<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>' +
                    '</svg>' + '</div>' + '<p class="set-name">' + $('input[name=setName]').val() + '</p>';
                    list += '<ul class="set-item">' + '<li>' + $('.selected-item').text() + '</li>' + '</ul>'
                    list += '<div class="set-quantity">' + '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">' + '<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>'+ '</svg>';
                        list += '<div>' + '제한 수량' + '</div>' + '<div>' + $('input[name=setQuantity]').val() + '</div>' + '<div>' + '개' + '</div>' + '</div>' + '</button>'
                        list += '<button type="button">' + '</button>' + '</li>';
                        $(".mySet").append(list);
                        $('input[name=setName]').val("");
                        $('input[name=setQuantity]').val("");
                        $('input[name=setPrice]').val("");
                        $(".selected").empty();
            }else{
                alert("모든 항목을 입력해 주세요");
            }
    });

    $(document).ready(function() {
		// editor에 vo에 있는 content 내용 채우기
		var prjStory = '${prjInfo.story}';
		editor.setHTML(prjStory);

		// 현재 DB에 있는 카테고리 조사해서 옵션 몇 개 넣을지 정하기
		var cateLength = $('#cate-option option').length;
		var prjCategory = '${prjInfo.category}';
		
		// DB의 행 개수만큼 jsp에 옵션 추가해 주기
		for(let i = 0; i < cateLength; i++) {
			if(prjCategory == $('#cate-option option:eq(' + i + ')').val()) {
				$('#cate-option option:eq(' + i + ')').attr("selected", true);
			}
		}

        // 현재 DB에 있는 시작시간 조사해서 옵션 몇 개 넣을지 정하기
        var timeLength = $('#time-option option').length;
		var prjTime = '${prjInfo.time}';
		
		// DB의 행 개수만큼 jsp에 옵션 추가해 주기
		for(let i = 0; i < timeLength; i++) {
			if(prjTime == $('#time-option option:eq(' + i + ')').val()) {
				$('#time-option option:eq(' + i + ')').attr("selected", true);
			}
		}
    });

    /*사진 미리보기*/
    $(function() {
        $("#input-prjfile").on('change', function(){
            readURL(this);
        });
    });
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
            $('.img-upload').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    
    jQuery.browser = {};
		(function () {
		    jQuery.browser.msie = false;
		    jQuery.browser.version = 0;
		    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
		        jQuery.browser.msie = true;
		        jQuery.browser.version = RegExp.$1;
		    }
		})();

</script>
</body>
</html>