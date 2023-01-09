function sendMessage(){

  let phoneVal = $('input[name=phone]').val();


  console.log(phoneVal);

  const randInput = '<div><input class="rand" type="text" name="num" ></div><div><input type="button" class = "rand-submit" value="인증" onclick="checkNum()"></div>'
  if(phoneVal.length == 13){
    $.ajax({
      url : "/blank/member/sendMessage",
      type : "post",
      data : {
        "phone" : phoneVal
      },
      success : function(result){
        
        if(result == 1){
  
          alert('인증번호 고객님의 휴대전화로 전송되었습니다.')
          $('input[name=phone]').prop('readonly', true);
          $('#phone-result').html(randInput)
          $('#phone-result').show();
  
          
        }else{
          $('input[name=phone]').prop('readonly', false);
          $('#phone-result').addClass('red');
          $('#phone-result').text('등록 된 휴대전화 번호가 없습니다.');
          $('#phone-result').show();
          }
      },
      error : function(result){
  
          alert('에이잭스 에러!!!!!!!!!');
      }
    }) //ajax    
  }else{
    alert('핸드폰 11자리를 입력해주세요.')
  }
}

//자동 하이픈 
const autoHyphen = (target) => {
  target.value = target.value
    .replace(/[^0-9]/g, '')
   .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
 }

 



