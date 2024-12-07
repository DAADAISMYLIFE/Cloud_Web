<%@ include file="/Cloud_Web/includes/sessionCheck.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="cloud.ActivityDAO, cloud.DBConnection, cloud.Activity" %>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="/Cloud_Web/styles/community_styles.css"> <!-- CSS 파일 링크 -->
    <script>
        function confirmDelete() {
            return confirm("정말 삭제하시겠습니까? 삭제된 글은 복구할 수 없습니다.");
        }
    </script>
</head>
<body>
    <%@ include file="/Cloud_Web/default.jsp" %>
    <main>
    <%
        // 게시글 ID를 request 파라미터에서 가져옴
        String activityId = request.getParameter("id");
        if (activityId != null) {
            int id = Integer.parseInt(activityId);
            ActivityDAO activityDAO = new ActivityDAO(DBConnection.getConnection()); 

            // getActivityById 메서드 호출해서 게시글 가져오기
            Activity activity = activityDAO.getActivityById(id);
             
            if (activity != null) {
                if (request.getMethod().equalsIgnoreCase("POST")) {
                        request.setCharacterEncoding("UTF-8");
                        // 작성자이거나 관리자인 경우 삭제 처리
                        if (Boolean.TRUE.equals(session.getAttribute("isAdmin"))) {
                            activityDAO.deleteActivity(id);
                            response.sendRedirect("list.jsp");
                            return; // 리다이렉트 이후 추가 렌더링 방지
                        }
                    }
    %>
    <div class="activity-details">
            <h2 class="activity-title"><%= activity.getTitle() %></h2>
            <div class="activity-meta">
            <p><strong>작성자:</strong> <%= activity.getUser() %></p>
            <p><strong>작성일:</strong> <%= activity.getCreatedAt() %></p>
            </div>
            <hr>
            <div class="activity-content">
            <pre><%= activity.getContent() %></pre>
            <div class="activity-img">
            <% if (activity.getImagePath() != null && !activity.getImagePath().isEmpty()) { %>
            <p>
                <img src="<%= activity.getImagePath() %>" alt="Uploaded Image" style="max-width: 100%;">
            </p>
            </div>
            <% } %>           
            </div>
            <button onclick="history.back()">뒤로가기</button>
            <%
                // 작성자이거나 관리자일 경우 삭제 버튼 표시
                if (Boolean.TRUE.equals(session.getAttribute("isAdmin"))) {
            %>
            <form method="post" onsubmit="return confirmDelete();">
                <button type="submit" class="button_delete">글 삭제</button>
            </form>
            <% } %>
    </div>
    <% } else { %>
            <p>해당 공지사항을 찾을 수 없습니다.</p>
    <%
        }}
    %>    
    </main>
</body>
</html>
