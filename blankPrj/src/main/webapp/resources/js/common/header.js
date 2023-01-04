// 일정 SCROLL 이상 내려가면 fixed
var fixed = $(".header-menu-container").offset().top;
$(window).scroll(function() {
  	var window = $(this).scrollTop();

    if(fixed <= window) {
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
    link.href = '/blank/resources/images/member/blank.ico';
    document.getElementsByTagName('head')[0].appendChild(link);
}();