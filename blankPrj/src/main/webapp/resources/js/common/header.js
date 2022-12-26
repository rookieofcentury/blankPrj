var fixed = $(".header-menu-container").offset().top;
$(window).scroll(function() {
  	var window = $(this).scrollTop();

    if(fixed <= window) {
        $(".header-menu-container").addClass("fixed");
    } else {
        $(".header-menu-container").removeClass("fixed");
    }
})