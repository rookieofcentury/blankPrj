<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blank</title>
<link rel="stylesheet" href="/blank/resources/css/project_post/search.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

    <%@ include file = "/WEB-INF/views/common/header.jsp" %>
    
    <div class="wrap">

        <div class="container">
            
            <form action="/blank/project/search" method="get" id="project-search-form">
                <div class="search-area">
                    <div class="keyword-category">
                        <select name="category" id="category-box">
                            <option value="" selected>== 선택 ==</options>
                            <option value="1">디자인문구</option>
                            <option value="2">반려동물</option>
                            <option value="3">예술</option>
                            <option value="4">의류</option>
                            <option value="5">캐릭터/굿즈</option>
                            <option value="6">패션/잡화</option>
                            <option value="7">푸드</option>
                            <option value="8">홈/리빙</option>
                        </select>
                    </div>
                    <div class="standard-area">
                        <label class="standard"><input type="radio" name="standard" value="startDate"><span>최신등록순</span></label>
                        <label class="standard"><input type="radio" name="standard" value="endDate"><span>마감임박순</span></label>
                        <label class="standard"><input type="radio" name="standard" value="high"><span>목표높은순</span></label>
                        <label class="standard"><input type="radio" name="standard" value="low"><span>목표낮은순</span></label>
                    </div>
                </div>
                <input type="hidden" name="keyword">
            </form>
            <div class="result-ment">검색 결과 총 <span>${listCount}</span> 개의 프로젝트가 있습니다.</div>
            <div class="search-result-area">
                <c:forEach items="${ProjectList}" var="item">
                    <div class="result-item" onclick="location.href='/blank/project?p=${item.no}'">
                        <div class="result-img"><img src="/blank/resources/upload/project/${item.changeName}"></div>
                        <div class="result-category">
                            <div>${item.category}</div>
                            <div>|</div>
                            <div>${item.creator}</div>
                        </div>
                        <div class="result-name">
                            <div class="item-name">${item.title}</div>
                        </div>
                        <div class="result-summary">${item.summary}</div>
                        <div class="result-for">
                            <div class="percent-price">
                                <div class="result-percent">811%</div>
                                <div class="result-price"><span><fmt:formatNumber pattern="###,###,###" value="${item.price}"/></span>원</div>
                            </div>
                            <div class="result-now">1일 남음</div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="search-page-area flex">

                <c:if test="${pageVo.startPage != 1}">
                    <a href="/blank/project/search?p=${pageVo.startPage - 1}&category=${category}&keyword=${keyword}&standard=${standard}"></a>
                </c:if>

                <c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}" >
                    <a href="/blank/project/search?p=${num}&category=${category}&keyword=${keyword}&standard=${standard}">${num}</a>
                </c:forEach>
                
                <c:if test="${pageVo.endPage != pageVo.maxPage}">
                    <a href="/blank/project/search?p=${pageVo.endPage + 1}&category=${category}&keyword=${keyword}&standard=${standard}"></a>
                </c:if>

            </div>

        </div>
        
    </div>
    
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>

</body>
<script>
    /* 기준 누르면 바로 submit */
    $('.standard').click(function() {
        var keyword = '${keyword}';
        console.log(keyword);
        $('input[name=keyword]').val(keyword);
        $('#project-search-form').submit();
    })

    /* 카테고리 누르면 바로 submit */
    $('#category-box').change(function() {
        console.log("this");
        var keyword = '${keyword}';
        $('input[name=keyword]').val(keyword);
        $('#project-search-form').submit();
    })

    $(document).ready(function() {
        console.log($('#category-box option'));
        var standard = '${standard}';
        $.each($('input[name=standard]'), function(index, item) {
            if($(item).val() == standard) {
                $(item).attr("checked", true);
            }
        })
        var category = '${category}';
        $.each($('#category-box option'), function(index, item) {
            if($(item).val() == category) {
                $(item).attr("selected", true);
            }
        })
        var keyword = '${keyword}';
        $('input[name=keyword]').val(keyword);
    })
</script>
</script>
</html>