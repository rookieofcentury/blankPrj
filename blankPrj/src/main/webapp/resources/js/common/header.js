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