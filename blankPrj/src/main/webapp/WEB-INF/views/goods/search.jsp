<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blank</title>
<link rel="stylesheet" href="/blank/resources/css/goods/search.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

    <%@ include file = "/WEB-INF/views/common/header.jsp" %>
    
    <div class="wrap">

        <div class="container">
            
            <form action="/blank/goods/search" method="get" id="goods-search-form">
                <div class="search-area">
                    <div class="keyword-category">
                        <div class="goods-search-box"><input type="text" name="goodsKeyword" value="${keyword}"><button class="material-symbols-outlined">search</button></div>
                        <select name="category" id="category-box">
                            <option value="" selected>== 선택 ==</options>
                            <option value="1">리빙/가전</option>
                            <option value="2">패션잡화</option>
                            <option value="3">문구류</option>
                            <option value="4">오피스</option>
                            <option value="5">디지털</option>
                        </select>
                    </div>
                    <div class="standard-area">
                        <label class="standard"><input type="radio" name="standard" value="new"><span>최신순</span></label>
                        <label class="standard"><input type="radio" name="standard" value="high"><span>가격높은순</span></label>
                        <label class="standard"><input type="radio" name="standard" value="low"><span>가격낮은순</span></label>
                    </div>
                </div>
            </form>
            <div class="result-ment">검색 결과 총 <span>${listCount}</span> 개의 굿즈가 있습니다.</div>
            <div class="search-result-area">
                <c:forEach items="${goodsList}" var="item">
                    <div class="result-item">
                        <div class="result-img"><img src="/blank/resources/upload/goods/${item.thumbnail[0]}" alt="alt"></div>
                        <div class="result-category">${item.category}</div>
                        <div class="result-name">
                            <div class="item-name">${item.name}</div>
                            <div><span>${item.price}</span> 원</div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="search-page-area flex">

                <c:if test="${pageVo.startPage != 1}">
                    <a href="/blank/goods/search?p=${pageVo.startPage - 1}&category=${category}&keyword=${keyword}&standard=${standard}"></a>
                </c:if>

                <c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}" >
                    <a href="/blank/goods/search?p=${num}&category=${category}&keyword=${keyword}&standard=${standard}">${num}</a>
                </c:forEach>
                
                <c:if test="${pageVo.endPage != pageVo.maxPage}">
                    <a href="/blank/goods/search?p=${pageVo.endPage + 1}&category=${category}&keyword=${keyword}&standard=${standard}"></a>
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
        $('input[name=goodsKeyword]').val(keyword);
        $('#goods-search-form').submit();
    })

    /* 카테고리 누르면 바로 submit */
    $('#category-box option').click(function() {
        console.log("this");
        var keyword = '${keyword}';
        $('input[name=goodsKeyword]').val(keyword);
        $('#goods-search-form').submit();
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
    })
</script>
</html>