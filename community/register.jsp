<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>등록 결과</title>
</head>

<body>
    <h1>커뮤니티 글쓰기 결과</h1>
    <div>
        <%
            // 요청으로부터 데이터 받기
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            
            // 파일 업로드 처리
            Part imagePart = request.getPart("image"); // JSP에서 파일 업로드 시 Part 사용
            String imageFileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = application.getRealPath("/") + "uploads";

            // 업로드 디렉토리가 없는 경우 생성
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // 파일 저장
            String imageFilePath = uploadPath + File.separator + imageFileName;
            imagePart.write(imageFilePath);

            // 출력 결과
            if (title != null && content != null) {
        %>
            <p><strong>제목:</strong> <%= title %></p>
            <p><strong>내용:</strong> <%= content %></p>
            <p><strong>업로드된 파일 이름:</strong> <%= imageFileName %></p>
            <p>파일이 성공적으로 <strong>업로드 경로:</strong> <%= imageFilePath %>에 저장되었습니다.</p>
        <%
            } else {
        %>
            <p>폼 데이터가 올바르지 않습니다. 다시 시도해주세요.</p>
        <%
            }
        %>
    </div>
    <a href="community-list.html">목록으로 돌아가기</a>
</body>

</html>
