<%@ page import="cloud.PostDAO, cloud.DBConnection, cloud.Post" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    if (request.getMethod().equalsIgnoreCase("POST")) {

        request.setCharacterEncoding("UTF-8");

        // 입력 값 가져오기
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String user = request.getParameter("user");

        // 새로운 게시글 객체 생성
        Post post = new Post();
        post.setTitle(title);
        post.setContent(content);
        post.setUser(user);

        // DAO로 DB에 추가
        PostDAO postDAO = new PostDAO(DBConnection.getConnection());
        postDAO.createPost(post);

        // 리다이렉트
        response.sendRedirect("postList.jsp");
    }
%>

<form method="post">
    <label>제목: <input type="text" name="title" /></label><br />
    <label>내용: <textarea name="content"></textarea></label><br />
    <label>작성자: <input type="text" name="user" /></label><br />
    <button type="submit">추가</button>
</form>
