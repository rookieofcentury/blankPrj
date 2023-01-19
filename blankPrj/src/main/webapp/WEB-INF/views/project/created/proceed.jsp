<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 만든 프로젝트</title>
<link rel="stylesheet" href="/blank/resources/css/created/proceed.css">
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

    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>

    <script>

    var list = '';
    $(document).ready(function() { 
        
        var alertMsg = '${msg}';
        if(alertMsg != '') {
            list +=	'<div class="myprj-status">' + '<h3>' + $('.taps > div:nth-child(5)').text() + '인 프로젝트가 없습니다.' + '</h3>' + '</div>' + '</div>';
            $(".list-content").append(list);
        }else{
            list +=	'<div class="myprj-status">' + '<h3>' + $('.taps > div:nth-child(5)').text() + ' ' + "${resultcnt}" + '</h3>' + '</div>' ;
            <c:forEach items="${myPrj}" var="myPrj">

                var title2 = '${ myPrj.title }';
                var no = '${ myPrj.no }';
                var status = '${ myPrj.status }';
                var summary = '${ myPrj.summary }';

                list += '<div class="list-box">';
                list += '<div class="prj-img">'+'<img src="/blank/resources/upload/project/${myPrj.changeName}" alt="프로젝트 썸네일"/>'+'</div>';
                list += '<div class="prj-info">'+'<div class="prj-content">';
                list += '<div class="content-info">'+'<div>'+title2+'</div>'+'<div>'+summary+'</div>'+'</div>';
                list += '<div>' + '<div class="management-button">' + '<a href="/blank/project?p=' + no + '">관리</a>'
                    +'</div>'+'<div class="delete-button">' + '<input type="hidden" id="s_name" value="${ myPrj.no }" name="hiddenNo" />' + '삭제' + '</div>' + '</div>';  
                list += '</div>'+'</div>'+'</div>';

                </c:forEach>
                $(".list-content").append(list);
            }
            $('.delete-button').click(function(){
                Swal.fire({
                    title: '안내 메시지',
                    text: "진행중인 프로젝트는 삭제할 수 없습니다~",
                    icon: 'error',
                    confirmButtonColor: '#567ACE'
                });
            });
        }); 

            
    </script>

</body>
</html>