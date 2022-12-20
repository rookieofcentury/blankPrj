//keyup하면 아래 창에 input창 값에 대한 상태 출력 
$('input[name=email]').click(function(){
  $('#email-result').show();
})
$('input[name=pwd]').click(function(){
  $('#pwd1-result').show();
})
$('input[name=pwd2]').click(function(){
  $('#pwd2-result').show();
})
$('input[name=nick]').click(function(){
  $('#nick-result').show();
})
$('input[name=phone]').click(function(){
  $('#phone-result').show();
})



//이메일 인증 관련 
$('#email-check').click(function(){
  
  $('#email-num-input').show();
  const email = $('#email').val() + $('#email2').val()
  //중복검사 먼저 하고 이메일인증
})

// 유효성검사
//온 서브밋을 위한 변수 선언;
let emailCheckReturn = false;
let pwd1CheckReturn = false;
let pwd2CheckReturn = false;
let nickCheckReturn = false;
let phoneCheckReturn = false;

//아이디 인풋 키업하면 나온다.
$('input[name="memberId"]').keyup(function(){

    let idCheckReturn = false;
    let idVal = $('input[name="memberId"]').val();
    const idjung = /^[a-z]+[a-z0-9]{5,11}$/g;
    
    
   
    $('#checkIdResult').addClass('red');
    $('#idCheckBtn').addClass('yellow'); // 다시키업하면 yellow
    $('#idCheckBtn').removeClass('green'); // 다시키업하면 yellow
    $('#idCheckBtn').removeClass('red'); // 다시키업하면 yellow
    if(idVal == ''){
        $('#checkIdResult').text('아이디를 입력해주세요');
    }else if(!idjung.test(idVal)){
        $('#checkIdResult').text('아이디는 6 ~ 12 영 + 숫 으로 부탁드립니다. ');
        
    }else{
        $('#checkIdResult').text('중복검사가 필요한 아이디 입니다.');
        
    }
    
   
})