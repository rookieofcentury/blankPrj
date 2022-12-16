<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/blank/resources/css/project_post/creatorInfo.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>

    <div class="navi-menu">
        <div class="content-editor">
            <div class="editor-logo">
                <img class="logo-img" src="/blank/resources/images/blank.png" onclick="location.href=''">
                <div><h1>프로젝트 기획</h1></div>
            </div>
            <div class="editor-buttons">
                <div class="buttons-storage">임시저장</div>
                <div class="buttons-request">심사요청</div>
                <div class="buttons-goout"><img src="/blank/resources/images/project/icon_goout.png"></div>
            </div>
        </div>
        <div class="content-menu">
            <div>약관 정보</div>
            <div>기본 정보</div>
            <div>옵션 설계</div>
            <div>창작자 정보</div>
        </div>
    </div>
    <div id="container">
        <div class="content">
            <div class="content-title">
                <div class="title-info">
                    <div>이름</div>
                    <div>창작자 개인이나 팀을 대표할 수 있는 이름을 써주세요.</div>
                </div>
                <div class="title-write">
                    <div><input type="text" placeholder="내용 입력" name="title"></div>
                    <p>40글자 남음</p>
                </div>
            </div>
            <div class="content-category">
                <div class="category-info">
                    <div>대표이미지</div>
                    <div>3MB 이하의 JPG, JPEG, PNG 파일<br>해상도 1200x675 픽셀 이상</div>
                </div>
                <div>
                    <div>등록하기</div>
                </div>
            </div>
            <div class="content-title">
                <div class="title-info">
                    <div>소개</div>
                    <div>창작자님의 이력과 간단한 소개를 써주세요.</div>
                </div>
                <div class="title-write">
                    <div><input type="text" placeholder="내용 입력" name="title"></div>
                    <p>40글자 남음</p>
                </div>
            </div>
            <div class="content-email">
                <div class="email-info">
                    <div>이메일</div>
                    <div>펀딩서비스 이용을 위해 추가 계약이나 약정이 필요할 수 있어요.<br>추가 발송될 전자 약정서를 체결할 이메일을 입력해 주세요.</div>
                </div>
                <div class="email-box">
                    <div class="email-area">
                        <div class="email-write"><input type="text" placeholder="이메일 입력" name="price"></div>
                        <div>
                            <input type="checkbox" id="info-check" name="">
                            <label for="info-check">회원정보와 동일</label>
                        </div>
                    </div>
                    <div>인증하기</div>
                </div>
            </div>
            <div class="content-phone">
                <div class="phone-info">
                    <div>전화번호</div>
                    <div>창작자 본인 명의의 휴대폰 번호를 입력해주세요.</div>
                </div>
                <div class="phone-box">
                    <div class="phone-write"><input type="text" placeholder="내용 입력" name="price"></div>
                    <div>
                        <input type="checkbox" id="email-check" name="">
                        <label for="email-check"> 회원정보와 동일</label>
                    </div>
                </div>
            </div>
            <div class="content-policy">
                <div class="policy-info">
                    <div>정산 정책 확인</div>
                    <div>블랭크의 정산 정책을 반드시 확인해 주세요.</div>
                </div>
                <div class="policy-box">
                    <button id="show">
                        <div class="policy-agree"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16">
                            <path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
                        </svg>확인하기</div></button>
                    <div class="background">
                        <div class="window">
                            <div class="popup">
                            <button id="close">
                                <div>
                                    <strong>이런 순서로 진행돼요</strong>
                                    <ul>
                                        <li>프로젝트가 성공적으로 종료되면 종료일 기준 약 10영업일 이내에 바로정산(1차 정산)이 시작됩니다.</li>
                                        <li>바로정산 단계에서는 최종 금액의 일부가 먼저 지급됩니다.</li>
                                    </ul>
                                    <ol type="1">
                                        <li>최종 결제 금액이 1,000만 원 미만<br>
                                            최종 결제 금액에서 블랭크 중개 수수료, 결제(카드사 수수료 등) 수수료를 제외한 금액의 80%가 지급됩니다.
                                        </li>
                                        <li>최종 결제 금액이 1,000만 원 이상<br>
                                            최종 결제 금액에서 블랭크 중개 수수료, 결제(카드사 수수료 등) 수수료를 제외한 금액의 60%가 지급됩니다.
                                        </li>
                                    </ol>
                                    <div>리워드 발송과 펀딩금 반환이 완료되면 최종 펀딩 금액이 확정됩니다.<br>
                                    최종 펀딩 금액 확정 5영업일 이내에 최종정산(2차 정산)이 진행됩니다.</div>
                                    <br>
                                    <strong>이렇게 알려 드려요</strong>
                                    <ul>
                                        <li>바로정산과 최종정산이 시작되면 정산 내역서와 함께 정산에 대한 안내가 메일로 발송됩니다.</li>
                                    </ul>
                                </div>
                                <label>정산 정책을 확인하였습니다.</label>
                                <div>
                                    <input type="checkbox" id="policy-check" name="">
                                    <label for="policy-check"> 회원정보와 동일</label>
                                    팝업닫기</div>
                            </button>
                            </div>
                        <div>
                            <div></div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-calculate">
                <div class="calculate-info">
                    <div>정산 계좌정보</div>
                    <div>펀딩 성공시 정산금을 수령할 계좌정보를 입력해 주세요.</div>
                </div>
                <div class="calculate-write">
                    <div><input type="text" placeholder="은행명 입력" name="bank"></div>
                    <div><input type="text" placeholder="계좌번호 입력" name="accountNumber"></div>
                    <p>특수 문자(-)없이 숫자만 입력해 주세요</p>
                    <div><input type="text" placeholder="예금주명 입력" name="depositor"></div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function show () {
            document.querySelector(".background").className = "background show";
        }

        function close () { 
            document.querySelector(".background").className = "background";
        }

        document.querySelector("#show").addEventListener('click', show);
        document.querySelector("#close").addEventListener('click', close);
    </script>
</body>
</html>