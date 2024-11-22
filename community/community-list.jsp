<%@ page import="java.util.List" %>
<%@ page import="cloud.Post" %>
<%@ page import="cloud.PostDAO" %>
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
    <% try{ %>
    <%@ include file = "/Cloud_Web/dbconnect.jsp" %>
    <% String query = "SELECT * FROM posts"; 
	rs = stmt.executeQuery(query);
        // Print Result (Run by Query)
        while(rs.next()) {
    %>
    <tr class="ub-content">
    	<td class="post_num"><%= rs.getInt("postNo") %></td>
    	<td class="post_title">
    		<a href="javascript:;" onclick=""><%= rs.getString("postTitle") %></a>
    	</td>
    	<td class="post_writer"><b><%= rs.getString("user") %></b></td>
    		<td class="post_date"><%= rs.getString("createdAt") %></td>
    </tr>
    <% } 
    	} catch(SQLException ex) {
                out.println(ex.getMessage());
                ex.printStackTrace();
	} finally {
	 // Close Statement
 	if (rs !=null) try { rs.close(); } catch(SQLException ex) {}
 	if (stmt !=null) try { stmt.close(); } catch(SQLException ex) {}
 	// Close Connection
	 if (conn !=null) try { conn.close(); } catch(SQLException ex) {}
 	}
     %>


    <%@ include file = "/Cloud_Web/default.jsp" %>
    <%@ page import="java.util.Date"%>
    <%@ page import="java.util.ArrayList"%>
    <%!
    public class Post {
    	int postNo;
    	String postTitle;
   	String postContent;
    	String user;
    	String createdAt;

    	public Post(int no, String title, String content, String user, String createdAt) {
        	this.postNo = no;
        	this.postTitle = title;
        	this.postContent = content;
        	this.user = user;
        	this.createdAt = createdAt;
    	}
	
    	public int getPostNo() {
       		return this.postNo;
    	}	

    	public String getPostTitle() {
    	    	return this.postTitle;
    	}	

    	public String getPostContent() {
        	return this.postContent;
    	}

    	public String getUser() {
        	return this.user;
    	}	

    	public String getCreatedAt() {
        	return this.createdAt;
    	}
	}

    %>
    <%
	// 임시 데이터 5개 정도 추가
	ArrayList<Post> posts = new ArrayList<>();
   	posts.add(new Post(1,"동아리 운영 공지", "공지 내용입니다.", "운영자", "2024-11-18"));
        posts.add(new Post(2,"동의대에서 제일 잘나가는 나무 ㅋㅋㅋㅋㅋ", "나무의 근황입니다.", "동의대생", "2024-11-18"));
        posts.add(new Post(3,"나는 개벌레야...", "벌레에 관한 이야기.", "동의대생", "2024-11-18"));
        posts.add(new Post(4,"동의대 컴소 1짱 근황", "컴퓨터 소프트웨어 학과 근황.", "동의대생", "2024-11-18"));
        posts.add(new Post(5,"잘자해줘", "잘자라는 메시지.", "동의대생", "2024-11-18"));
    %>
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
			<% for (Post post : posts) { %>
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
