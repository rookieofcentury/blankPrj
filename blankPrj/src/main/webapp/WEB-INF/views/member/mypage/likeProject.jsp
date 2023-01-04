<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심 프로젝트</title>
<link rel="stylesheet" href="/blank/resources/css/member/likeProject.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body>
<%@ include file = "/WEB-INF/views/common/header.jsp" %>

	<div class="wrap">
		<div class="mypage-container">
			<div><%@ include file = "/WEB-INF/views/member/mypage/mypageSidebar.jsp" %></div>
			<div class="content-container">
				<div class="like-search">
					<div><h2>관심 프로젝트</h2></div>
					<div class="search-from">
						<form action="" method="get" id="inquiry-search-form">
			
							<div class="inquiry-search">
							
								<div></div>
								<div class="search-category">
									<select class="category" name="category">
										<option value="title">제목</option>
										<option value="content">내용</option>
									</select>
								</div>
								<div class="search-keyword">
									<input type="text" class="keyword" name="keyword">
								</div>
								<div>
									<div class="search-icon"><input type="image" src="/blank/resources/images/admin/search.png" alt="search.png" ></div>
								</div>
								<div style="margin-left: 10px;">
									<a href="/blank/help/inquiryWrite" id="wrtie-btn"><button type='button' class="wrtie-btn" style="height: 100%; width: 60px;">글쓰기</button></a>
								</div>
								
							</div>
				
						</form> 
					  
					</div>
				</div>
				<div class="focus-content">
					<div>
						<span class="number">1004개</span>
					</div>
					<div class="focus-project-list">
						<div class="focus-project-item">
							<div class="image-box"><img src="" alt="item-pic"></div>
							<div>
								<span>카테고리ㅣ창작자명</span>
								<span>418 % 달성</span>
							</div>
							<div>저는한줄프로젝트입니다</div>
						</div>
						<div class="focus-project-item">
							<div class="image-box"><img src="" alt="item-pic"></div>
							<div>
								<span>카테고리ㅣ창작자명</span>
								<span>418 % 달성</span>
							</div>
							<div>저는한줄프로젝트입니다</div>
						</div>
						<div class="focus-project-item">
							<div class="image-box"><img src="" alt="item-pic"></div>
							<div>
								<span>카테고리ㅣ창작자명</span>
								<span>418 % 달성</span>
							</div>
							<div>저는한줄프로젝트입니다</div>
						</div>
						<div class="focus-project-item">
							<div class="image-box"><img src="" alt="item-pic"></div>
							<div>
								<span>카테고리ㅣ창작자명</span>
								<span>418 % 달성</span>
							</div>
							<div>저는한줄프로젝트입니다</div>
						</div>
						<div class="focus-project-item">
							<div class="image-box"><img src="" alt="item-pic"></div>
							<div>
								<span>카테고리ㅣ창작자명</span>
								<span>418 % 달성</span>
							</div>
							<div>저는한줄프로젝트입니다</div>
						</div>
						<div class="focus-project-item">
							<div class="image-box"><img src="" alt="item-pic"></div>
							<div>
								<span>카테고리ㅣ창작자명</span>
								<span>418 % 달성</span>
							</div>
							<div>저는한줄프로젝트입니다</div>
						</div>
						<div class="focus-project-item">
							<div class="image-box"><img src="" alt="item-pic"></div>
							<div>
								<span>카테고리ㅣ창작자명</span>
								<span>418 % 달성</span>
							</div>
							<div>저는한줄프로젝트입니다</div>
						</div>
						<div class="focus-project-item">
							<div class="image-box"><img src="" alt="item-pic"></div>
							<div>
								<span>카테고리ㅣ창작자명</span>
								<span>418 % 달성</span>
							</div>
							<div>저는한줄프로젝트입니다</div>
						</div>
					</div>
					<div>1 2 3 4</div>
				</div>
			
			</div>
		</div>
	</div>	
<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
<script src="/blank/resources/js/member/likeProject.js"></script>

</html>