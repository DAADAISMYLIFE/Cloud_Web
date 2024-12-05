<%@ include file="/Cloud_Web/includes/sessionCheck.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="cloud.PostDAO, cloud.DBConnection, cloud.Post" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티</title>
    <link rel="stylesheet" href="/Cloud_Web/styles/community_styles.css">
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
        String postId = request.getParameter("id");
        String sessionUserId = (String) session.getAttribute("userId");
        Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
        if (postId != null && sessionUserId != null) {
            try {
                int id = Integer.parseInt(postId);
                PostDAO postDAO = new PostDAO(DBConnection.getConnection());
                Post post = postDAO.getPostById(id);

                if (post != null) {
                    if (request.getMethod().equalsIgnoreCase("POST")) {
                        request.setCharacterEncoding("UTF-8");
                        // 작성자이거나 관리자인 경우 삭제 처리
                        if (post.getUserId().equals(sessionUserId) || (isAdmin != null && isAdmin)) {
                            postDAO.deletePost(id);
                            response.sendRedirect("list.jsp");
                            return; // 리다이렉트 이후 추가 렌더링 방지
                        }
                    }
    %>

    <div class="post-details">
        <h2 class="post-title"><%= post.getTitle() %></h2>
        <div class="post-meta">
            <p><strong>작성자:</strong> <%= post.getUser() %></p>
            <p><strong>작성일:</strong> <%= post.getCreatedAt() %></p>
        </div>
        <hr>
        <div class="post-content">
            <p><%= post.getContent() %></p>
        </div>
        <button onclick="history.back()">뒤로가기</button>
        <%
            // 작성자이거나 관리자일 경우 삭제 버튼 표시
            if (Boolean.TRUE.equals(session.getAttribute("isAdmin")) || post.getUserId().equals(sessionUserId)) {
        %>
        <form method="post" onsubmit="return confirmDelete();">
            <button type="submit" class="button_delete">글 삭제</button>
        </form>
        <% } %>
        <%
                } else {
        %>
            <p>해당 게시글을 찾을 수 없습니다.</p>
        <%
                    }
                } catch (NumberFormatException e) {
        %>
            <p>잘못된 사용자 정보가 전달되었습니다.</p>
        <%
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
        %>
            <p>잘못된 요청입니다. 게시글 ID 또는 사용자 정보가 없습니다.</p>
        <%
            }
        %>
        </div>
    </div>
    </main>
</body>
</html>
