<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 등록</title>
</head>
<style>
    *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Noto Sans KR', sans-serif;
    }
    #mem-full{
    	margin-top: 3%;
        --width: 100vw;
        height: 780px;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        grid-template-rows: 1fr 10fr;
        justify-content: center;
        align-items: center;
        --margin: 0 auto;
        box-sizing: border-box;
        gap: 0;

    }
   
    #mem-header{
    	height : 80px
    }


    input[type="radio"]{
        display: none;    
    } 
 
    input[type="radio"] + label{

        padding: 20px;
        cursor: pointer;
        border-bottom: 1px solid black;
       
    }
    input[type="radio"]:checked + label{
      
        color: #fdb930;  
        border-bottom: none;
        border-right: 1px solid black;
        border-left: 1px solid black;
    } 

    .main{
        width: 100%;
        height: 100%;
        grid-column: span 5;
        display: none;
        
    }
    input[id="edit-mypage"]:checked ~ .mp-main1{display: block; }
    input[id="like-group"]:checked ~ .mp-main2{ display: block;}
    input[id="mem-group"]:checked ~ .mp-main3{display: block;}
    input[id="mem-manner"]:checked ~ .mp-main4{display: block;}
    input[id="mem-liked-place"]:checked ~ .mp-main5{display: block;}

    label {
        width: 100%;
        height: 100%;
        text-align: center;
   
    }
    .input{
      
      border: 1px solid #dddddd;
      color: black;
      background-color: #dddddd;
      border-radius: 5px;
      width: 60%;
      height: 35px;
      text-align: center;
  
    }
    .span2{
        grid-column: span 2;
    }
    .label{

    color: #fdb930;
    border: 1px solid #fdb930;
    background-color: #fff;
    cursor: pointer;
    border-radius: 5px;
    border: none;

    }
    .doublecheck{
        padding: 1px 3px 3px 1px;
        margin-left: 15px;
        font-size: 15px;
        width: 100px;
    }
    
    /*헤더 fixed*/
.navi-menu{
    margin-bottom: 50px;
    padding: 0 15% 0 15%;
    width: 100vw;
    position: fixed;
    top: 0;
    background-color: #fff;
    z-index: 100;
    margin: 0px auto;
}
.content-editor{
    padding: 15px 0px 10px;
    height: 80px;
    align-items: center;
    display: flex;
    justify-content: space-between;
}
.editor-logo{
    display : flex;
    align-items: center;
}
.editor-buttons{
    display: flex;
    align-items: center;
}
.logo-img{
    cursor: pointer;
    height : 80px;
    padding : 15px 20px 10px 0;
}
.buttons-storage{
    cursor: pointer;
    border-radius: 10px;
    padding: 5px 20px;
    color: #567ace;
    border: 1px solid #567ace;
    background-color: #fff;
    letter-spacing: 0.1em;
}
.buttons-request{
    margin: 0px 10px;
    cursor: pointer;
    border-radius: 10px;
    padding: 5px 20px;
    color: #567ace;
    border: 1px solid #567ace;
    background-color: #fff;
    letter-spacing: 0.1em;
}
.buttons-goout>img{
    margin-top: 5px;
    width: 27px;
    height: 27px;
    color: #567ace;
    cursor: pointer;
}
.content-menu{
    width: 100%;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: justify;
    justify-content: space-evenly;
    padding: 0px 16px;
    overflow-x: auto;
    margin: 0px auto;
    height: 40px;
    border-bottom :1px solid #AFAFAF;
}
.content-menu :nth-child(1):hover{
    color: #567ace;
    cursor: pointer;
}
.content-menu :nth-child(2){
    color: #567ace;
    padding-bottom: 12px;
    border-bottom :5px solid #567ace;
}
.content-menu>div:not(.content-menu :nth-child(2)){
    position: relative;
    padding-bottom: 12px;
    cursor: pointer;
}
.content-menu>div>input{
    background: transparent;
} 
/* .content-menu>div>input:hover:not(.content-menu>div>input:nth-child(2)){
    color: #567ace;
    cursor: pointer;
}  */
/*여기까지 헤더 fixed*/


li{
    list-style: none;
    /* position: relative;
    padding: 0px 0px 38px 18px;
    color: rgb(158, 158, 158); */
}
ol{
    padding-left: 0;
}
#container{
    display: flex;
    flex-wrap: wrap;
    padding-top: 100px;
    width: 70vw;
    margin: 0 0 50px 400px;
}
.content{
    padding: 84px 0px 0px;
    width: 100%;
    max-width: 1080px;
}
div[class*=content-]:not(.content-editor,.content-menu, .content-stroy){
    display: flex;
    padding-bottom: 48px;
    margin-bottom: 56px;
    justify-content: flex-start;
    border-bottom: 1px solid rgb(240, 240, 240);
}
div[class*=-info]{
    margin: 0px 0px 14px;
    width: 350px;
}
div[class*=-info] div:first-child{
    font-weight: 700;
    margin-bottom: 12px;
    font-size: 16px !important;
    line-height: 24px !important;
}
div[class*=-info] div:last-child{
    font-weight: 400;
    color: rgb(109, 109, 109);
    margin: 0px;
    font-size: 14px !important;
    line-height: 24px !important;
}
div[class*=-info]+div:not(.category-select, .price-box, .story-write){
    display: flex;
    flex-direction: column;
    width: 450px;
    margin-top: 3px;
}
.title-write div{
    padding: 0px 10px;
    border: 1px solid #567ace;
    border-radius: 10px;
    width: 80%;
}
input{
    outline: none;
    border: none;
    font-weight: 400;
    font-size: 14px !important;
    line-height: 24px !important;
    --text-align: inherit;
    size: 600px;
    width: 100%;
}
div[class*=-write] p:not(.calculate-notice>p){
    width: 100%;
    margin: 5px 0px 0px 3px;
    font-size: 12px !important;
    line-height: 20px !important;
}
.category-select{
    display: flex;
    justify-content: space-between;
    width: 450px;
    margin-top: 3px;
} 
select:not(.ui-datepicker-month, .ui-datepicker-year){
    height: 30px;
    margin-top: 20px;
    padding-right: 300px;
} 
.price-box{
    display: flex;
    flex-direction: row;
    margin-top: 10px;
    width: 400px;
}
.price-write, .url-text {
    padding: 0px 10px;
    border: 1px solid #567ace;
    border-radius: 10px;
    height: 30px;
    width: 380px;
}
.summary-text{
    padding: 5px 10px 1px 10px;
    border: 1px solid #567ace;
    border-radius: 10px;
    height: 75px;
    width: 380px;
}
textarea{
    resize: none;
    border: none;
    outline: none;
    height: 72px;
    width: 380px;
}
.price-write+div{
    margin: 5px 0 0 5px;
    --width: 80px;
}
.url-blank{
    margin-left: 3px;
}
.date-write{
    display: flex;
    justify-content: space-between;
    width: 630px;
}
.date-start, .date-end{
    display: flex;
    justify-content: flex-start;
    width: 400px;
    align-items: center;
}
.start-day, .start-time, .end-day, .date-calculate{
    margin: 0px 8px;
    width: 40%;
    margin-bottom: 10px;
}
/* .start-time>div:last-child{
    width: 100px;
}  */
.start-day>p, .start-time>p{
    margin-bottom: 4px;
    margin-top: 0em;
    font-weight: 500;
    margin-bottom: 8px;
    color: rgb(13, 13, 13);
    display: flex;
    font-size: 12px !important;
    line-height: 20px !important;
}
.start-day>input{
    position: relative;
    display: inline-block;
    width: 100%;
    height: 30px;
    text-align: left;
    box-sizing: border-box;
    background: rgb(255, 255, 255);
    color: rgb(61, 61, 61);
    padding: 0px 10px;
    border: 1px solid #567ace;
    border-radius: 10px;
    cursor: pointer;
}
.ui-datepicker-trigger {						
    cursor:pointer;
    height: 23px;
    margin-left: 5px;
    --margin-top: 15px;
}
.start-time select{
    margin-top: 0;
    border: 1px solid #567ace;
    border-radius: 10px;
    box-sizing: inherit;
    padding-right: 220px;
    padding-left: 10px;
    height: 28px;
}
.date-period{
    padding: 46px 0 38px 18px;
    font-weight: 400;
    font-size: 14px !important;
    line-height: 24px !important;
}
li:nth-child(1)::after{
    content: "";
    position: absolute;
    top: 4px;
    left: 4px;
    height: 100%;
    border-left: 1px solid rgb(228, 228, 228);
}
.date-end, .date-start{
    position: relative;
    width: 100%;
}
input[name='deliver'], input[name='startDay']{
    width: 80%;
    height: 28px;
    margin-top: 0;
    border: 1px solid #567ace;
    border-radius: 10px;
    padding-left: 10px;
    cursor: pointer;
}
input[name='endDay']{
    width: 68%;
    height: 28px;
    margin-top: 0;
    border: 1px solid #567ace;
    border-radius: 10px;
    padding-left: 10px;
    cursor: pointer;
}
input[name='deliver']{
    width: 40%;
}
.calculate-notice{
    display: flex;
    align-items: center;
}
.calculate-notice+div{
    color: rgb(109, 109, 109);
    font-size: 12px !important;
}
.calculate-notice>p {
    margin : 3px 0 3px 2px;
    font-size: 12px !important;
}
.content-stroy{
    flex-wrap: wrap;
}
.story-box{
    display: flex;
}
.story-notice{
    display: flex;
}
.story-write{
    border: 1px solid #567ace;
    border-radius: 10px;
    padding: 20px;
    margin-bottom: 20px;
}
.story-write p{
    color: red;
}
.story-tip{
    font-size: 14px !important;
    line-height: 24px !important;
    padding-left: 20px;
}
.story-notice>svg{
    padding-top: 5px;
}
.story-editor{
    width: 80%;
    --padding: 0 15% 0 15%;
}

</style>
<body>
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
</div>
        <!-- <div class="content-menu">
            <div><input type="submit" name="postPrj" value="약관정보"></div>
            <div><input type="submit" name="postPrj" value="기본정보"></div> *이 부분은 현재페이지니까 빼도되나..
            <div><input type="submit" name="postPrj" value="옵션설계"></div>
            <div><input type="submit" name="postPrj" value="창작자정보"></div>
        </div> -->
</div>
<div id="mem-header"></div>
    <div id="mem-full">
        
            <input type="radio" id="edit-mypage" name="mem-navi" selected >
            <label for="edit-mypage" ><span id="icon1" class="material-symbols-outlined">약관정보</span>&nbsp;</label>
            <input type="radio" id="like-group" name="mem-navi">
            <label for="like-group" ><span class="material-symbols-outlined md-24">기본정보</span></label>
            <input type="radio" id="mem-group" name="mem-navi">
            <label for="mem-group" ><span class="material-symbols-outlined">옵션설계</span></label>
            <input type="radio" id="mem-manner" name="mem-navi">
            <label for="mem-manner" ><span class="material-symbols-outlined">창작자정보</span></label>
            


            <%-- div id="container">
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
                        <option>${cate.name}</option>
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
                                        <option value="category">==시작시간 선택==</option>
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
           

             <!-- 컨텐츠 2 -->





             <!-- 컨텐츠 내용 3 -->
             
             
             
             <!-- 컨텐츠 내용 3 -->
	<div id="container">
        <div class="content">
            <div class="content-title">
                <div class="title-info">
                    <div>이름</div>
                    <div>창작자 개인이나 팀을 대표할 수 있는 이름을 써주세요.</div>
                </div>
                <div class="title-write">
                    <div><input type="text" placeholder="내용 입력" name="title"></div>
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
            </div>
            <div class="content-title">
                <div class="title-info">
                    <div>소개</div>
                    <div>창작자님의 이력과 간단한 소개를 써주세요.</div>
                </div>
                <div class="creator-write">
                    <div><input type="text" placeholder="내용 입력" name="introduce"></div>
                    <p>40글자 남음</p>
                </div>
            </div>
            <div class="content-email">
                <div class="email-info">
                    <div>이메일</div>
                    <div>펀딩서비스 이용을 위해 추가 계약이나 약정이 필요할 수 있어요.<br>추가 발송될 전자 약정서를 체결할 이메일을 입력해 주세요.</div>
                </div>
                <div class="email-box">
                    <div class="email-area">
                        <div class="email-write"><input type="text" placeholder="이메일 입력" name="price"></div>
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
                    <div class="phone-write"><input type="text" placeholder="내용 입력" name="price"></div>
                    <div>
                        <input type="checkbox" id="email-check" name="">
                        <label for="email-check"> 회원정보와 동일</label>
                    </div>
                </div>
            </div>
            <div class="content-policy">
                <div class="policy-info">
                    <div>정산 정책 확인</div>
                    <div>블랭크의 정산 정책을 반드시 확인해 주세요.</div>
                </div>
                <div class="policy-box">
                    <button id="show">
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
                                    </ul>
                                    <ol type="1">
                                        <li>최종 결제 금액이 1,000만 원 미만<br>
                                            최종 결제 금액에서 블랭크 중개 수수료, 결제(카드사 수수료 등) 수수료를 제외한 금액의 80%가 지급됩니다.
                                        </li>
                                        <li>최종 결제 금액이 1,000만 원 이상<br>
                                            최종 결제 금액에서 블랭크 중개 수수료, 결제(카드사 수수료 등) 수수료를 제외한 금액의 60%가 지급됩니다.
                                        </li>
                                    </ol>
                                    <div>리워드 발송과 펀딩금 반환이 완료되면 최종 펀딩 금액이 확정됩니다.<br>
                                    최종 펀딩 금액 확정 5영업일 이내에 최종정산(2차 정산)이 진행됩니다.</div>
                                    <br>
                                    <strong>이렇게 알려 드려요</strong>
                                    <ul>
                                        <li>바로정산과 최종정산이 시작되면 정산 내역서와 함께 정산에 대한 안내가 메일로 발송됩니다.</li>
                                    </ul>
                                </div>
                                <div>
                                    <input type="checkbox" id="policy-check">
                                    <label for="policy-check">정산 정책을 확인하였습니다.</label>
                                    <!-- 팝업닫기--></div> 
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
                    <div><input type="text" placeholder="은행명 입력" name="bank"></div>
                    <div><input type="text" placeholder="계좌번호 입력" name="accountNumber"></div>
                    <p>특수 문자(-)없이 숫자만 입력해 주세요</p>
                    <div><input type="text" placeholder="예금주명 입력" name="depositor"></div>
                </div>
            </div>
        </div>
    </div> --%>
            
</body>
</html>