<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 상세조회</title>
<link rel="stylesheet" href="/blank/resources/css/project_view/detailInfo.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">;
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

</head>
<body>

<%@ include file = "/WEB-INF/views/common/header.jsp" %>
	
	<div id="container">
		<div class="content-intro">
			<div class="intro-top">
				<a href=#>
					<span class="top-category">${prj.category}</span>
				</a>
				<h1 class="top-title">${prj.title}</h1>
			</div>
			<div class="content-introduction">
				<div class="introduction-main">
                    <div class="main-image">
						<img src="/blank/resources/upload/project/${prj.changeName}" alt="프로젝트썸네일">
                    </div>
					<div class="main-summary">
						${prj.summary}
					</div>
				</div>
				<div class="introduction-sub">
					<div class="sub-status">
						<div class="status-price">
							<div class="price-total"><strong><fmt:formatNumber value="${prj.fundingSum}" pattern="#,###"/></strong>원</div>
							<div class="price-fundingrate">${prj.percent}%</div>
						</div>
						<div class="status-period">
							<div><strong>${prj.calDate}</strong>일</div>
							<div>남음</div>
						</div>
						<div class="status-supporter">
							<div>후원자</div>
							<div>&nbsp;</div>
							<div><strong>${prj.fundingQuantity}</strong></div>
							<div>명</div>
						</div>
					</div>
                    <hr>
					<div class="sub-info">
						<div class="info-price">
							<div class="price"><strong>목표금액</strong></div>
							<div><fmt:formatNumber value="${prj.price}" pattern="#,###"/>원</div>
						</div>
						<div class="info-period">
							<div class="period"><strong>펀딩기간</strong></div>
							<div>
								 ${prj.startDate} ~ ${prj.endDate}
							</div>
						</div>
						<div class="info-payment">
							<div class="payment"><strong>결제</strong></div>
							<div>100% 이상 모이면 펀딩이 성공되며, 펀딩 마감일까지 목표 금액이 100% 모일 경우 펀딩이 끝난 다음 날 결제가 진행됩니다.</div>
						</div>
					<div class="sub-buttons">
						<div class="buttons-like">
                            <div class="like-icon"><i class="bi bi-heart"></i></div>
                            <div class="like-count">찜~</div>
                        </div>
						<button class="buttons-funding">프로젝트 후원하기</button>
					</div>
				</div>
			</div>
		</div>
        <hr>
        <div class="content-navigation">
            <a href="#">프로젝트 계획</a>
            <a href="/blank/project/news">새소식 ${prj.news} </a>
            <a href="/blank/project/review">후기 ${prj.review}</a>
        </div>
		<div class="content-explanation">
            <div class="explanation-project">${prj.story}</div>
            <div class="explanation-side">
				<div>프로젝트 신고하기</div>
                <div class="side-creator">
                    <div class="creator-header">창작자 소개</div>
                    <div class="creator-container">
						<div>
							<a href=#>
								<span class="container-img"></span>
							</a>
							<div class="container-name">
								<div class="name-nick"><strong>
									<a href=#>${prj.creator}</a>
								</strong></div>
								<div class="name-follow">+ 팔로우</div>
							</div>
						</div>
                        <div>${prj.creatorInfo}</div>
                    </div>
                </div>
                <div class="side-reward">
                    <div class="reward-select">리워드 선택
					<c:forEach items="${set}" var="item">
						
					<div class="reward-card">
						<input type="radio" id="${item.setNo}" value="${item.setNo}" name="range">
						<label for="${item.setNo}">

							<div class="card-option">
								<div class="option-title">
									<div class="title-price"><fmt:formatNumber value="${item.setPrice}" pattern="#,###"/>원</div>
									<div class="title-name">${item.setName}</div>
								</div>
								<ul>
									<li>${item.option}</li>
									<!-- <li>고급가죽케이스</li>
									<li>안경닦이</li>
									<li>미니드라이브</li> -->
								</ul>
								<div class="option-quantity">제한수량 ${item.setQuantity}개</div>
								<div class="option-sell">총 ${item.setQuantity}개 펀딩완료</div>
							</div>
							
						</label>
					
					</div>
					</c:forEach>
                    </div>
                </div>

            </div>
		</div>
		
	</div>
	
	<%@ include file = "/WEB-INF/views/common/footer.jsp" %>

	<script>

		/* 접속 시 플젝 찜하기 확인 */
		$(document).ready(function() {
			if('${loginMember.no}'){
				$.ajax({
					type: "",
					url  : "/blank/project/mylikePrj",
					type : "POST",
					data : {
						"pno" : '${prj.no}'
					},
					success : function(x){
					if(x == 1){
						// $(this).attr('class','bi-heart-fill');
						// i++;
						$('i').eq(0).attr('class','bi-heart-fill');
						i++;
					}
				},error : function(x){
					console.log("받아온 리절트"+x);
					alert('내가 찜한 프로젝트 에러!!!!!!!!!');
				} 
				})
			}
		})

		/*찜하트 채우기*/
        var i = 0;
        $('i').on('click',function(){
			if(!'${loginMember.no}'){
				alert('로그인 후 이용해 주세요')
			}else{
            if(i==0){
				console.log("로그인 ㅇㅋ, 찜하기 눌럿어");
				$.ajax({
					type: "",
					url  : "/blank/project/likePlusPrj",
					type : "POST",
					data : {
						"pno" : '${prj.no}'
					},
					success : function(x){
					if(x == 1){
						alert('찜하기 완~')
						//location.reload();
						// $('i').eq(0).attr('class','bi-heart-fill');
						$('i').attr('class','bi-heart-fill');
						i++;
					}
				},error : function(x){
					console.log('찜한 프로젝트 ++에러!!!!!!!!!');
				} 
				})
            }else if(i==1){
				console.log("로그인 ㅇㅋ, 찜하기 끌거야");
				$.ajax({
					type: "",
					url  : "/blank/project/likeMinusPrj",
					type : "POST",
					data : {
						"pno" : '${prj.no}'
					},
					success : function(x){
					if(x == 1){
						alert('찜하기 취소완~')
						$(this).attr('class','bi-heart');
						i--;
					}
				},error : function(x){
					console.log('찜한 프로젝트 --에러!!!!!!!!!');
				} 
				})
			}
			}
		});

		/*팔로우 확인*/
		$(document).ready(function() {
			let temp = true;
			if('${loginMember.no}'==''){
				temp = false;
			}
			if(temp){
				console.log('로그인멤버 you');
				$.ajax({
					type: "",
					url  : "/blank/project/followCheck",
					type : "POST",
					data : {
						"creator" : '${prj.mno}'
					},
					success : function(x){
					if(x == 1){
						$('.name-follow').text('팔로잉');
						$('.name-follow').css("color", "#fff");
						$('.name-follow').css("background", "#567ace");
					}
				},error : function(x){
					console.log("받아온 리절트"+x);
				} 
				})
			}
		});

		/*팔로우*/
		$('.name-follow').on('click',function(){
			if(!'${loginMember.no}'){
				alert('로그인 후 이용해 주세요')
			}else{
			var str1 = $('.name-follow').text();
			console.log(str1);
			var str2 = '팔로잉';
            if(str1 === str2){
				console.log("팔로잉 취소");
				$.ajax({
					type: "",
					url  : "/blank/member/deleteMember",
					type : "POST",
					data : {
						"likeMemberNo" : '${prj.mno}'
					},
					success : function(x){
					if(x == 1){
						alert('팔로잉 취소~')
						$('.name-follow').text('+ 팔로우');
					}
				},error : function(x){
					console.log('팔로잉 취소 에러!!!!!!!!!');
				} 
				})
            }else{
				console.log("팔로잉 ++");
				$.ajax({
					type: "",
					url  : "/blank/member/insertLikeMember",
					type : "POST",
					data : {
						"likeMemberNo" : '${prj.mno}'
					},
					success : function(x){
					if(x == 1){
						alert('팔로잉 완~')
						$('.name-follow').text('팔로잉');
					}
				},error : function(x){
					console.log('팔로잉 완 에러!!!!!!!!!');
				} 
				})
			}
			}
		});
		
		/*금액 콤마찍기*/
		var amount = '${ prj.price }'
		var wantPrice = amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
		$(document).ready(function() {
			 
			 let checkSet = $('input:radio[name=range]');
			//  let ch = $('input:radio[name=range]').is(':checked') == false;
			//  checkSet.click(function(){
			// 	console.log(checkSet);
			// 	 $(this).parent().css("border-width", "5px");
			// 	 $(this).parent().css("border-color", "#567ace");
			// 		checkSet.prop("checked", false);
				
			//  });

		// 	$('input:radio').on('click',function)
		// 	// if(chkList){
		});

		/* 후원하기 */
		$('.buttons-funding').click(function(){
			if($('input:radio[name=range]').is(':checked') == false){
				alert("리워드를 선택해 주세요!");
			}else{
				var rangeVal = $('input:radio[name=range]:checked').val();
				let string = location.href.split('=');
            	let prjNo = string[1];

				$.ajax({
                url : "/blank/project/pay",
                method : "POST",   
                data :   {
                    "setNo" : rangeVal,
                },
                success : function(x){
                    location.href = "/blank/pay?pNo=" + prjNo + "&setNo=" + rangeVal;
                },error : function(){
                    console.log("후원 통신에러");
                }
            	});
			}
		});

    </script>
</body>
</html>