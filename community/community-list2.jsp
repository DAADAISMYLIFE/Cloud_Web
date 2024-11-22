<%@ page import="java.util.List" %>
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
        <article>
            <div>
                <table>
                    <caption>커뮤니티 게시글 리스트</caption>
                    <colgroup>
                        <col style="width:7%">
                        <col>
                        <col style="width:18%">
                        <col style="width:10%">
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
                        <%
                            PostDAO postDAO = new PostDAO();
                            List<Post> posts = postDAO.getAllPosts();

                            // 게시물 출력
                            for (Post post : posts) {
                        %>
                        <tr class="ub-content">
                            <td class="post_num"><%= post.getPostNo() %></td>
                            <td class="post_title">
                                <a href="javascript:;" onclick=""><%= post.getPostTitle() %></a>
                            </td>
                            <td class="post_writer"><b><%= post.getUser() %></b></td>
                            <td class="post_date"><%= post.getCreatedAt() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <div class="bottom_elements">
                <div class="list_bottom_btnbox">
                    <a href="community-write.jsp"><button>글쓰기</button></a>
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

