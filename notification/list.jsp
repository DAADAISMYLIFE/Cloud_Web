<%@ page import="java.util.List" %>
<%@ page import="cloud.NotiDAO, cloud.DBConnection, cloud.Noti" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% // DB 연결 및 DAO 생성 
    NotiDAO notiDAO = new NotiDAO(DBConnection.getConnection()); 
    List<Noti> notis = notiDAO.getAllNotis();
%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="/Cloud_Web/styles/community_styles.css"> <!-- CSS 파일 링크 -->
</head>

<body>
    <%@ include file="/Cloud_Web/default.jsp" %>
        <main>
            <article>
                <div>
                    <table>
                        <caption>공지글 리스트</caption>
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
                            <% if (notis.size() == 0) {%>
                                <tr>
                                   <td colspan="4">아직 등록된 공지사항이 없습니다.</td>
                                </tr>
                            <% } else { %>
                            <% for (Noti noti : notis) { %>
                                <tr>
                                    <td>
                                        <%= noti.getId() %>
                                    </td>
                                    <td>
                                        <a href="detail.jsp?id=<%= noti.getId() %>">
                                        <%= noti.getTitle() %>
                                    </td>
                                    <td>
                                        <%= noti.getUser() %>
                                    </td>
                                    <td>
                                        <%= noti.getCreatedAt() %>
                                    </td>
                                </tr>
                                <% } } %>
                        </tbody>
                    </table>
                </div>
                <div class="bottom_elements">
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