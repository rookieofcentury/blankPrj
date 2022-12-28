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
<script>
 $(document).ready(function() { 
	 //alert('dd')
         	<c:forEach items="${myPrj}" var="myPrj">
         		<c:forEach items="${statusAll}" var="statusCount">
	        //var statusAll = '';
	        var list = '';
	
	        var cnt = '${ statusCount.cnt }';
	        console.log(cnt);
	        var title2 = '${ myPrj.title }';
	        var no = '${ myPrj.no }';
	        var status = '${ myPrj.status }';
	        var summary = '${ myPrj.summary }';
	        //var img = '${ myPrj.title }';
	        
        	list +=	'<div class="myprj-status">' + cnt + '</div>' + '<div class="list-box">'
	        list += '<div class="prj-img">'+'<img src="/blank/resources/images/blank.png" alt="프로젝트 썸네일"/>'+'</div>';
            list += '<div class="prj-info">'+'<div class="prj-content">';
            list += '<div class="content-info">'+'<div>'+title2+'</div>'+'<div>'+summary+'</div>'+'</div>';
            list += '<div>'+'<div class="management-button">'+'<a href="/blank/project/created/list?p='+no+'">관리</a>'
                +'</div>'+'<div class="delete-button">'+'<a href="/blank/project/created/delete?p='+no+'">삭제</>'+'</div>'+'</div>';  
            list += '</div>'+'</div>'+'</div>'+'</div>'; 
	        
            $(".list-content").append(list);
/*  			list += '<div>' + title2 + '</div>';  */
        	</c:forEach> 
        </c:forEach> 

    }); 
    </script>

    <%@ include file = "/WEB-INF/views/common/header.jsp" %>
    

    <div id="container">
        <div class="header">
            <span>내가 만든 프로젝트</span>
        </div>
        <div class="taps">
            <div>전체</div>
            <div>작성중</div>
            <div>심사중</div>
            <div>승인됨</div>
            <div>반려됨</div>
            <div>진행중</div>
            <div>종료</div>
        </div>
        <div class="myprj-list">
            <div class="list-content">
                <div class="myprj-status">작성 중 1</div>
                <!-- <c:forEach items="${myPrj}" var="item">
                    <div>${item.title}</div>
                 </c:forEach> -->
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
                </div> 
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
                <a id="chk_today" class="delte-prj">확인</a> 
            </div>
        </div>
    </div>
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>

    <script>

    /* 모달창 */
    $('.delete-button').on('click', function() {
        $('#popup_layer').css('display', 'block');
    });
    function closePop() { 
        document.getElementById("popup_layer").style.display = "none";
    }

   


    // $('.taps > div:nth-child(2)').click(function(){
    //     $.ajax({
    //         url : "/blank/project/created",
                //traditional : true,
    //         method : "GET",   
    //         data :   {
    //             "myPrjCreating" : 1
    //         },
    //         success : function(x){
    //             var o = JSON.parse(x);
    //             $('.myprj-status').text(o.status);
    //     },
    //         error : function(){
    //             console.log("작성중 통신에러");
    //         }
    //     });  
    // })

    </script>
</body>
</html>