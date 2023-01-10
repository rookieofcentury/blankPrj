<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <label class="standard"><input type="radio" name="standard" value="newOrder"><span>최신등록순</span></label>
                        <label class="standard"><input type="radio" name="standard" value="endDate"><span>마감임박순</span></label>
                        <label class="standard"><input type="radio" name="standard" value="high"><span>목표높은순</span></label>
                        <label class="standard"><input type="radio" name="standard" value="low"><span>목표낮은순</span></label>
                    </div>
                </div>
            </form>
            <div class="result-ment">검색 결과 총 <span>${listCount}</span> 개의 프로젝트가 있습니다.</div>
            <div class="search-result-area">
                <div class="result-item">
                    <div class="result-img"><img src="/blank/resources/upload/goods/${item.thumbnail[0]}" alt="alt"></div>
                    <div class="result-category">
                        <div>카테고리${item.category}</div>
                        <div>|</div>
                        <div>창작자${item.creator}</div>
                    </div>
                    <div class="result-name">
                        <div class="item-name">[메이플스토리] 귀염보스 몬스터들이 다시 돌아왔다!무드등,키링,그립톡까지!${item.title}</div>
                    </div>
                    <div class="result-summary">메이플스토리 몬스터들이 돌아왔다! 더 강력하고 새로운 귀여움으로 무장한 몬스터들의 심장폭격! [버섯집무드등]&[주스워터볼키링]에 이어 [워터볼그립톡]까지!!</div>
                    <div class="result-for">
                        <div class="percent-price">
                            <div class="result-percent">811%</div>
                            <div class="result-price"><span>${item.price}3,119,000</span>원</div>
                        </div>
                        <div class="result-now">1일 남음</div>
                    </div>
                </div>
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
        $('#goods-search-form').submit();
    })

    /* 카테고리 누르면 바로 submit */
    $('#category-box').change(function() {
        console.log("this");
        var keyword = '${keyword}';
        $('input[name=keyword]').val(keyword);
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
</script>
</html>