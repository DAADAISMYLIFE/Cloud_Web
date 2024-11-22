<%@ page import="java.util.List" %>
<%@ page import="cloud.PostDAO, cloud.DBConnection, cloud.Post" %>
<%@ page contentType="text/html; charset=UTF-8" %>


<%
    // DB 연결 및 DAO 생성
    PostDAO postDAO = new PostDAO(DBConnection.getConnection());
    List<Post> posts = postDAO.getAllPosts();
%>

<table border="1">
    <tr>
        <th>ID</th>
        <th>제목</th>
        <th>내용</th>
        <th>작성자</th>
        <th>작성일</th>
    </tr>
    <%
        for (Post post : posts) {
    %>
        <tr>
            <td><%= post.getId() %></td>
            <td><%= post.getTitle() %></td>
            <td><%= post.getContent() %></td>
            <td><%= post.getUser() %></td>
            <td><%= post.getCreatedAt() %></td>
        </tr>
    <%
        }
    %>
</table>
