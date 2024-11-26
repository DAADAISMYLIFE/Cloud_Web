<%@ page import="cloud.PostDAO, cloud.DBConnection, cloud.Post" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    if (request.getMethod().equalsIgnoreCase("POST")) {

        request.setCharacterEncoding("UTF-8");

        // 입력 값 가져오기
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        // TODO : 로그인된 유저의 NICKNAME 들고 오기
        String user = "dong-eui";//request.getParameter("user");

        // 새로운 게시글 객체 생성
        Post post = new Post();
        post.setTitle(title);
        post.setContent(content);
        post.setUser(user);

        // DAO로 DB에 추가
        PostDAO postDAO = new PostDAO(DBConnection.getConnection());
        postDAO.createPost(post);

        // 리다이렉트
        response.sendRedirect("list.jsp");
    }
%>


<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 글쓰기</title>
    <link rel="stylesheet" href="/Cloud_Web/styles/community_styles.css"> <!-- CSS 파일 링크 -->
</head>

<body>
    <%@ include file = "/Cloud_Web/default.jsp" %>
    <main>
        <h3>커뮤니티</h3>
        <form id="community-form" method="post">
            <input type="text" name="title" value="" placeholder="제목을 입력하세요" required>
            <br>
            <textarea rows="20" cols="50" name="content" value="" placeholder="내용을 입력하세요" required></textarea>
            <br>
            <div class="button-container">
                <button type="submit" class="button_submit">등록</button>
                <button type="reset" class="button_cancle">취소</button>
            </div>
        </form>
    </main>
</body>

</html>
