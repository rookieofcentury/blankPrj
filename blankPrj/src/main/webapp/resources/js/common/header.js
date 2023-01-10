// 일정 SCROLL 이상 내려가면 fixed
$(window).scroll(function() {
    var fixed = $(".header-menu-container").offset().top;
  	var top = $(window).scrollTop();

    if(top >= 128) {
        $(".header-menu-container").addClass("fixed");
    } else {
        $(".header-menu-container").removeClass("fixed");
    }
})

// 파비콘
window.onload = function() {
    var link = document.createElement('link');
    link.type = 'image/x-icon';
    link.rel = 'shortcut icon';
    link.href = '/blank/resources/images/blank.ico';
    document.getElementsByTagName('head')[0].appendChild(link);
}();

$('#expand-cate').change(function() {
    if($('#expand-cate').is(":checked")) {
        $('.menu-detail-box').show("200", function() {
            $(this).css("display", "grid");
        });
    } else {
        $('.menu-detail-box').hide("200");
    }
})

// 띄어쓰기만 있으면 검색 불가
function checkKeyword() {
    if(($('input[name=keyword]').val()).replace(/ /g,"") == '') {
        Swal.fire({
            title: '검색하실 수 없습니다!',
            text: '검색어는 1자 이상 입력해 주세요.',
            icon: 'error',
            confirmButtonColor: '#567ACE'
        })
        $('input[name=keyword]').val("");
        return false;
    }
}