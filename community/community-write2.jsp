<%@ page import="cloud.Post" %>
<%@ page import="cloud.PostDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>
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
        <%
            // 폼에서 데이터 처리
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String user = "작성자"; 
            String createdAt = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()); // 현재 날짜

            if (title != null && content != null) {
                // 게시물 객체 생성
                Post newPost = new Post(0, title, content, user, createdAt); 
                
                PostDAO postDAO = new PostDAO();
                postDAO.addPost(newPost); // 게시물 추가

                // 추가 후에 성공 메시지 또는 다른 페이지로 리다이렉트
                response.sendRedirect("community-list.jsp"); 
            }
        %>
        <form id="community-form" method="post" action="register.jsp" enctype="multipart/form-data">
            <input type="text" name="title" value="" placeholder="제목을 입력하세요" required>
            <br>
            <textarea rows="20" cols="50" name="content" placeholder="내용을 입력하세요" required></textarea>
            <br>
            <input type="file" name="image" placeholder="업로드할 이미지를 입력하세요">
            <br>
            <div class="button-container">
                <button type="submit" class="button_submit">등록</button>
                <button type="reset" class="button_cancle">취소</button>
            </div>
        </form>
    </main>
</body>

</html>

