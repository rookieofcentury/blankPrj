<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 설문 관리</title>
<link rel="stylesheet" href="/blank/resources/css/admin/quit/list.css">
</head>
<body>

	<div class="quit-board-content">

		<div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
		
		<div id="quit-content">

			<div class="quit-board-header">
				<div>
					<h1>탈퇴 설문 관리</h1>
				</div>
				<div>
					<h2>탈퇴 사유</h2>
				</div>
			</div>

			<div class="quit-board-middle">

					<div class="quit-board-items">

						<div class="quit-items">
							<div class="quit-title">번호</div>
							<div class="quit-title">관리자</div>
							<div class="quit-title">탈퇴사유</div>
							<div class="quit-title">삭제</div>
						</div>
						
						<c:forEach items="${voList}" var="vo">
						
							<div class="quit-content">
								<div name="no">
									${vo.no}
									<input type="hidden" name="no" value="${vo.no}">
								</div>
								<div name="adminNo">${vo.adminNo}</div>
								<div name="content">${vo.content}</div>
								<div><img src="/blank/resources/images/admin/delect.png" class="delect-img"/></div>
							</div>
							
						</c:forEach>
						
					</div>

			</div>

		</div>

	</div>

</body>

</html>