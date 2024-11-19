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
        <article>
            <div>
                <table>
                    <caption>커뮤니티 게시글 리스트</caption>
                    <colgroup>
                        <col style="width:7%">
                        <col>
                        <col style="width:18%">
                        <col style="width:6%">
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
                        <tr class="ub-content">
                            <td class="post_num">1</td>
                            <td class="post_title">
                                <a href="javascript:;" onclick=""><b>동아리 운영 공지</b></a>
                            </td>
                            <td class="post_writer"><b>운영자</b></td>
                            <td class="post_date">24/11/18</td>
                        </tr>

                        <tr class="ub-content">
                            <td class="post_num">2</td>
                            <td class="post_title">
                                <a href="">동의대에서 제일 잘나가는 나무 ㅋㅋㅋㅋㅋ</a>
                            </td>
                            <td class="post_writer">동의대생</td>
                            <td class="post_date">23:08</td>
                        </tr>
                        <tr class="ub-content">
                            <td class="post_num">3</td>
                            <td class="post_title">
                                <a href="">나는 개벌레야...</a>
                            </td>
                            <td class="post_writer">동의대생</td>
                            <td class="post_date">23:16</td>
                        </tr>
                        <tr class="ub-content">
                            <td class="post_num">4</td>
                            <td class="post_title">
                                <a href="">동의대 컴소 1짱 근황</a>
                            </td>
                            <td class="post_writer">동의대생</td>
                            <td class="post_date">23:22</td>
                        </tr>
                        <tr class="ub-content">
                            <td class="post_num">5</td>
                            <td class="post_title">
                                <a href="">잘자해줘</a>
                            </td>
                            <td class="post_writer">동의대생</td>
                            <td class="post_date">23:26</td>
                        </tr>
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