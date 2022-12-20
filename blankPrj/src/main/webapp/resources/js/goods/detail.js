$(document).ready(function() {
	$('#info-btn').prop("checked", true);
});

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

$('#goods-option').change(function() {
	// select된 option text
	var text = $('#goods-option option:selected').text();
	// option-block 생성된 친구들 text
	var optionText = $('.option-block-text').text();
	// optionText 안에 select된 애 있어?
	var isInclude = optionText.includes(text);

	if(isInclude == false) {
		$('.option-area').append('<div class="option-block"> <div> <div>옵션: <span class="option-block-text">'+ text + '</span></div> <div class="x-button">X</div> </div> <div> <input type="number" name="goodsCnt" value="1" min="1"> <div>24,000 원</div> </div> </div>')
	}
})

$('.x-button').click(function() {
	$(this).unwrap();
})

function callAlert() {
	var url = "/blank/goods/stockalert";
	var name = "재고 알림 받기";
	var option = "width = 100%, height = 100%, location = yes, top = 500, left = 400"
	window.open(url, name, option);
}