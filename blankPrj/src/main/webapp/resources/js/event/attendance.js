$(document).ready(function() {
    // 출석부 오늘 날짜, 요일 도출
    let today = new Date();

    let year = today.getFullYear();     // 년도
    let month = today.getMonth() + 1;   // 월
    let date = today.getDate();         // 날짜
    let day = today.getDay();           // 요일
    
    var week = new Array('일', '월', '화', '수', '목', '금', '토');

    $('.today-date').append(year + ' 년 ' + month + ' 월 ' + date + ' 일');
    $('.today-day').append('(' + week[day] + ')');
})