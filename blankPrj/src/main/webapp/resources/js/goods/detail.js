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

		calcPrice(goodsCntInput);
		
	})

	function calcPrice(data) {

		// 0 이하로 내려가면 바로 1로 바뀌게 min 값 추가
		if(data.val() == 0) {
			alert("0 이하로는 입력할 수 없습니다!");
			data.val(1);
		}

		$('.goods-cnt-box').text(data.val());

		const goodsCnt = data.val();
		const goodsPrice = stringNumberToInt($('#vo-price').text());

		$('#final-pay').text(goodsCnt * goodsPrice);
	
	}

	// 재고 알림 팝업
	function callAlert() {
		var url = "/blank/goods/stockalert";
		var name = "재고 알림 받기";
		var option = "width = 100%, height = 100%, location = yes, top = 500, left = 400"
		window.open(url, name, option);
	}

    /* 플러스 마이너스 버튼 누르면 값 바뀌게 */
    $('.minus-btn').click(function() {
        var nextCntInput = $(this).next();
        nextCntInput.val(String(parseInt(nextCntInput.val()) - 1));
        if(nextCntInput.val() <= 0) {
            alert('0 이하로는 입력할 수 없습니다!');
            nextCntInput.val(1);
        }
		$('.goods-cnt-box').text(nextCntInput.val());
		calcPrice(nextCntInput);
    })
    $('.plus-btn').click(function() {
		var prevCntInput = $(this).prev();
        prevCntInput.val(String(parseInt(prevCntInput.val()) + 1));
        if(prevCntInput.val() <= 0) {
			alert('0 이하로는 입력할 수 없습니다!');
            prevCntInput.val(1);
        }
		$('.goods-cnt-box').text(prevCntInput.val());
		calcPrice(prevCntInput);
    })

	/* 파일 등록되면 label 바뀜 */
	$('input[name=reviewFile]').change(function() {
		console.log($(this).val());
		var text = "0";
		if($(this).val() != null) {
			text = "1";
		}
		$('#file-cnt').text(text);
	})

	/* 리뷰 상세 보기 */
	function callReview(no) {
		var url = "/blank/goods/review?no=" + no;
		var name = "BLANK REVIEW";
		var option = "width = 100%, height = 100%, location = yes, top = 500, left = 400"
		window.open(url, name, option);
	}