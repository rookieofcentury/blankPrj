const links = document.querySelectorAll("#nav > ul > li"); // nav link
const firstList = document.querySelector("#nav > ul > li:first-child"); // nav 첫 번째 link
const line = document.querySelector(".line"); // menu하단에 존재하는 line
const contents__list = document.querySelector("#contents__list"); // 컨텐츠 목록
const width = document.querySelector(".content-container").clientWidth; // wrapper 너비

links.forEach(menu =>
  menu.addEventListener("click", (e)=>horizontal(e))
  );

function horizontal(e){

  line.style.left = e.currentTarget.offsetLeft+"px";
  line.style.width = e.currentTarget.offsetWidth+"px";
  line.style.top = 
  e.currentTarget.offsetTop + e.currentTarget.offsetHeight+"px";

}

const clickLink = (e, index) => {
  contents__list.style.transform = `translateX(${-index * width}px)`;

}

links.forEach((link, index) => {
  link.addEventListener('click', (e) => clickLink(e, index));
})

line.style.width = `${firstList.offsetWidth}px`;
line.style.left = `${firstList.offsetLeft}px`;
line.style.top = `${firstList.offsetTop + firstList.offsetHeight}px`;


$('#pay-plus').click(function(){
  

  $.ajax({
    url : "/blank/pay/cardCnt",
    type : "post",
    success : function(result){

        if(result ==1){
            $('#popup').click();

        }else{
          alert('등록하신 카드가 3개 이상입니다. 삭제를 먼저 진행하여 주세요')
        }
    },
    error : function(){
        alert('에이잭스 에러!!!!!!!!!');
    }
  }) //ajax    

})


// //카드 추가 에이잭스  
// function plusCard (){

//   let cardNo1 = $('input[name=card1]').val();
//   let cardNo2 = $('input[name=card2]').val();
//   let cardNo3 = $('input[name=card3]').val();
//   let cardNo4 = $('input[name=card4]').val();

//   let cardNo = cardNo1 + cardNo2 + cardNo3 + cardNo4;

//   $('input[name=cardNo]').val(cardNo);

//   console.log($('input[name=cardNo]').val());

//   var payVo = jQuery("#plus-card-info").serialize();

//   $.ajax({
//     url : "/blank/pay/pluscard",
//     type : "post",
//     data : payVo,
//     success : function(result){

//         if(result ==1){
            
//            alert('결제수단이 정상적으로 추가 되었습니다.')
//            $('#popup').click();
            

//         }else{
//           alert('결제수단이 정상적으로 추가 되었습니다.')
            
//         }
//     },
//     error : function(){
//         alert('에이잭스 에러!!!!!!!!!');
//     }
//   }) //ajax    
// }


//카드 추가 전 카드번호 합치기 
function putCardNo(){

    let cardNo1 = $('input[name=card1]').val();
    let cardNo2 = $('input[name=card2]').val();
    let cardNo3 = $('input[name=card3]').val();
    let cardNo4 = $('input[name=card4]').val();
  
    let cardNo = cardNo1 + cardNo2 + cardNo3 + cardNo4;

    if(cardNo.length == 16 ){
      $('input[name=cardNo]').val(cardNo);
      return true;

    }else{
      alert('카드 번호를 정확하게 입력해주세요')
      return false;
    }

}


//주소 추가전에 3개인지 확인하자
$('#addr-plus').click(function(){
  $('#addr-pop').click();
  console.log("클릭");

  // $.ajax({
  //   url : "/blank/member/addrCnt",
  //   type : "post",
  //   success : function(result){

  //       if(result ==1){

  //       }else{
  //         alert('등록하신 주소가 3개 이상입니다. 삭제를 먼저 진행하여 주세요')
  //       }
  //   },
  //   error : function(){
  //       alert('에이잭스 에러!!!!!!!!!');
  //   }
  // }) //ajax    

})


function putAddr(){
  let addr1 = $('input[name=addr1]').val();
  let addr2 = $('input[name=addr1]').val();
  let addr3 = $('input[name=addr1]').val();
  let addr = addr1 + addr2+ addr3

  $('input[name=addr]').val(addr)

  console.log(addr);
}


      
