<%-- <%@ page import="cloud.PostDAO, cloud.DBConnection, cloud.Post" %> --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    if (request.getMethod().equalsIgnoreCase("POST")) {

        request.setCharacterEncoding("UTF-8");

        // 입력 값 가져오기
        String title = request.getParameter("user_id");
        String content = request.getParameter("user_name");
        String user = "dong-eui";//request.getParameter("user");
        out.print(title);
        out.print(content);
        out.print(user);

        // 새로운 게시글 객체 생성
        // Post post = new Post();
        // post.setTitle(title);
        // post.setContent(content);
        // post.setUser(user);
        // // DAO로 DB에 추가
        // PostDAO postDAO = new PostDAO(DBConnection.getConnection());
        // postDAO.createPost(post);

        // 리다이렉트
        // response.sendRedirect("list.jsp");
    }
%>

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입</title>
        <link rel="stylesheet" href="/Cloud_Web/styles/membership_styles.css">
    </head>

    <%@ include file="/Cloud_Web/default.jsp" %>

        <body>
            <div class="wrapper">
                <div class="container">
                    <h3>회원가입</h3>
                    <form method="post" id="login_form">
                        <div class="user_input">
                            <!-- <label for="user_name">이름 : </label> -->
                            <input type="text" name="user_name" value="" placeholder="이름" required />
                            <input type="date" name="user_birth" value="" required />
                            <input type="text" name="user_id" value="" placeholder="사용할 ID" required />
                            <input type="password" name="user_pw" value="" placeholder="사용할 PASSWORD" required />
                        </div>
                        <div class="submit_button">
                            <input type="submit" value="가입하기">
                            <input type="reset" value="취소하기">
                        </div>
                    </form>
                </div>
            </div>
        </body>

    </html>