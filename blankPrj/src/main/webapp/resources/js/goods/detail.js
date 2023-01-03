// 문서 load 시 정보 챕터 먼저 보여 주기
$(document).ready(function() {
	$('#info-btn').prop("checked", true);
});

// 하단 content 변경 함수
$('input:radio[name=buttons]').change(function() {
	if($('#info-btn').is(':checked')) {
		$('.pd-intro').css("display", "flex");
		$('.pd-return').css("display", "none");
		$('.pd-review').css("display", "none");
	} else if($('#return-btn').is(':checked')) {
		$('.pd-intro').css("display", "none");
		$('.pd-return').css("display", "flex");
		$('.pd-review').css("display", "none");
	} else {
		$('.pd-intro').css("display", "none");
		$('.pd-return').css("display", "none");
		$('.pd-review').css("display", "flex");
	};
})

// ,로 나뉘어진 숫자를 콤마 없이 출력하는 함수
function stringNumberToInt(stringNumber){
    return parseInt(stringNumber.replace(/,/g , ''));
}

const goodsCntInput = $('input[name=quantity]');

// cnt 값 달라질 때 개수 * 가격 해서 표시해 주는 함수
goodsCntInput.keyup(function() {

	// 0 이하로 내려가면 바로 1로 바뀌게 min 값 추가
	if(goodsCntInput.val() == 0) {
		alert("0 이하로는 입력할 수 없습니다!");
		goodsCntInput.val(1);
	}

	$('.goods-cnt-box').text(goodsCntInput.val());

	const goodsCnt = goodsCntInput.val();
	const goodsPrice = stringNumberToInt($('#vo-price').text());

	$('#final-pay').text(goodsCnt * goodsPrice);
	
})

// 재고 알림 팝업
function callAlert() {
	var url = "/blank/goods/stockalert";
	var name = "재고 알림 받기";
	var option = "width = 100%, height = 100%, location = yes, top = 500, left = 400"
	window.open(url, name, option);
}