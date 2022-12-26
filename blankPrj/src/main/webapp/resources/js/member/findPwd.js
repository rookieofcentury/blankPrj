$('input[name=email]').click(function(){
  console.log('클릭');
  $('#email-result').show();
})


$('#find-pwd').click(function(){

  let emailVal = $('input[name=email]').val();
  console.log(emailVal);
  $.ajax({
    url : "/blank/member/findPwd",
    type : "post",
    data : {
        "email" : emailVal
    },
    success : function(result){

        if(result == 1){
            
          alert('임시비밀번호가 전송되었습니다.')
          
        }else{
          
          $('#email-result').text('이메일이 존재하지 않습니다.');
          
        }
    },
    error : function(){
        alert('에이잭스 에러!!!!!!!!!');
    }
  }) //ajax    
})

 