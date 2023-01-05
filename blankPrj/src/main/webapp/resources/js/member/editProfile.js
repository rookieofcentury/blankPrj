// 각 버튼 누르면 밑에 변경하는 부분 생성


//이메일
let  emailBtn = $('#email-change');

emailBtn.click(function(){
  
   $('.email-hidden').toggle()

   if (emailBtn.text() == "변경") {
      emailBtn.text("취소"); 
   } else {
      emailBtn.text("변경");
   }
})

//닉네임
let nickBtn = $('#nick-change');
nickBtn.click(function(){

   $('.nick-hidden').toggle()

   if (nickBtn.text() == "변경") {
      
      nickBtn.text("취소"); 
   } else {
      nickBtn.text("변경");
   }
   
 })
//핸드폰
let phoneBtn = $('#phone-change');
phoneBtn.click(function(){

   $('.phone-hidden').toggle()
   
   if (phoneBtn.text() == "변경") {
      
      phoneBtn.text("취소"); 
   } else {
      phoneBtn.text("변경");
   }

})
//비밀번호
let pwdBtn = $('#pwd-change   az');
pwdBtn.click(function(){

    $('#pwd-hidden').toggle()

    if (pwdBtn.text() == "변경") {
      
      pwdBtn.text("취소"); 
   } else {
      pwdBtn.text("변경");
   }
 })

 let emailCheck = false;
 let inputEmail = $('input[name=email]');
 
 //이메일 바꾸는 곳에  키업하면 
 inputEmail.keyup(function(){

   let loginEmail = $('#loginEmail').text(); 
   let emailjung =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    //버튼 저장버튼 안되게! 
    emailCheck = false;
    
    let emailVal = inputEmail.val();

   console.log(emailVal);

   if(emailVal == loginEmail){
      $('#email-result').text("기존의 이메일과 동일한 이메일입니다.");

   }else if(!emailjung.test(emailVal)){

      $('#email-result').text("이메일 형식이 맞지 않습니다.");

   }else if(emailVal == ''){
      $('#email-result').text("값을 입력해주세요");
   }

   else{
      $('#email-result').addClass('red');
      $('#email-result').removeClass('green');
      $('#email-result').text("저장버튼을 누르시면 변경이 완료됩니다.");
      
      emailCheck = true;

   }

 
 })

 
 let nickCheck = false;
 let inputNick = $('input[name=nick]');
 
 //닉네임 바꾸는 곳에  키업하면 
 inputNick.keyup(function(){

   let loginNick = $('#loginNick').text(); 
   const nickjung = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,10}$/; // 한글 숫자 영어 2-10
    //버튼 저장버튼 안되게! 
    emailCheck = false;
    
    let nickVal = inputNick.val();

   console.log(nickVal);

   if(nickVal == loginNick){
      $('#nick-result').text("기존의 닉네임과 동일한 닉네임입니다.");
   }else if(!nickjung.test(nickVal)){
      $('#nick-result').text("닉네임 형식이 맞지 않습니다.");
   }else if(nickVal == ''){
      $('#nick-result').text("값을 입력해주세요");
   }
   else{
      $('#nick-result').text("저장버튼을 누르시면 변경이 완료됩니다.");
      nickCheck = true;
   }

 
 })

 //핸드폰번호 자동으로 하이픈
const autoHyphen = (target) => {
   alert('안일닝ㄹ')
   target.value = target.value
     .replace(/[^0-9]/g, '')
    .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
  }

 let phoneCheck = false;
 let inputPhone = $('input[name=phone]');
 
 //휴대전화 바꾸는 곳에  키업하면 
 inputPhone.keyup(function(){

   let loginPhone = $('#loginPhone').text(); 
   const nickjung = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,10}$/; // 한글 숫자 영어 2-10
    //버튼 저장버튼 안되게! 
    emailCheck = false;
    
    let phoneVal = inputPhone.val();

   console.log(phoneVal);

   if(phoneVal == loginPhone){
      $('#phone-result').text("기존의 휴대전화 번호와 동일한 번호입니다.");
   }else if(!(phoneVal.length == 13)){
      $('#phone-result').text('휴대전화 번호 11자리 입력해주세요');
   }else if(phoneVal == ''){
      $('#phone-result').text("값을 입력해주세요");
   }
   else{
      $('#phone-result').text("업데이트 버튼을 누르시면 변경이 완료됩니다.");
      phoneCheck = true;
   }

 
 });


 $('#plus-profile').click(function() {
    $('#profile-submit').click();

 })