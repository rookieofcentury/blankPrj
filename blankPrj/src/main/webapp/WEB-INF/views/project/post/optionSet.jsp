<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>옵션 설계</title>
<link rel="stylesheet" href="/blank/resources/css/project_post/optionSet.css">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

    <div class="navi-menu">
        <div class="content-editor">
            <div class="editor-logo">
                <img class="logo-img" src="/blank/resources/images/blank.png" onclick="location.href=''">
                <div><h1>프로젝트 기획</h1></div>
            </div>
            <div class="editor-buttons">
                <div class="buttons-storage">임시저장</div>
                <div class="buttons-request">심사요청</div>
                <div class="buttons-goout"><img src="/blank/resources/images/project/icon_goout.png"></div>
            </div>
        </div>
        <div class="content-menu">
            <div>약관 정보</div>
            <div>기본 정보</div>
            <div>옵션 설계</div>
            <div>창작자 정보</div>
        </div>
        <div class="header-menubar">
            <div class="menu-button">
                <button type="button">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gift" viewBox="0 0 16 16">
                        <path d="M3 2.5a2.5 2.5 0 0 1 5 0 2.5 2.5 0 0 1 5 0v.006c0 .07 0 .27-.038.494H15a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1v7.5a1.5 1.5 0 0 1-1.5 1.5h-11A1.5 1.5 0 0 1 1 14.5V7a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h2.038A2.968 2.968 0 0 1 3 2.506V2.5zm1.068.5H7v-.5a1.5 1.5 0 1 0-3 0c0 .085.002.274.045.43a.522.522 0 0 0 .023.07zM9 3h2.932a.56.56 0 0 0 .023-.07c.043-.156.045-.345.045-.43a1.5 1.5 0 0 0-3 0V3zM1 4v2h6V4H1zm8 0v2h6V4H9zm5 3H9v8h4.5a.5.5 0 0 0 .5-.5V7zm-7 8V7H2v7.5a.5.5 0 0 0 .5.5H7z"/>
                    </svg>
                    세트
                </button>
                <button type="button" onclick="location.href='/blank/project/post/optionItem'">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M2 2.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5V3a.5.5 0 0 0-.5-.5H2zM3 3H2v1h1V3z"/>
                        <path d="M5 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM5.5 7a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 4a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9z"/>
                        <path fill-rule="evenodd" d="M1.5 7a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5V7zM2 7h1v1H2V7zm0 3.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5H2zm1 .5H2v1h1v-1z"/>
                    </svg>
                    아이템
                </button>
            </div>
        </div>
    </div>
    <div id="container">
        <div id="content">
            <div class="content-box">
                <div class="preview-box">
                    <div class="preview-set">
                        <div>내가 만든 세트</div>
                        <% if(1 < 2){%>
                            <ul>
                                <li class="set-list">
                                    <button type="button">
                                        <div class="set-buttons">
                                            <strong>29,000원</strong>
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
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
                                            <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
                                        </svg>
                                    </button>
                                </li>
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
                                    <select class="">
                                        <option>사과 (옵션 2개)</option>
                                        <option>토마토 (옵션 1개)</option>
                                        <option>가지 (옵션 3개)</option>
                                    </select>
                                </div>
                                <!-- <div class="set-option">
                                    <span>
                                        <input placeholder="아이템을 선택해 주세요" readonly>
                                        <div><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                            <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/></svg>
                                        </div>
                                    </span>
                                    <div class="set-select">
                                        <div>
                                            <ul>
                                                <li>
                                                    <label for="option1" class="select-option">
                                                        <input type="checkbox" id="option1">
                                                        <span class="item-name">사과 (옵션2개)</span>
                                                    </label>
                                                </li>
                                                <li>
                                                    <label for="option2" class="select-option">
                                                        <input type="checkbox" id="option2">
                                                        <span class="item-name">메론 (옵션2개)</span>
                                                    </label>
                                                </li>
                                            </ul>
                                            <div class="selete-submit">선택완료</div>
                                        </div> 
                                    </div>
                                </div> -->
                            </div>
                            <ul class="selected">
                                <li>
                                    <div>
                                        <div>사과</div>
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
                                        <li>민트</li>
                                        <li>레드</li>
                                    </ol>
                                </li>
                                <li>
                                </li>
                            </ul>
                            <div class="set-info">
                                <div class="info-name">세트명</div>
                                <div><input type="text" placeholder="세트명을 입력해 주세요." name="setName"></div>
                            </div>
                            <div class="set-info">
                                <div class="info-quantity">수량 설정</div>
                                <div class="text-price">
                                    <div><input type="number" name="limitedQuantity"></div>
                                    <div>개</div>
                                </div>
                            </div>
                            <div class="set-info">
                                <div class="info-price">
                                    <div>금액 설정</div>
                                    <div>배송이 필요한 선물은 배송비를 포함해주세요.</div>
                                </div>
                                <div class="text-quantity">
                                    <div><input type="number" name="setPrice"></div>
                                    <div>원</div>
                                </div>
                            </div>
                            <div class="button-submit"><input type="submit" value="저장" name="save"></div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>