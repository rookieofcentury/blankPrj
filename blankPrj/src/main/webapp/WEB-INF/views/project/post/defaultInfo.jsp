<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 정보</title>
<link rel="stylesheet" href="/blank/resources/css/project_post/defaultInfo.css">

<!-- 제이쿼리 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<!-- 날짜위젯 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>;

<<script>CKEDITOR.replace('editor4',{filebrowserUploadUrl:'/mine/imageUpload.do'});</script>
<!--<script src = "${path}/ckeditor/ckeditor.js"></script> -->
<script src="https://cdn.ckeditor.com/4.20.1/standard/ckeditor.js"></script>
<script type="text/javascript" src="blank/ckeditor/ckeditor.js"></script>

</head>
<body>

<form action="/blank/post/defaultInfo" method="post">
    <div class="navi-menu">
        <div class="content-editor">
            <div class="editor-logo">
                <img class="logo-img" src="/blank/resources/images/blank.png" onclick="location.href=''">
                <div><h1>프로젝트 기획</h1></div>
            </div>
            <div class="editor-buttons">
                <button type="button" class="buttons-storage">임시저장</button>
                <button type="button" class="buttons-request" onclick="saveBtn(); return false;">심사요청</button>
                <div class="buttons-goout">
                    <img src="/blank/resources/images/project/icon_goout.png">
                    <a href="/blank/project/created/list"></a>
                </div>
            </div>
        </div>
        <div class="content-menu">
            <div><input type="submit" name="postPrj" value="약관정보"></div>
            <div><input type="submit" name="postPrj" value="기본정보"></div> <!--*이 부분은 현재페이지니까 빼도되나..-->
            <div><input type="submit" name="postPrj" value="옵션설계"></div>
            <div><input type="submit" name="postPrj" value="창작자정보"></div>
        </div>
    </div>
    <div id="container">
        <div class="content">
            <div class="content-title">
                <div class="title-info">
                    <div>제목</div>
                    <div>프로젝트의 주제, 특징이 드러나는 제목을 붙여주세요.</div>
                </div>
                <div class="title-write">
                    <div><input type="text" placeholder="내용 입력" name="title"></div>
                    <p>40글자 남음</p>
                </div>
            </div>
            <div class="content-category">
                <div class="category-info">
                    <div>카테고리</div>
                    <div>프로젝트 성격과 가장 일치하는 카테고리를 선택해주세요.<br>적합하지 않을 경우 운영자에 의해 조정될 수 있습니다.</div>
                </div>
                <div class="category-select">
                    <select name="category">
                        <option value="category">==카테고리 선택==</option>
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
                    <div>프로젝트를 완수하기 위해 필요한 금액을 설정해주세요.</div>
                </div>
                <div class="img-upload">파일업로드</div>
            </div>
            <div class="content-price">
                <div class="price-info">
                    <div>목표금액</div>
                    <div>프로젝트를 완수하기 위해 필요한 금액을 설정해주세요.</div>
                </div>
                <div class="price-box">
                    <div class="price-write"><input type="number" placeholder="최소 50만원 이상의 금액을 입력해 주세요" name="price" onkeyup="inputNumberFormat(this)"></div>
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
                                    <!-- <div class="calendar-img"><img src="./calendar2-date.svg"></div> -->
                                    <input name="startDay" autocomplete="off" readonly="readonly">
                                </div>
                                <div class="start-time">
                                    <p>시작시간</p>
                                    <select>
                                        <option value="time">==시작시간 선택==</option>
                                        <c:forEach items="${time}" var="time">
                                        <option>${time.time}시</option>
										</c:forEach>
                                    </select>
                                    <!-- <div>dd</div> -->
                                </div>
                            </div>
                            <div class="date-period">
                                <p>펀딩기간</p>
                                <p></p>
                            </div>
                        </li>
                        <li>
                            <div class="date-end">
                                <div class="end-day">
                                    <p>종료일</p>
                                    <input name="endDay" autocomplete="off" readonly="readonly">
                                </div>
                                <div class="date-calculate">
                                    <div class="calculate-notice">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-triangle" viewBox="0 0 16 16">
                                            <path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/>
                                            <path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
                                        </svg> 
                                        <p>정산일</p>
                                    </div>
                                    <div>후원자 결제 종류 다음 날부터 7영업일</div>
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
                        <div><input name="deliver" autocomplete="off" readonly="readonly"></div>
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
                    <div class="url-text"><input type="text" placeholder="URL을 입력해 주세요" name="url"></div>
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
                        <!-- <input type="text" placeholder="내용 입력" name="summery"> -->
                        <textarea placeholder="내용 입력" name="summery"></textarea>
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
                <div class="story-editor"><textarea id="editor4" name="editor4"></textarea></div>
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
            
        }

        $(function() {
            $( "input[name='startDay']" ).datepicker(config);
        });
        $(function() {
            $( "input[name='endDay']" ).datepicker(config);
        });
        $(function() {
            $( "input[name='deliver']" ).datepicker(config);
        });

        $(document).ready(function() {
            CKEDITOR.replace('[editor4]');
        });
        
        /* <script>
        $(function () {
            CKEDITOR.replace('contents', {
                filebrowserUploadUrl : '${pageContext.request.contextPath}/adm/fileupload.do'
            });
        }); */
        
        CKEDITOR.replace('editor4', {height: 500});

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
            if (x < 500,000) {
                alert('50만원 이상의 금액을 입력해 주세요')
            }else{
                priceCheckReturn = true;
            }
        });
        //목표금액 콤마 
        // $('input[name="price"]').filter(".comma").on("keyup", function(){
        //     console.log("ss");
        //     $(this).val($(this).val().replace(/[^0-9]/g, "").toLocaleString());
        // });
    //     $(document).ready(function(){
    //         $("input[name='price']").bind('keyup keydown',function(){
    //             inputNumberFormat(this);
    //         });
            
//         //입력한 문자열 전달
//         function inputNumberFormat(obj) {
//             obj.value = comma(uncomma(obj.value));
//         }
//         //콤마찍기
//         function comma(str) {
//             console.log("ss");
//             str = String(str);
//         return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    //     }
    // });

        //펀딩일수 계산
        $("input[name='endDay']").on("focusout", function() {
            //var date1 = new Date($("input[name='startDay']").datepicker("getDate"));
            //var date2 = new Date($("input[name='endDay']").datepicker("getDate"));
            var date1 = $("input[name='startDay']").datepicker({ dateFormat: 'dd-mm-yy' }).val();
            var date2 = $("input[name='endDay']").datepicker({ dateFormat: 'dd-mm-yy' }).val();

            var today = new Date();
            var year = today.getFullYear();
            var month = ('0' + (today.getMonth() + 1)).slice(-2);
            var day = ('0' + today.getDate()).slice(-2);
            var dateString = year + '-' + month  + '-' + day;

            if (!$("input[name='startDay']").val()) {
                alert("시작일을 입력해 주세요");
            }
            if (date2 < date1){ 
                //console.log($("input[name='startDay']").val().length);
                alert("시작일이 종료일보다 늦어요ㅠ"); 
            }
            if(date1 < dateString){
                //console.log(date1);
                alert("오늘 날짜 이후로 선택해 주세요"); 
                }
        });

        //주소 중복검사
        function emailDoubleCheck(){

            $.ajax({
                url : "/blank/member/doubleCheckByEmail",
                type : "post",
                data : {
                    "email" : emailVal
                },
                success : function(result){

                    if(result ==0){
                        
                        $('#email-result').text('사용가능한 이메일 입니다.');
                        $('#email-result').addClass('green');
                        $('#email-result').removeClass('red');

                        $('#email-check').addClass('green'); // 성공하면 중복체크 초록으로 바꾸세용~
                        $('#email-check').removeClass('ace');
                        $('#email-check').removeClass('red');
                        emailCheckReturn = true;

                    }else{
                        
                        $('#email-result').text('중복된 이메일 입니다.');   
                        $('#email-check').addClass('red');
                        $('#email-check').removeClass('ace');
                        $('#email-check').removeClass('green');
                    }
                },
                error : function(){
                    alert('에이잭스 에러!!!!!!!!!');
                }
            }); //ajax    
        };
        
        //글자수 체크(주소)
        $("input[name='url']").on("focusout", function() {
            var content = $(this).val();
            if (content.length < 3) {
                alert("3자 이상 입력해주세요.");
            }
        });
        //유효성 체크(주소)
        var checkKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
        var checkEnglish = /[a-zA-Z]/;   
        var checkEmoji = /[~!@#$%^&*()_+|<>?:{}]/; 
        var checkBlank = /\s/g;
        $('input[name="url"]').keyup(function(e) {
            urlCheckReturn = false;
            var content = $(this).val();
            if( checkEnglish.test(content) && !checkKorean.test(content) && !checkEmoji.test(content) ) {
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
                    alert("최대 100글자까지 입력 가능합니다.");
                    $(this).val(content.substring(0, 100));
                    $('.summary-text + p').text("0글자 남음");
                }
            }   summaryCheckReturn = true;
        });


         //온서브밋
        function checkAll(){
        
        if(!titleCheckReturn){ alert('제목이 입력되지않았습니다'); return false;}
        if(!priceCheckReturn){ alert('목표금액이 입력되지않았습니다.'); return false;}
        if(!urlCheckReturn){ alert('url이 입력되지않았습니다'); return false;}
        if(!summaryCheckReturn){ alert('요약이 입력되지 않았습니다.'); return false;}
        if(!depositorCheckReturn){ alert('예금주가 입력되지 않았습니다.') ;return false;}
        if(!checkGender){alert('전화번호가 입력되지 않았습니다.') ;return false; }
        if(!checkPA){ alert('이메일이 입력되지 않았습니다.'); return false; }

        return true;
        }

        /*심사요청 href*/
        function saveBtn(){
            location.href = "/blank/project/post/save";
        }

    </script>
    
</body>
</html>