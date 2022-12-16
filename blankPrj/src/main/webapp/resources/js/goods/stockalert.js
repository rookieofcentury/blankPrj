$(document).ready(function() {
    // 팝업 창 크기를 HTML 크기에 맞추어 자동으로 크기를 조정하는 함수.
    var strWidth;
    var strHeight;

    //innerWidth / innerHeight / outerWidth / outerHeight 지원 브라우저 
    if ( window.innerWidth && window.innerHeight && window.outerWidth && window.outerHeight ) {
        strWidth = $('.wrap').outerWidth() + (window.outerWidth - window.innerWidth);
        strHeight = $('.wrap').outerHeight() + (window.outerHeight - window.innerHeight);
    }
    else {
        var strDocumentWidth = $(document).outerWidth();
        var strDocumentHeight = $(document).outerHeight();

        window.resizeTo ( strDocumentWidth, strDocumentHeight );

        var strMenuWidth = strDocumentWidth - $(window).width();
        var strMenuHeight = strDocumentHeight - $(window).height();

        strWidth = $('.wrap').outerWidth() + strMenuWidth;
        strHeight = $('.wrap').outerHeight() + strMenuHeight;
    }

    //resize 
    window.resizeTo( strWidth, strHeight );
});