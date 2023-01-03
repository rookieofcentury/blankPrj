<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/blank/resources/css/project_post/optionItem.css">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.js"></script> 
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
                <button type="button" onclick="location.href='/blank/project/post/optionSet'">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gift" viewBox="0 0 16 16">
                        <path d="M3 2.5a2.5 2.5 0 0 1 5 0 2.5 2.5 0 0 1 5 0v.006c0 .07 0 .27-.038.494H15a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1v7.5a1.5 1.5 0 0 1-1.5 1.5h-11A1.5 1.5 0 0 1 1 14.5V7a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h2.038A2.968 2.968 0 0 1 3 2.506V2.5zm1.068.5H7v-.5a1.5 1.5 0 1 0-3 0c0 .085.002.274.045.43a.522.522 0 0 0 .023.07zM9 3h2.932a.56.56 0 0 0 .023-.07c.043-.156.045-.345.045-.43a1.5 1.5 0 0 0-3 0V3zM1 4v2h6V4H1zm8 0v2h6V4H9zm5 3H9v8h4.5a.5.5 0 0 0 .5-.5V7zm-7 8V7H2v7.5a.5.5 0 0 0 .5.5H7z"/>
                    </svg>
                    세트
                </button>
                <button type="button">
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
                <div class="preview-item">
                    <div class="preview-set">
                        <div>내가 만든 세트</div>
                        <% if(1 < 2){%>
                            <ul>
                                <li class="item-list">
                                    <button type="button">
                                        <div class="item-box">
                                            <strong>과일</strong>
                                        </div>
                                        <ol type="1" class="set-item">
                                            <li>사과</li>
                                            <li>바나나</li>
                                        </ol>
                                    </button>
                                    <button type="button">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
                                            <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
                                        </svg>
                                    </button>
                                </li>
                            </ul>
                        <%}else{ %>
                            <div class="set-none">만든 아이템이 없습니다.</div>
                        <%}%>
                    </div>
                </div>
                <div class="making-box">
                    <div class="making-set">
                        <div>
                            <div class="post-set">
                                <div class="set-notice">
                                    <strong>아이템명</strong>
                                    <div>아이템은 선물에 포함되는 구성 품목을 말합니다. 세트를 구성할 아이템을 만들어 보세요.</div>
                                </div>
                                <div class="set-option">
                                    <input placeholder="아이템을 입력해 주세요" name="itemName">
                                    <span>10글자 남음</span>
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
                            <div class="item-submit"><input type="submit" value="저장" name="save"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>

        $("#option-add").click(function(){
            //$(".textbox").toggleClass("block");
            $(".textbox").show();
        });
        $("#option-none").click(function(){
            $(".textbox").hide();
        });

        // $("input:radio[name=radio]").click(function(){
 
        //     if($("input[id=option-add]:checked")){
        //         $(".textbox").show();

        //     }else if($("input[id=option-none]:checked")){
        //         $(".textbox").hide();
        //     }
        //     });

    </script>

</body>
</html>