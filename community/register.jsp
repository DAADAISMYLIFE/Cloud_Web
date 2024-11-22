<%@ page import="cloud.Post" %>
<%@ page import="cloud.PostDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>
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
    response.sendRedirect("list.jsp"); 
}
%>