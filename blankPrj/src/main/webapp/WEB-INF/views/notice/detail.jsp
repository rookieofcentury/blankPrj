<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="/blank/resources/css/notice/detail.css">
</head>
<body>

<%@ include file = "/WEB-INF/views/common/header.jsp" %>

    <div id="notice-container">
    
        <div class="notice-detail">
    
            <div class="notice-detail-hearder">
                <div>공지사항</div>
                <c:if test="${selectNotice.fixeYn == 'Y'}">
                	<div>${selectNotice.title}&nbsp;&nbsp;<img src="/blank/resources/images/help/pin.png" width="24" height="25"></div>
               	</c:if>
               	<c:if test="${selectNotice.fixeYn == 'N'}">
               		<div>${selectNotice.title}</div>
               	</c:if>
                <div>${selectNotice.writeDate}</div>
            </div>
            
            <div class="notice-detail-content">
            	${selectNotice.content}
            </div>

        </div>

        <div class="notice-detail-footer">

            <div class="notice-detail-footer-top">
            	이전 글
            </div>
            <div class="notice-detail-footer-top">공지사항</div>
            <div class="notice-detail-footer-top last"></div>

            <div>다음 글</div>
            <div>공지사항</div>
            <div class="notice-detail-footer-bottom last"></div>

        </div>

        <div class="back-btn">
        	<a href="/blank/notice/list"><input type="button" value="목록으로 돌아가기"></a>
        </div>

    </div>



<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
</html>