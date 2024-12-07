<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="cloud.User, cloud.DBConnection, cloud.UserDAO" %>

<%  
    Boolean isMember2 = null;
    if(session!=null && session.getAttribute("userId")!=null){
        UserDAO userDAO = new UserDAO(DBConnection.getConnection());
        User user = userDAO.getUserByUserId(session.getAttribute("userId").toString());
        isMember2 = user.getMember();
    }
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동코동락 소개</title>
    <link rel="stylesheet" href="/Cloud_Web/styles/introduce_styles.css">
    <script>
        function isMember(event){
            var isMember="<%=isMember2%>";
            if(isMember=="true"){
                alert("이미 가입이 완료되었습니다.");
                event.preventDefault();
            }
            else if(isMember==null){
                alert("로그인 후 이용해주세요.");
                event.preventDefault();
            }
        }
    </script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
    <%@ include file="/Cloud_Web/default.jsp" %>
    <main>
        <article>
            <h1>동아리 회원 모집</h1>
            <p>우리 코딩 동아리는 코딩 테스트 준비를 위한 스터디 그룹입니다. 다양한 프로그래밍 언어를 익히고, 실력을 향상시키기 위해 함께 노력합니다.</p>
            
            <h2><i class="fas fa-user-friends"></i> 동코동락이란?</h2>
            <div style="background-color: #e3f2fd; padding: 20px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);">
                <p style="font-size: 18px; color: #0d47a1; font-weight: bold;">"동코동락"은 <strong>동거동락</strong>과 <strong>코딩</strong>의 합성어로, 함께 살고 함께 기뻐하며 코딩의 즐거움을 나누자는 의미를 담고 있습니다. 우리 동아리는 서로의 실력을 키우고, 코딩의 즐거움을 함께 나누며 성장하는 공간입니다.</p>
            </div>
            
            <h2><i class="fas fa-cogs"></i> 우리는 어떤 활동을 하나요?</h2>
            <p>주 1회 1:1 난이도 조정 세션을 통해 코딩 테스트 연습 문제를 풀며 실력을 쌓아갑니다.</p>



            <h2><i class="fas fa-user-friends"></i> 가입 안내</h2>
            <p>코딩에 관심 있는 누구나 환영합니다! 아래의 조건을 확인하고 신청해주세요.</p>
            <ul class="intro-list">
                <li><i class="fas fa-check-circle"></i> 동아리에 관심 있는 학생</li>
                <li><i class="fas fa-check-circle"></i> 활동에 열정적으로 참여할 수 있는 분</li>
                <li><i class="fas fa-check-circle"></i> 코딩에 대한 관심이 있는 분</li>
            </ul>

            <h2><i class="fas fa-info-circle"></i> 모집 내용</h2>
            <p>가입 신청 후 본인의 실력을 확인하고 단톡방에 초대됩니다. 다양한 목표를 가진 분들이 함께 모여 서로의 실력을 높여가는 시간을 가질 예정입니다.</p>

            <h2><i class="fas fa-tasks"></i> 활동 내용</h2>
            <ul class="intro-list">
                <li><i class="fas fa-pencil-alt"></i> 백준 연습 문제 풀이 및 피드백</li>
                <li><i class="fas fa-comments"></i> 팀원 간의 코드 리뷰 및 스터디</li>
                <li><i class="fas fa-calendar-alt"></i> 정기적인 모임 및 세미나 진행</li>
            </ul>

            <p>코딩에 대한 열정을 가지고 함께 성장해 나갈 사람들을 기다립니다!</p>

            <h2><i class="fas fa-sign-in-alt"></i> 가입 방법</h2>
            <p>가입 신청은 버튼을 통해 신청해 주세요.</p>
            <a href="/Cloud_Web/apply/apply.jsp" class="apply-btn" onclick="isMember(event)">가입 신청하기</a>
            <br>
            <br>
        </article>
    </main>
</body>

</html>
