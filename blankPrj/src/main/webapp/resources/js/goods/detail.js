$(document).ready(function() {
	$('#info-btn').prop("checked", true);
});

$('input[name=buttons]').change(function() {
	if($('input[name=buttons]:checked')) {
		$(this).prev().addClass('focus');
	}
})


function callIntro() {
	if ($('#info-btn').is(":checked") == true) {
		$('.pd-intro').css("display", "");
		$('.pd-return').css("display", "none");
		$('.pd-review').css("display", "none");
	}
}

function callReturn() {
	if ($('#return-btn').is(":checked") == true) {
		$('.pd-intro').css("display", "none");
		$('.pd-return').css("display", "");
		$('.pd-review').css("display", "none");
	}
}

function callReview() {
	if ($('#review-btn').is(":checked") == true) {
		$('.pd-intro').css("display", "none");
		$('.pd-return').css("display", "none");
		$('.pd-review').css("display", "");
	}
}


function callAlert() {
	var url = "/blank/goods/stockalert";
	var name = "재고 알림 받기";
	var option = "width = 500, height = 200, location = yes, top = 500, left = 400"
	window.open(url, name, option);
}