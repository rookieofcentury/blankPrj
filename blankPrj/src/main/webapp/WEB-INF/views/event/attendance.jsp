<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Blank</title>
<link rel="stylesheet" href="/blank/resources/css/event/attendance.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

    <div class="wrap">

        <div class="container">

            <div class="info">
                <div class="inner">
                    <div class="date-area">
                        <div><img src="http://2percent.kr/modules/attendance/skins/xecenter/img/attendance5.png" alt="att-img"> &nbsp; 출석부</div>
                        <div>
                            <div>오늘 날짜</div>
                            <div class="today-date"></div>
                            <div class="today-day"></div>
                        </div>
                    </div>
                    <div class="commonpoint-area">
                        <div>
                            <div>출석하고 포인트 받으세요!</div>
                            <div>출석 시 기본 포인트 <span id="attPoint">10</span> 포인트 획득합니다.</div>
                        </div>
                        <div id="submit-btn">출석하기</div>
                    </div>
                    <div class="client-area">
                        <div class="client-profile"><img src="" alt=""></div>
                        <div class="client-info">
                            <div class="client-name">
                                <span id="name">송혜은</span>
                                <span> 님</span>
                            </div>
                            <div class="client-point">
                                <div>포인트</div>
                                <div>
                                    <span id="point">4839</span>
                                    <span>&nbsp;P</span>
                                </div>
                            </div>
                            <div class="client-attday">
                                <div>총출석</div>
                                <div>
                                    <span id="attday">20</span>
                                    <span>&nbsp;일</span>
                                </div>
                            </div>
                        </div>
                        <div class="point-area">
                            <div>
                                <div class="bold">연간 개근</div>
                                <div>
                                    <span>+</span>
                                    <span>45,000</span>
                                    <span>P</span>
                                </div>
                            </div>
                            <div>
                                <div class="bold">월간 개근</div>
                                <div>
                                    <span>+</span>
                                    <span>3,000</span>
                                    <span>P</span>
                                </div>
                            </div>
                            <div>
                                <div class="bold">주간 개근</div>
                                <div>
                                    <span>+</span>
                                    <span>500</span>
                                    <span>P</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-bottom">
                <table id="calendar">
                  <thead>
                    <tr class="btn-wrap clearfix">
                      <td>
                        <label id="prev" onclick="prev();">
                            &#60;
                        </label>
                      </td>
                      <td id="current-year-month" colspan="5"></td>
                      <td>
                        <label id="next" onclick="next();">
                            &#62;
                        </label>
                      </td>
                    </tr>
                    <tr>
                        <th class = "sun">Sun</th>
                        <th>Mon</th>
                        <th>Tue</th>
                        <th>Wed</th>
                        <th>Thu</th>
                        <th>Fri</th>
                        <th>Sat</th>
                      </tr>
                  </thead>
                  <tbody id="calendar-body" class="calendar-body"></tbody>
                </table>
            </div>
        </div>

    </div>
    
</body>
<script src="/blank/resources/js/event/attendance.js"></script>
</html>