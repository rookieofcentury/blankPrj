<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 설문 관리 | 통계</title>
<link rel="stylesheet" href="/blank/resources/css/admin/quit/stats.css">
</head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<body>

    <div class="stats-board-content">
    
        <div><%@ include file = "/WEB-INF/views/admin/common/menu.jsp" %></div>
        
        <main>
        
            <div class="stats-board-header">
                <div>
                    <h1>탈퇴 설문 관리</h1>
                </div>
                <div>
                    <h2>통계</h2>
                </div>           
            </div>
            
            <div class="stats-board">
        
        		<div id="piechart"></div>
        
                <div class="stats-list">
        
                    <div class="stats-list-top">전체 답변 <a id="quitCount">${quitCount}</a> 건</div>
        
                    <div>번호</div>
                    <div>작성자</div>
                    <div>탈퇴 사유</div>
                    <div>탈퇴 의견</div>
            		
            		<c:forEach items="${voList}" var="vo">
	           			<div>${vo.no}</div>
	                    <div>${vo.nick}</div>
	                    <div>${vo.quitNo}</div>
	                    <div>${vo.quitVar}</div>
            		</c:forEach>
                    
            		<div id="page-area">
				
						<c:if test="${pageVo.startPage != 1}">
							<a href="/blank/admin/stats?p=${pageVo.startPage - 1}">&lt;</a>
						</c:if>
	
						<c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}" >
							<a href="/blank/admin/stats?p=${num}">${num}</a>
						</c:forEach>
	
						<c:if test="${pageVo.endPage != pageVo.maxPage}">
							<a href="/blank/admin/stats?p=${pageVo.endPage + 1}">&gt;</a>
						</c:if>

					</div>
                    
                </div>
    
            </div>
    
        </main>
    </div>
    
</body>

<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {

		
		$.ajax({
			url : "/blank/admin/result",
            method : "GET",
            success : function(result){

				let array = [];

				array.push(["탈퇴사유", "갯수"]);

				for(var i = 0; i < result.length; i++){
					
					let quit = result[i].QUIT_NO;
					let cnt = result[i].CNT;

					array.push([quit, cnt]);

					console.log(quit)
					console.log(cnt)
					
				};

				var data = google.visualization.arrayToDataTable(array);

				var options = {
					responsive: true,
                	legend: 'none',
					responsive: false,
					chartArea:{
						width: 300,
						height: 300,
					},
					pieHole: 0.4,
					backgroundColor: 'none',
					height: 450,
					width: 1600
				};
				
				var chart = new google.visualization.PieChart(document.getElementById('piechart'));
				
				chart.draw(data, options);

            },
            error:function(){
			    alert('실패');
		    }
        });

	}
</script>

</html>