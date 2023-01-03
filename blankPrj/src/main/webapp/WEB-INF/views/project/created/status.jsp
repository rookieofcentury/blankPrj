<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 만든 프로젝트</title>
<link rel="stylesheet" href="/blank/resources/css/created/status.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>

</head>
<body>

    <%@ include file = "/WEB-INF/views/common/header.jsp" %>
    

    <div id="container">
        <div class="header">
            <span>내가 만든 프로젝트</span>
        </div>
        <div class="taps">
            <div class="writing" onclick='handleclick()' >작성중</div>
            <div class="examination">심사중</div>
            <div>승인됨</div>
            <div>반려됨</div>
            <div>진행중</div>
            <div>종료</div>
        </div>
        <div class="myprj-list">
            <div class="list-content">
                <!-- <div class="myprj-status">작성 중 1</div>
                  <div class="list-box">
                     <div class="prj-img"><img src="/blank/resources/images/blank.png" alt="프로젝트 썸네일"></div>
                    <div class="prj-info">
                        <div class="prj-content">
                            <div class="content-info">
                                <div>title</div>
                                <div>누적 펀딩률 8,988%, 평점 4.5점! 노력을 넘어 안경을 위해 "혼"을 담은 세미콜론의 와디즈 한정 두 번째 혼 프로젝트 서포터 의견을 듣고 업그레이드 되어 돌아왔습니다</div>
                            </div>
                            <div>
                                <div class="management-button">
                                    <a href="/blank/project/created/list?p='+sp[i].no+'">관리</a>
                                </div>
                                <div class="delete-button">
                                    <a >삭제</a>
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>  -->
            </div>
            <!-- <c:if test="${loginMember != null}">
            </c:if> -->
        </div>
    </div>

    <div id="popup_layer">
        <div class="popup_box">
            <div class="popup_cont">
				<img class="logo-img" src="/blank/resources/images/blank.png">
                <p>
                    프로젝트를 삭제하시겠습니까?<br>
                    프로젝트를 삭제하시면,<br>
                    작성했던 모든 내용이 삭제됩니다.
                </p>
            </div>
            <div class="popup_btn">
                <a href="javascript:closePop();">취소</a>
                <a id="chk_today" class="delete-prj" onclick="clickDelete()">확인</a> 
            </div>
        </div>
    </div>
    
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>

    <script>

    $(document).ready(function(){
		$(".writing").trigger('click');
		// 또는 $(".writing").click();
	});

    var list = '';
    
    $(document).ready(function() { 
    	//$(function(){
       // $(document).on('click',$('.writing'),function(){
    //function handleclick(){
        //$(".writing").click(function() {
		console.log('test');	
            $.ajax({
            url : "/blank/project/created/writing",
            method : "GET",   
            data :   {
                "statusWriting" : $('.taps > div:nth-child(1)').text()
            },
            success : function(x){
                console.log(x);
                if(x == 0){
                    list +=	'<div class="myprj-status">' + '<h3>' + $('.taps > div:nth-child(1)').text() + '인 프로젝트가 없습니다.' + '</h3>' + '</div>' + '</div>';
                    $(".list-content").append(list);
                }else{

                    list +=	'<div class="myprj-status">' + '<h3>' + $('.taps > div:nth-child(1)').text() + ' ' + x + '</h3>' + '</div>' ;
                    <c:forEach items="${myPrj}" var="myPrj">
                        console.log("ttt");
                    
                        //var cnt = ;
                        var title2 = '${ myPrj.title }';
                        var no = '${ myPrj.no }';
                        var status = '${ myPrj.status }';
                        var summary = '${ myPrj.summary }';

                        // list += '<div class="list-box">';
                        // list += '<div class="prj-img">'+'<img src="/blank/resources/images/blank.png" alt="프로젝트 썸네일"/>'+'</div>';
                        // list += '<div class="prj-info">'+'<div class="prj-content">';
                        // list += '<div class="content-info">'+'<div>'+title2+'</div>'+'<div>'+summary+'</div>'+'</div>';
                        // list += '<div>' + '<div class="management-button">' + '<a href="/blank/project/created/list?p=' + no + '">관리</a>'
                        //     +'</div>'+'<div class="delete-button">' + '<input type="hidden" id="s_name" value="${ myPrj.no }" name="hiddenNo" />' + '삭제' + '</div>' + '</div>';  
                        // list += '</div>'+'</div>'+'</div>';

                        list += `<div class="list-box">
                        <div class="prj-img"><img src="/blank/resources/images/blank.png" alt="프로젝트 썸네일"/></div>
                        <div class="prj-info"><div class="prj-content">
                        <div class="content-info"><div>${title2}</div><div>${summary}</div></div>
                        <div><div class="management-button"><a href="/blank/project/created/list?p=${no}">관리</a>
                            </div><div class="delete-button"><input type="hidden" id="s_name" value="${ myPrj.no }" name="hiddenNo" />삭제</div></div>
                        </div></div></div>
                        `;
                        
                        </c:forEach>
                        $(".list-content").append(list);
            }
            },error : function(){
                console.log("작성중 통신에러");
            }
        });  
            //};
    });

    /* 심사중 ajax*/
    $('.examination').eq(0).on('click',function(z){
        console.log(z.currentTarget);
        console.log(z.target);
        	//$('.taps > div:nth-child(2)').addClass('selected-tap').removeClass('.unselected-tap');
        	//$('.taps>*:not(.taps>div:nth-child(2)').addClass('unselected-tap').removeClass('.selected-tap');
        	$('.taps > div:nth-child(2)').css('color', '#fff');
        	$('.taps > div:nth-child(2)').css('background', '#567ace');
        	$('.taps>*:not(.taps>div:nth-child(2)').css('background', 'rgb(255, 255, 255)');
        	$('.taps>*:not(.taps>div:nth-child(2)').css('color', '#567ace');
        	$('.taps>*:not(.taps>div:nth-child(2)').css('border', '1px solid #567ace');
        	
        	$.ajax({
            url : "/blank/project/created/examination",
            method : "GET",   
            data :   {
                "statusWriting" : $('.taps > div:nth-child(2)').text()
            },
            success : function(x){
            	console.log("심사중");
            
                if(x == 0){
                    list +=	'<div class="myprj-status">' + '<h3>' + $('.taps > div:nth-child(2)').text() + '인 프로젝트가 없습니다.' + '</h3>' + '</div>' + '</div>';
                    $(".list-content").append(list);
                }else{
                    //$('.list-content').empty();
                    list +=	'<div class="myprj-status">' + '<h3>' + $('.taps > div:nth-child(2)').text() + ' ' +x + '</h3>' + '</div>' ;
                    <c:forEach items="${myPrj}" var="myPrj">
                        //var cnt = ;
                        var title2 = '${ myPrj.title }';
                        var no = '${ myPrj.no }';
                        var status = '${ myPrj.status }';
                        var summary = '${ myPrj.summary }';

                        list += '<div class="list-box">';
                        list += '<div class="prj-img">'+'<img src="/blank/resources/images/blank.png" alt="프로젝트 썸네일"/>'+'</div>';
                        list += '<div class="prj-info">'+'<div class="prj-content">';
                        list += '<div class="content-info">'+'<div>'+title2+'</div>'+'<div>'+summary+'</div>'+'</div>';
                        list += '<div>' + '<div class="management-button">' + '<a href="/blank/project/created/list?p=' + no + '">관리</a>'
                            +'</div>'+'<div class="delete-button">' + '<input type="hidden" id="s_name" value="${ myPrj.no }" name="hiddenNo" />' + '삭제' + '</div>' + '</div>';  
                        list += '</div>'+'</div>'+'</div>';
                        
                        </c:forEach>
                        $(".list-content").append(list);
                        
            }
            },error : function(){
                console.log("심사중 통신에러");
            }
        });  
    });

       /* 삭제 ajax */
        function clickDelete() { 
       	 	$('#popup_layer').css('display', 'none');
            
            $.ajax({
                url : "/blank/project/created/delete",
                method : "GET",   
                data :   {
                    "no" : $('#s_name').val()
                },
                success : function(x){
                    if(x == 1){
                   	alert('삭제완료 되었습니다.')
                    window.location.href = "/blank/project/created";
                    } 
            },
                error : function(){
                    console.log("삭제 통신에러");
                }
            });  
        };
        
        
        
    /* 모달창 */
    $(document).on('click','.delete-button',function(){
       	console.log($('#s_name').val());
       	$('#popup_layer').css('display', 'block');
    });
     
    function closePop() { 
    	$('#popup_layer').css('display', 'none');
    }

    
    </script>
</body>
</html>