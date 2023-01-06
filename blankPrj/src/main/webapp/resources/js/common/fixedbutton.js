    // 출석체크 창 열기
    $('#attendance-btn').click(function() {
        var url = "/blank/attendance";
		var name = "출석체크";
		var option = "width = 100%, height = 100%, location = yes, top = 500, left = 400"
		window.open(url, name, option);
    })

    $('#top-btn').click(function() {
        $('html, body').animate({scrollTop:0},400);
	    return false;
    })