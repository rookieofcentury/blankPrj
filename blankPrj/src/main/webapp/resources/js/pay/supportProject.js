
let selectAddr = $('input[name=selectAddr]');
let addrPop = $('#addr-pop');

$('input[name=addrChange]').click(function(){
    $('input[name=addr]').prop('checked', false);
    addrPop.click();
})


selectAddr.click(function(){
    
    let addrInfo = document.querySelector('input[name=addr]:checked');
    let addrInfoNo = document.querySelector('input[name=addr]:checked').value;
    console.log(addrInfoNo);

    if(!addrInfo){

        alert('주소를 선택해주세요.')

    }else{
        let addrResult =  addrInfo.closest('label').cloneNode(true);
        $('#addr-result').empty();
        $('#addr-result').append(addrResult);
        $('input[name=addrNo]').val(addrInfoNo);
        addrPop.prop("checked", false);
        
    }
    
    
})


let selectCard = $('input[name=selectCard]');
let cardPop = $('#card-pop');

$('input[name=cardChange]').click(function(){
    $('input[name=card]').prop('checked', false);
    cardPop.click();
})


selectCard.click(function(){
    
 
    let cardInfo = document.querySelector('input[name=card]:checked');
    let cardInfoNo = document.querySelector('input[name=card]:checked').value;
    console.log(cardInfoNo);

    if(!cardInfo){
        alert('주소를 선택해주세요.')
    }else{
  
        let cardResult =  cardInfo.closest('label').cloneNode(true);
        $('#card-result').empty();
        $('#card-result').append(cardResult);
        $('input[name=payNo]').val(cardInfoNo);
        cardPop.prop("checked", false);
        
    }
    
    
})



window.onload = function(){
    selectAddr.click();
    selectCard.click();
 }

