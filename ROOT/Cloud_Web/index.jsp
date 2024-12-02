<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="cloud.PostDAO, cloud.Post, cloud.NotiDAO, cloud.Noti, cloud.ActivityDAO, cloud.Activity, cloud.DBConnection" %>
<%@ page import="java.util.List" %>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>웹개발 동아리 홈페이지</title>
    <link rel="stylesheet" href="/Cloud_Web/styles/nav4_styles.css">
    <link rel="stylesheet" href="/Cloud_Web/styles/introduce_styles.css">
    <style>
        .flex-container {
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
        }

        .flex-item {
            flex: 1;
            margin: 0 10px;
            padding: 20px;
            background-color: #ffffff; /* 흰색 배경 */
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s; /* 호버 효과를 위한 트랜지션 */
        }

        .flex-item:hover {
            transform: translateY(-5px); /* 호버 시 약간 위로 이동 */
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 강화 */
        }

        h3 {
            color: #0d47a1; /* 제목 색상 */
            border-bottom: 2px solid #e3f2fd; /* 제목 아래 선 추가 */
            padding-bottom: 10px;
        }

        ul {
            list-style-type: none; /* 기본 리스트 스타일 제거 */
            padding: 0;
        }

        .flex-item li {
            margin: 10px 0; /* 각 항목 간격 */
        }

        .link {
            text-decoration: none;
            color: #0d47a1; /* 링크 색상 */
            font-weight: bold; /* 링크 두껍게 */
            padding: 10px;
            border-radius: 5px; /* 링크 배경을 둥글게 */
            transition: background-color 0.3s; /* 배경색 트랜지션 */
        }

        .link:hover {
            background-color: #e3f2fd; /* 호버 시 배경색 변경 */
            text-decoration: underline; /* 호버 시 밑줄 추가 */
        }

        .banner-container {
            position: relative;
            overflow: hidden; /* 컨테이너 내에서만 이미지가 보이도록 설정 */
        }
    </style>
    <script>
        let currentBanner = 0;
        const banners = [
            "/Cloud_Web/images/coding_banner1.jpg",
            "/Cloud_Web/images/coding_banner2.jpg"
        ];

        function changeBanner() {
            const bannerElements = document.querySelectorAll(".banner");
            bannerElements[currentBanner].classList.remove("active"); // 현재 배너 숨기기

            currentBanner = (currentBanner + 1) % banners.length; // 다음 배너로 전환

            bannerElements[currentBanner].classList.add("active"); // 새로운 배너 보이기
        }

        // 배너 요소 생성
        const bannerContainer = document.querySelector(".banner-container");
        banners.forEach((src, index) => {
            const img = document.createElement("img");
            img.src = src;
            img.classList.add("banner");
            if (index === 0) img.classList.add("active"); // 첫 번째 배너 활성화
            bannerContainer.appendChild(img);
        });

        setInterval(changeBanner, 10000); // 10초마다 배너 변경
    </script>
</head>

<body>
    <%@ include file = "/Cloud_Web/default.jsp" %>
    
    <main>
        <section class="intro">
            <div class="banner-container">
                <img id="banner" src="/Cloud_Web/images/coding_banner1.jpg" alt="코딩 동아리 배너" style="width: 100%; height: auto; border-radius: 10px; margin-bottom: 20px;">
            </div>
            <p>우리 코딩 동아리는 코딩 테스트 준비를 위한 스터디 그룹입니다. 다양한 프로그래밍 언어를 익히고, 실력을 향상시키기 위해 함께 노력합니다.</p>
        </section>

        <section class="latest">
            <h2>최근 소식</h2>
            <div class="flex-container">
                <div class="flex-item">
                    <h3>최근 활동내역</h3>
                    <ul>
                        <%
                        // 최신 활동 내역 가져오기
                        ActivityDAO activityDAO = new ActivityDAO(DBConnection.getConnection());
                        List<Activity> latestActivities = activityDAO.getLatestActivies(5); // 최신 글 5개 가져오기
                        for (Activity activity : latestActivities) {
                        %>
                            <li>
                                <a class="link" href="/Cloud_Web/activity/detail.jsp?id=<%= activity.getId() %>">
                                    <%= activity.getTitle() %>
                                </a>
                            </li>
                        <%
                        }
                        %>
                    </ul>
                </div>
                <div class="flex-item">
                    <h3>최근 공지사항</h3>
                    <ul>
                        <%
                            // 최신 공지사항 가져오기
                            NotiDAO notiDAO = new NotiDAO(DBConnection.getConnection());
                            List<Noti> latestNotis = notiDAO.getLatestNotis(5); // 최신 공지사항 5개 가져오기
                            for (Noti noti : latestNotis) {
                        %>
                            <li>
                                <a class="link" href="/Cloud_Web/notification/detail.jsp?id=<%= noti.getId() %>">
                                    <%= noti.getTitle() %>
                                </a>
                            </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
                <div class="flex-item">
                    <h3>최근 Q&A</h3>
                    <%
                        // 최신 게시글 가져오기
                        PostDAO postDAO = new PostDAO(DBConnection.getConnection());
                        List<Post> latestPosts = postDAO.getLatestPosts(5); // 최신 게시글 5개 가져오기
                        for (Post post : latestPosts) {
                    %>
                        <li>
                            <a class="link" href="/Cloud_Web/community/detail.jsp?id=<%= post.getId() %>">
                                <%= post.getTitle() %>
                            </a>
                        </li>
                    <%
                        }
                    %>
                </div>
            </div>
        </section>

        <section class="call-to-action">
            <h2>가입 안내</h2>
            <p><a href="/Cloud_Web/apply/apply.jsp" class="apply-btn">가입 신청하기</a></p>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 웹개발 동아리. 모든 권리 보유.</p>
    </footer>
</body>

</html>