// 각 버튼 누르면 밑에 변경하는 부분 생성
//이메일
let  emailBtn = $('#email-btn');

emailBtn.click(function(){
   
  
   $('#email-hidden').toggle()

   if (emailBtn.text() == "변경") {
      emailBtn.text("취소"); 
   } else {
      emailBtn.text("변경");
   }
})
//닉네임
let nickBtn = $('#nick-btn');
$('#nick-btn').click(function(){

   $('#nick-hidden').toggle()

   if (nickBtn.text() == "변경") {
      
      nickBtn.text("취소"); 
   } else {
      nickBtn.text("변경");
   }
   
 })
//핸드폰
let phoneBtn = $('#phone-btn');
phoneBtn.click(function(){

   $('#phone-hidden').toggle()
   
   if (phoneBtn.text() == "변경") {
      
      phoneBtn.text("취소"); 
   } else {
      phoneBtn.text("변경");
   }

})
let pwdBtn = $('#pwd-btn');
 //비밀번호
pwdBtn.click(function(){

    $('#pwd-hidden').toggle()

    if (pwdBtn.text() == "변경") {
      
      pwdBtn.text("취소"); 
   } else {
      pwdBtn.text("변경");
   }
 })
 //성별은 코민중,,, 바꿀 수 있게해야하나?






 