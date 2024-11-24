<%@ page import="java.util.List" %>
<%@ page import="cloud.PostDAO, cloud.DBConnection, cloud.Post" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% // DB 연결 및 DAO 생성 
    PostDAO postDAO = new PostDAO(DBConnection.getConnection()); 
    List<Post> posts = postDAO.getAllPosts();
%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 글쓰기</title>
    <link rel="stylesheet" href="/Cloud_Web/styles/community_styles.css"> <!-- CSS 파일 링크 -->
</head>

<body>
    <%@ include file="/Cloud_Web/default.jsp" %>
        <main>
            <article>
                <div>
                    <table>
                        <caption>커뮤니티 게시글 리스트</caption>
                        <colgroup>
                            <col style="width:7%">
                            <col>
                            <col style="width:18%">
                            <col style="width:20%">
                        </colgroup>

                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">제목</th>
                                <th scope="col">글쓴이</th>
                                <th scope="col">작성일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (posts.size() == 0) {%>
                                <tr>
                                   <td colspan="4">아직 등록된 공지사항이 없습니다.</td>
                                </tr>
                            <% } else { %>
                            <% for (Post post : posts) { %>
                                <tr>
                                    <td>
                                        <%= post.getId() %>
                                    </td>
                                    <td>
                                        <a href="detail.jsp?id=<%= post.getId() %>">
                                        <%= post.getTitle() %>
                                        </a>
                                    </td>
                                    <td>
                                        <%= post.getUser() %>
                                    </td>
                                    <td>
                                        <%= post.getCreatedAt() %>
                                    </td>
                                </tr>
                                <% } } %>
                        </tbody>
                    </table>
                </div>
                <div class="bottom_elements">
                    <div class="list_bottom_btnbox">
                        <a href="write.jsp"><button>글쓰기</button></a>
                    </div>
                    <div class="bottom_paging_box">
                        <em>1</em>
                        <a href="page=2">2</a>
                        <a href="page=3">3</a>
                        <a href="page=4">4</a>
                        <a href="page=5">5</a>
                        <a href="page=85691">다음</a>
                        <a href="page=85691">끝</a>
                    </div>
                </div>
            </article>
        </main>
</body>

</html>