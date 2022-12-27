function tempPwd(){

  let emailVal = $('input[name=email]').val();

  console.log(emailVal);

  let url = "/blank"
  $.ajax({
    url : "/blank/member/tempPwd",
    type : "post",
    data : {
      "email" : emailVal
    },
    success : function(result){
      
      if(result == 1){
        alert('임시비밀번호가 전송되었습니다.')
        location.replace(url);
        
      }else{
        
        $('#email-result').show();
        
        }
    },
    error : function(result){
        console.log("받아온 리절트"+result);
        alert('에이잭스 에러!!!!!!!!!');
    }
  }) //ajax    
}

 