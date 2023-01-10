<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/blank/resources/css/project_post/agree.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="shortcut icon" href="/blank/resources/images/member/blank.ico">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
</head>
<body>

<div id="container">
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
            <!-- <div class="content-menu">
                <div>약관 정보</div>
                <div>기본 정보</div>
                <div>옵션 설계</div>
                <div>창작자 정보</div>
            </div> -->
        </div>
        <div class="content-write">
            <h2>프로젝트를 진행 시 이런 준비가 필요해요</h2>
            <div class="write-tip">아래 기준에 충족하는지 체크해 주세요.</div>
            <ul class="write-agree">
                <li>
                    <label>
                        <input type="checkbox" name="agree">
                        대표 창작자는 만 19세 이상의 성인이어야 합니다.
                    </label>
                </li>
                <li>
                    <label>
                        <input type="checkbox" name="agree">
                        연락 가능한 본인 명의의 휴대폰 번호 또는 이메일과 정산을 위한 국내 은행 계좌를 준비해주세요.
                    </label>
                </li>
                <li>
                    <label>
                        <input type="checkbox" name="agree">
                        소개할 제품은 프로젝트가 끝날 때까지 다른 온∙오프라인에서 펀딩을 하거나 유통하지 않을게요.
                    </label>
                </li>
                <li>
                    <label>
                        <input type="checkbox" name="agree">
                        작성한 프로젝트나 제작한 제품/서비스가 제3자의 지식재산권을 침해하지 않아요.
                    </label>
                </li>
                <li>
                    <label>
                        <input type="checkbox" name="agree">
                        서포터님들께 프로젝트의 진행 과정을 안내하고  발송 일정과 방식 등을 지킬 수 있어요.
                    </label>
                </li>
                <li>
                    <label>
                        <input type="checkbox" name="agree">
                        프로젝트로 소개할 제품/서비스의 관계 법령과 광고 심의 규정을 준수해서 스토리를 작성할 거예요.
                    </label>
                </li>
                <li>
                    <label>
                        <input type="checkbox" class="ckAll">
                        전체 동의하기
                    </label>
                </li>
            </ul>
        </div>
        <div class="content-buttons">
            <button type="button" class="buttons-back">
                <i> < </i>
                이전
            </button>
            <button type="button" class="buttons-start" onclick="startBtn(); return false;">시작하기</button>
        </div>
    </div>

    <script type="text/javascript">

		$(document).ready(function() {
			$(".ckAll").click(function() {
				if($(".ckAll").is(":checked")) {
                    $("input[name=agree]").prop("checked", true);
                }else {
                    $("input[name=agree]").prop("checked", false);
                }
			});
			
			$("input[name=agree]").click(function() {
				var count = $("input[name=agree]").length;
				var checked = $("input[name=agree]:checked").length;
				
                if(count != checked){
                    $(".ckAll").prop("checked", false);

                } else {
                    $(".ckAll").prop("checked", true); 
                }
			});
    });

        /*시작하기 href*/
        function startBtn(){
            if($(".ckAll").is(":checked")) {
            let random = String(Math.floor(Math.random()*1000000)).padStart(6, "0");
            $.ajax({
                url : "/blank/project/agree",
                method : "POST",   
                data :   {
                    "random" : random
                },
                success : function(x){
                    location.href = "/blank/project/post?p=" + random;
                },error : function(){
                    console.log("동의 통신에러");
                }
            });
            } else{
                alert('미동의 시 프로젝트를 진행할 수 없습니다.')
            }
        };

	</script>
	
</body>
</html>