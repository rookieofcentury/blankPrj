<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Blank</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://kit.fontawesome.com/77ad8525ff.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,1,0" />
<link rel="stylesheet" href="/blank/resources/css/common/fixedbutton.css">
</head>
<body>
	<c:if test="${loginMember.nick != null}">	
		<div class="circle-btn flex attendance" id="attendance-btn">
			<span class="material-symbols-outlined top-fix">
				flag
			</span>
		</div>
	</c:if>
    <div class="circle-btn flex" id="top-btn">
		<span class="material-symbols-outlined top-fix">
			expand_less
		</span>
	</div>
</body>
<script src="/blank/resources/js/common/fixedbutton.js"></script>
</html>