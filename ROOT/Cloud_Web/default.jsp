<%@ page contentType="text/html; charset=UTF-8" %>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>웹개발 홈페이지</title>
    <link rel="stylesheet" href="/Cloud_Web/styles/nav4_styles.css">
</head>

<body>
    <header>
        <div class="header-container">
            <div id="logo">
                <a href="/Cloud_Web/index.jsp"><img src="/Cloud_Web/images/google.png" alt="로고"></a>
            </div>
            <div id="auth">
            <!--TODO : 로그인 시 사라지고 자기 이름만 표시-->
            <% if (1 == 2 ) { %>
                <a href="/Cloud_Web/login/loginPage.jsp" id="login">로그인</a>
                <a href="/Cloud_Web/signup/signup.jsp" id="signup">회원가입</a>
            <% } else { %>
                <a href="/Cloud_Web/login/loginPage.jsp" id="login">강순우</a>
            <% } %>
                
            </div>
        </div>
    </header>

    <nav id="nav1">
        <ul class="nav-menu">
            <li><a href="/Cloud_Web/introduce.jsp">동아리 소개</a></li>
            <li><a href="/Cloud_Web/apply/apply.jsp">가입신청</a></li>
            <li><a href="/Cloud_Web/activity/list.jsp">활동내역</a></li>
            <li><a href="/Cloud_Web/notification/list.jsp">공지사항</a></li>
            <li><a href="/Cloud_Web/community/list.jsp">커뮤니티</a></li>
            <li><a href="http://223.130.154.161:8080/openai.html">OpenAI</a></li>
        </ul>
    </nav>
</body>

</html>
