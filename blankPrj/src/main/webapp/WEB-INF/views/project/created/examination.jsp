<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 만든 프로젝트</title>
<link rel="stylesheet" href="/blank/resources/css/created/examination.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>

</head>
<body>
    <%@ include file = "/WEB-INF/views/common/header.jsp" %>

    <div id="container">
        <div class="header">
            <span>내가 만든 프로젝트</span>
        </div>
        <div class="taps">
            <div class="writing"><a href="/blank/project/created/">작성중</a></div>
            <div class="examination"><a href="/blank/project/created/examination">심사중</a></div>
            <div class="confirm"><a href="/blank/project/created/confirm">승인됨</a></div>
            <div class="return"><a href="/blank/project/created/return">반려됨</a></div>
            <div class="proceed"><a href="/blank/project/created/proceed">진행중</a></div>
            <div class="end"><a href="/blank/project/created/end">종료</a></div>
        </div>

        <div class="myprj-list">
            <div class="list-content">
            </div>
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

    var list = '';
    $(document).ready(function() { 
        var alertMsg = '${msg}';
        console.log(alertMsg);
        if(alertMsg != '') {
            list +=	'<div class="myprj-status">' + '<h3>' + $('.taps > div:nth-child(2)').text() + '인 프로젝트가 없습니다.' + '</h3>' + '</div>' + '</div>';
            $(".list-content").append(list);
        }else{
            list +=	'<div class="myprj-status">' + '<h3>' + $('.taps > div:nth-child(2)').text() + ' ' + "${resultcnt}" + '</h3>' + '</div>' ;
            <c:forEach items="${myPrj}" var="myPrj">

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