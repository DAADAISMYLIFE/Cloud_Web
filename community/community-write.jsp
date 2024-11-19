<%@ page contentType="text/html; charset=UTF-8" %>
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
        <form id="community-form" method="get" action="register.jsp" enctype="multipart/form-data">
            <input type="text" name="title" value="" placeholder="제목을 입력하세요" required>
            <br>
            <textarea rows="20" cols="50" name="content" value="" placeholder="내용을 입력하세요" required></textarea>
            <br>
            <input type="file" name="image" value="" placeholder="업로드할 이미지를 입력하세요">
            <br>
            <div class="button-container">
                <button type="submit" class="button_submit">등록</button>
                <button type="reset" class="button_cancle">취소</button>
            </div>
        </form>
    </main>
</body>

</html>