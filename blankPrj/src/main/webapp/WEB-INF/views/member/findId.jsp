<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랭크 이메일 찾기</title>
<link rel="stylesheet" href="/blank/resources/css/member/findId.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="shortcut icon" href="/blank/resources/images/member/blank.ico">
</head>
<body>



	<div id="wrap">
        <div id="find-header">
            <div><img class="logo-img" src="/blank/resources/images/blank.png" onclick="location.href='/blank'"></div>
            <div><h1>이메일 찾기</h1></div>
        </div>
        <div id="find-container">
            <div class="find-email-area">

                <div class="container-main-area">
                    <div class="phone">휴대전화</div>
                    <div class="flex"><input type="text" class="input" name="phone" placeholder="가입하신 휴대전화 번호를 입력해주세요" oninput="autoHyphen(this)"></div>
                </div >
                <div class="result container-main-area" id="phone-result">
     

                </div>
                <div class="container-main-area">
                    <div class="pwd-info">블랭크 가입 시 사용하신 휴대전화 번호를 입력하시면 인증번호를 보내드립니다.</div>
                </div>

                <div class="container-main-area">
                    <div><input type="button" value="인증번호 받기" class="input ace" id="find-pwd" onclick="sendMessage();"></div>
                </div>
            
            </div>
        </div>
                
            
        </div>
        
    </div>  
   
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
<script src="/blank/resources/js/member/findId.js"></script>
<script>

    $('input[name=phone]').prop('readonly', false);
   
    
    
    function checkNum(){
        $('.pwd-info').removeClass('red')
        let numVal = $('input[name=num]').val();
        let phoneVal = $('input[name=phone]').val();


                //인증번호가 맞으면 이메일을 가져오자~ 
                $.ajax({
                    url : "/blank/member/findEmail",
                    type : "post",
                    data : {
                    "phone" : phoneVal,
                    "num" : numVal
                    },
                    success : function(result){
                    
                    console.log(result);
                    if(result == 0){
                        $('.pwd-info').addClass('red');
                        $('.pwd-info').html("인증번호가 일치하지 않습니다. 정확하게 입력해주세요")
                    }else{
                        let InputResult = "인증이 완료되었습니다."+"\n"+" 회원님의 이메일은"+"<strong>"+result+"</strong>"+"입니다.";
                        $('.pwd-info').html(InputResult)
                    }
                    
                    },
                    error : function(result){
                
                        alert('에이잭스 에러!!!!!!!!!');
                    }
                }) //ajax    
        

          
  
}
   
   
</script>
</html>