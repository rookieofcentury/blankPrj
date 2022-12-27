//keyup하면 아래 창에 input창 값에 대한 상태 출력 
$('input[name=email1]').click(function(){
  $('#email-result').show();
})
$('input[name=pwd1]').click(function(){
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
});

  //온 서브밋을 위한 변수 선언;
  let emailCheckReturn = false;
  let pwd1CheckReturn = false;
  let pwd2CheckReturn = false;
  let nickCheckReturn = false;
  let phoneCheckReturn = false;



//이메일 에이젝스
function emailDoubleCheck(){
  
  let emailVal = $('input[name=email1]').val() + $('#email2').val();
  console.log(emailVal);
  const emailjung = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
  
  if(!emailjung.test(emailVal)) {
      alert('먼저 이메일 형식을 확인해주세요')
      
  }else{
      $.ajax({
      url : "/blank/member/doubleCheckByEmail",
      type : "post",
      data : {
          "email" : emailVal
      },
      success : function(result){

          if(result == 0){
              
              $('#email-result').text('사용가능한 이메일 입니다.');
              $('#email-result').addClass('green');
              $('#email-result').removeClass('red');

              $('#email-check').addClass('green'); // 성공하면 중복체크 초록으로 바꾸세용~
              $('#email-check').removeClass('ace');
              $('#email-check').removeClass('red');
              $('input[name=email]').val(emailVal);
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
    }) //ajax    
   }
  }
//이메일 키업하면 
$('input[name=email1]').keyup(function(){

  $('#email-result').addClass('red');
  $('#email-result').removeClass('green');

  $('#email-check').addClass('ace');  
  $('#email-check').removeClass('red');
  $('#email-check').removeClass('green');   
  
  emailCheckReturn = false;
  $('#email-result').text('비밀번호 찾기에 이용되오니 수신가능한 이메일 작성을 요청드립니다.');
  
})



//비밀번호 키업하면 나온다
//패스워드 유효성 검사
$('input[name=pwd1]').keyup(function(){
    
    pwd1CheckReturn = false;
    const pwdjung = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/; // 8 - 16 영 문 특 1개씩
    let pwd1Val = $('input[name=pwd1]').val();

    $('#pwd1-result').addClass('red');
    
    if(pwd1Val == ''){
        $('#pwd1-result').text('비밀번호를 입력해주세요');
    }else if(!pwdjung.test(pwd1Val)){
        $('#pwd1-result').text('영문자 + 숫자 + 특수문자 8 ~ 16글자 부탁드립니다.');
    }else{
        $('#pwd1-result').text('');
        pwd1CheckReturn = true;
    }
})


     //패스워드 확인2
  $('input[name=pwd2]').keyup(function(){

  pwd2CheckReturn = false;
  pwd1Val = $('input[name=pwd1]').val();
  let pwd2Val = $('input[name=pwd2]').val();

  console.log(pwd1Val == pwd2Val);
  $('#pwd2-result').addClass('red');
  
  if(pwd2Val != pwd1Val){
      $('#pwd2-result').addClass('red');
      $('#pwd2-result').removeClass('green');
      $('#pwd2-result').text('비밀번호가 일치하지 않습니다.');
  }else{
      $('#pwd2-result').addClass('green');
      $('#pwd2-result').removeClass('red');
      $('#pwd2-result').text('위의 비밀번호와 일치합니다');
      pwd2CheckReturn = true;
      
    }

  })

//닉네임 키업이 되면 
$('input[name=nick]').keyup(function(){

let nickCheckReturn = false;
let nickVal = $('input[name=nick]').val();
const nickjung = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,10}$/; // 한글 숫자 영어 2-10

$('#nick-check').addClass('red');
$('#nick-check').removeClass('green');

$('#nick-result').addClass('red');
$('#nick-result').removeClass('green');
if(nickVal == ''){
    $('#nick-result').removeClass('green');
    $('#nick-result').addClass('red');
    $('#nick-result').text('닉네임을 입력해주세요');
}else if(!nickjung.test(nickVal)){
    $('#nick-result').addClass('red');
    $('#nick-result').text('닉네임은 영소문자 한글 숫자 2 ~ 10글자 ');
}else{
    $('#nick-result').text('닉네임을 중복검사를 진행해주세요');
  }   
})

//닉네임 중복확인 에이잭스 
function nickDoubleCheck(){
  
  let nickVal = $('input[name=nick]').val();
  
  const nickjung = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,10}$/; // 한글 숫자 영어 2-10
  
  if(!nickjung.test(nickVal)) {
      alert('닉네임은 2-10 글자 한글 숫자 영어로 이루어져있어야합니다.')
      
  }else{
      $.ajax({
      url : "/blank/member/doubleCheckByNick",
      type : "post",
      data : {
          "nick" : nickVal
      },
      success : function(result){

          if(result ==0){
              
              $('#nick-result').text('사용가능한 닉네임 입니다.');
              $('#nick-result').addClass('green');
              $('#nick-result').removeClass('red');

              $('#nick-check').addClass('green'); // 성공하면 중복체크 초록으로 바꾸세용~
              $('#nick-check').removeClass('ace');
              $('#nick-check').removeClass('red');
              nickCheckReturn = true;

          }else{
              
              $('#nick-result').text('중복된 닉네임 입니다.');   
              $('#nick-check').addClass('red');
              $('#nick-check').removeClass('ace');
              $('#nick-check').removeClass('green');
          }
      },
      error : function(){
          alert('에이잭스 에러!!!!!!!!!');
      }
    }) //ajax    
   }
  }

//핸드폰번호 자동으로 하이픈
const autoHyphen = (target) => {
  target.value = target.value
    .replace(/[^0-9]/g, '')
   .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
 }


$('input[name=phone]').keyup(function(){
  
    $('#phone-result').addClass('red');
    $('#phone-result').removeClass('green');
    let phoneCheckReturn = false;
    let phoneVal = $('input[name=phone]').val();
    

  if(phoneVal == ''){
      $('#phone-result').text('휴대전화 번호 11자리 입력해주세요');
  }else if(!(phoneVal.length == 13)){
      $('#phone-result').text('휴대전화 번호 11자리 입력해주세요');
  }else{
      $('#phone-result').text('중복 체크 부탁드립니다.');   
      console.log(phoneVal);
  }

})

//핸드폰 중복확인 > 핸드폰 인증 하면 인증문자로 바꿀꺼다.  
function phoneDoubleCheck(){
  
  let phoneVal = $('input[name=phone]').val();
  
  if(phoneVal.length < 13 || phoneVal.length >= 14) {
      alert('휴대폰 번호 11자리를 입력해주세요')
      
  }else{
      $.ajax({
      url : "/blank/member/doubleCheckByPhone",
      type : "post",
      data : {
          "phone" : phoneVal
      },
      success : function(result){

          if(result ==0){
              
            $('#phone-result').text('사용가능한 휴대전화 입니다.');
            $('#phone-result').addClass('green');
            $('#phone-result').removeClass('red');

            $('#phone-check').addClass('green'); // 성공하면 중복체크 초록으로 바꾸세용~
            $('#phone-check').removeClass('ace');
            $('#phone-check').removeClass('red');
            phoneCheckReturn = true;

          }else{

              $('#phone-result').text('중복된 휴대전화 입니다.');   
              $('#phone-check').addClass('red');
              $('#phone-check').removeClass('ace');
              $('#phone-check').removeClass('green');
          }
      },
      error : function(){
          alert('에이잭스 에러!!!!!!!!!');
      }
    }) //ajax    
   }
  }

//성별 체크했나요
function checkGender() {
  let genderVal = $('input[name=gender]').val();

  if(genderVal != null){
      return true;
  }else{
      return false;
  }
}


function checkAll(){
    
  if(!emailCheckReturn){alert('이메일 입력되지않았습니다.'); return false;}
  if(!pwd1CheckReturn){ alert('비밀번호가 입력되지않았습니다.'); return false;}
  if(!pwd2CheckReturn){ alert('비밀번호 확인이 입력되지않았습니다'); return false;}
  if(!nickCheckReturn){ alert('닉네임이 입력되지 않았습니다.'); return false;}
  if(!phoneCheckReturn){ alert('휴대전화번호가 입력되지 않았습니다.') ;return false;}
  if(!checkGender){alert('젠더선택이 되지 않았습니다.') ;return false; }
  if(!checkPA){ alert('PA를입력하지 않았습니다.'); return false; }


  return true;

}


