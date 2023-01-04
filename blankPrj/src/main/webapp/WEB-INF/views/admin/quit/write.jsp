<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 설문 관리</title>
<link rel="stylesheet" href="/blank/resources/css/admin/quit/write.css">
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
					<div>
						<input type="submit" value="등록"/>
					</div>
					<div class="quit-items">
						<div class="quit-title">번호</div>
						<div class="quit-title">관리자</div>
						<div class="quit-title">탈퇴사유</div>
						<div class="quit-title">삭제</div>
					</div>
					<div class="quit-content add-target">
						<div><input type="text" name="no"/></div>
						<div><input type="text" name="adminNo"/></div>
						<div><input type="text" name="content" placeholder="질문 내용을 입력해 주세요" /></div>
						<div><img src="/blank/resources/images/admin/delect.png" class="delect-img" onclick="quirDelect();"></div>
					</div>
					<div><button type="button" onclick="quirAdd();">추가</button></div>
				</div>

			</div>

		</div>

	</div>

</body>

<script>

	function quirAdd(){
		const addTarget = document.querySelector('.add-target')

		const newDiv1 = document.createElement('div');
		newDiv1.innerHTML = "<input type='text' name='no'/>";
		const newDiv2 = document.createElement('div');
		newDiv2.innerHTML = "<input type='text' name='adminNo'/>";
		const newDiv3 = document.createElement('div');
		newDiv3.innerHTML = "<input type='text' name='content' placeholder='질문 내용을 입력해 주세요' />";
		const newDiv4 = document.createElement('div');
		newDiv4.innerHTML = "<img src='/blank/resources/images/admin/delect.png'  class='delect-img' onclick=''>";

		addTarget.appendChild(newDiv1);
		addTarget.appendChild(newDiv2);
		addTarget.appendChild(newDiv3);
		addTarget.appendChild(newDiv4);
	}

	function quirDelect(){

	}

</script>

</html>