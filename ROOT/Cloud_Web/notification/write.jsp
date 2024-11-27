<%@ include file="/Cloud_Web/includes/sessionAdminCheck.jsp" %>
<%@ page import="cloud.NotiDAO, cloud.DBConnection, cloud.Noti" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*, com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%
if (request.getMethod().equalsIgnoreCase("POST")) {
    request.setCharacterEncoding("UTF-8");

    // 업로드 파일 저장 경로 설정
    String uploadPath = application.getRealPath("/Cloud_Web/uploads");
    File uploadDir = new File(uploadPath);
    if (!uploadDir.exists()) {
        uploadDir.mkdir(); // 디렉토리 생성
    }

    String title = null;
    String content = null;
    String user = "dong-eui";
    String imagePath = null;

    try {
        // MultipartRequest 객체 생성 (cos.jar)
        MultipartRequest multi = new MultipartRequest(
            request,
            uploadPath, // 저장 경로
            10 * 1024 * 1024, // 업로드 파일 최대 크기 (10MB)
            "UTF-8", // 인코딩
            new DefaultFileRenamePolicy() // 파일 이름 중복 시 처리
        );

        // 폼 필드 데이터 가져오기
        title = multi.getParameter("title");
        content = multi.getParameter("content");

        // 업로드된 파일 처리
        File uploadedFile = multi.getFile("image");
        if (uploadedFile != null) {
            String fileName = uploadedFile.getName();
            imagePath = "/Cloud_Web/uploads/" + fileName; // DB에 저장될 파일 경로
        }

        // 데이터베이스에 저장
        Noti noti = new Noti();
        noti.setTitle(title);
        noti.setContent(content);
        noti.setUser(user);
        noti.setImagePath(imagePath); // 이미지 경로 추가

        NotiDAO notiDAO = new NotiDAO(DBConnection.getConnection());
        notiDAO.createNoti(noti);

        // 리다이렉트
        response.sendRedirect("list.jsp");

    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="/Cloud_Web/styles/community_styles.css"> <!-- CSS 파일 링크 -->
</head>

<body>
    <%@ include file = "/Cloud_Web/default.jsp" %>
    <main>
        <h3>공지사항</h3>
        <form id="community-form" method="post" enctype="multipart/form-data">
            <input type="text" name="title" placeholder="제목을 입력하세요" required>
            <br>
            <textarea rows="20" cols="50" name="content" placeholder="내용을 입력하세요" required></textarea>
            <br>
            <input type="file" name="image" accept="image/*">
            <br>
            <div class="button-container">
                <button type="submit" class="button_submit">등록</button>
                <button type="reset" class="button_cancle">취소</button>
            </div>
        </form>
    </main>
</body>

</html>
