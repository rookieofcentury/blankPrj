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

    // 출석부 오늘 날짜, 요일 도출
    let today = new Date();

    let year = today.getFullYear();     // 년도
    let month = today.getMonth() + 1;   // 월
    let date = today.getDate();         // 날짜
    let day = today.getDay();           // 요일
    
    var week = new Array('일', '월', '화', '수', '목', '금', '토');

    $('.today-date').append(year + ' 년 ' + month + ' 월 ' + date + ' 일');
    $('.today-day').append('(' + week[day] + ')');
    refresh();
})

var currentTitle = $('#current-year');
var currentMonth = $('#current-month');
var calendarBody = $('#calendar-body');

var today = new Date();
var first = new Date(today.getFullYear(), today.getMonth(), 1);
var dayList = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
var monthList = ['January','February','March','April','May','June','July','August','September','October','November','December'];
var leapYear = [31,29,31,30,31,30,31,31,30,31,30,31];
var notLeapYear = [31,28,31,30,31,30,31,31,30,31,30,31];
var pageFirst = first;
var pageYear;
if(first.getFullYear() % 4 === 0) {
    pageYear = leapYear;
} else {
    pageYear = notLeapYear;
}

function showCalendar(){
    let monthCnt = 100;
    let cnt = 1;
    for(var i = 0; i < 6; i++){
        var $tr = document.createElement('tr');
        $tr.setAttribute('id', monthCnt);   
        for(var j = 0; j < 7; j++){
            if((i === 0 && j < first.getDay()) || cnt > pageYear[first.getMonth()]){
                var $td = document.createElement('td');
                $tr.append($td);     
            }else{
                var $td = document.createElement('td');
                var $div = document.createElement('div');
                $div.textContent = cnt;
                $div.setAttribute('class', 'flex');
                $td.setAttribute('id', cnt);                
                $tr.append($td);
                $td.append($div);
                cnt++;
            }
        }
        monthCnt++;
        calendarBody.append($tr);
    }
    currentTitle.text(first.getFullYear())
    currentMonth.text(monthList[first.getMonth()])
}

showCalendar();

function removeCalendar(){
    let catchTr = 100;
    for(var i = 100; i< 106; i++){
        var $tr = document.getElementById(catchTr);
        $tr.remove();
        catchTr++;
    }
}

function prev(){
    if(pageFirst.getMonth() === 1){
        pageFirst = new Date(first.getFullYear()-1, 12, 1);
        first = pageFirst;
        if(first.getFullYear() % 4 === 0){
            pageYear = leapYear;
        }else{
            pageYear = notLeapYear;
        }
    }else{
        pageFirst = new Date(first.getFullYear(), first.getMonth()-1, 1);
        first = pageFirst;
    }
    today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
    currentTitle.innerHTML = monthList[first.getMonth()] + '&nbsp;&nbsp;&nbsp;&nbsp;'+ first.getFullYear();
    removeCalendar();
    showCalendar();
    refresh();
}

function next(){
    if(pageFirst.getMonth() === 12){
        pageFirst = new Date(first.getFullYear()+1, 1, 1);
        first = pageFirst;
        if(first.getFullYear() % 4 === 0){
            pageYear = leapYear;
        }else{
            pageYear = notLeapYear;
        }
    }else{
        pageFirst = new Date(first.getFullYear(), first.getMonth()+1, 1);
        first = pageFirst;
    }
    today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
    currentTitle.innerHTML = monthList[first.getMonth()] + '&nbsp;&nbsp;&nbsp;&nbsp;'+ first.getFullYear();
    removeCalendar();
    showCalendar(); 
    refresh();
}