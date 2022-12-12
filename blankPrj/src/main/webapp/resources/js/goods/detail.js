	function callAlert() {
	        var url = "/blank/goods/stockalert";
	        var name = "재고 알림 받기";
	        var option = "width = 500, height = 200, location = yes, top = 500, left = 400"
	        window.open(url, name, option);
	    }
	
	Kakao.Share.createScrapButton({
	  container: '#share-btn',
	  requestUrl: 'http://localhost:8888/blank/goods/detail',
	});
	
	var patt = new RegExp("[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}");
var res = patt.test( $("#tlno").val());

if( !patt.test( $("#tlno").val()) ){
    alert("전화번호를 정확히 입력하여 주십시오.");
    return false;
}