<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="cloud.ActivityDAO, cloud.Activity, cloud.DBConnection" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>활동내역</title>
    <link rel="stylesheet" href="/Cloud_Web/styles/community_styles.css"> <!-- CSS 파일 링크 -->
</head>

<body>
    <%@ include file="/Cloud_Web/default.jsp" %>

    <main>
        <article>
            <div class="activity">
                <table>
                    <caption>활동내역 게시글 리스트</caption>
                    <colgroup>
                        <col style="width:60%">
                        <col style="width:40%">
                    </colgroup>

                    <thead>
                        <tr>
                            <th scope="col">내용</th>
                            <th scope="col">사진</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            // 데이터베이스에서 활동 내역 가져오기
                            ActivityDAO activityDAO = new ActivityDAO(DBConnection.getConnection());
                            List<Activity> activities = activityDAO.getAllActivitys();

                            // 데이터가 있는 경우 테이블에 출력
                            if (activities != null && !activities.isEmpty()) {
                                for (Activity activity : activities) {
                        %>
                        <tr class="ub-content" onclick="window.location='detail.jsp?id=<%= activity.getId() %>'">
                            <td class="activity_text">
                                <div class="activity_title"><%= activity.getTitle() %></div>
                                <div class="activity_content">
                                    <%= activity.getContent().length() > 100 
                                        ? activity.getContent().substring(0, 100) + "..." 
                                        : activity.getContent() %>
                                </div>
                            </td>
                            <td class="activity_image">
                                <% if (activity.getImagePath() != null && !activity.getImagePath().isEmpty()) { %>
                                    <img src="<%= activity.getImagePath() %>" alt="Activity Image">
                                <% } else { %>
                                    <div class="placeholder-image"></div>
                                <% } %>
                            </td>
                        </tr>
                        <%      }
                            } else { %>
                        <tr>
                            <td colspan="2" style="text-align: center;">활동 내역이 없습니다.</td>
                        </tr>
                        <% } %>
                        </div>
                    </tbody>
                </table>
            </div>

            <div class="bottom_elements">
                <div class="bottom_paging_box">
                    <em>1</em>
                    <a href="page=2">2</a>
                    <a href="page=3">3</a>
                    <a href="page=4">4</a>
                    <a href="page=5">5</a>
                    <a href="page=85691">다음</a>
                    <a href="page=85691">끝</a>
                </div>
            </div>
        </article>
    </main>
</body>

</html>
