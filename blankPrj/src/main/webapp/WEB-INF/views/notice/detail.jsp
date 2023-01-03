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
                <div>${selectNotice.title}</div>
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
            <input type="button" value="목록으로 돌아가기" onclick="goBack();">
        </div>
        
		<script type="text/javascript">
		
			function goBack(){
				window.history.back();
			}
		
		</script>

    </div>



<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
</html>