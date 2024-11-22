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
    <%@ page import="java.util.Date"%>
    <%@ page import="java.util.ArrayList"%>
    <%!
    public class Notification {
    	int notiNo;
    	String notiTitle;
   	String notiContent;
    	String user;
    	String createdAt;

    	public Notification(int no, String title, String content, String user, String createdAt) {
        	this.notiNo = no;
        	this.notiTitle = title;
        	this.notiContent = content;
        	this.user = user;
        	this.createdAt = createdAt;
    	}
	
    	public int getNotificationNo() {
       		return this.notiNo;
    	}	

    	public String getNotificationTitle() {
    	    	return this.notiTitle;
    	}	

    	public String getNotificationContent() {
        	return this.notiContent;
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
	ArrayList<Notification> notis = new ArrayList<>();
   	notis.add(new Notification(1,"동아리 운영 공지", "공지 내용입니다.", "운영자", "2024-11-18"));
        notis.add(new Notification(2,"동아리방 모니터 부순사람 빨리 나오세요.", "나무의 근황입니다.", "운영자", "2024-11-18"));
        notis.add(new Notification(3,"24주차 발표 공지", "벌레에 관한 이야기.", "운영자", "2024-11-18"));
        notis.add(new Notification(4,"소프트웨어 경진대회 대회 안내", "컴퓨터 소프트웨어 학과 근황.", "운영자", "2024-11-18"));
        notis.add(new Notification(5,"내년엔 더 열심하 하겠습니다.", "잘자라는 메시지.", "운영자", "2024-11-18"));
    %>
    <main>
        <h3>공지사항</h3>
        <article>
            <div>
                <table>
                    <caption>공지사항 리스트</caption>
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
			<% for (Notification noti : notis) { %>
                        <tr class="ub-content">
                            <td class="noti_num"><%= noti.getNotificationNo() %></td>
                            <td class="noti_title">
                                <a href="javascript:;" onclick=""><%= noti.getNotificationTitle() %></a>
                            </td>
                            <td class="noti_writer"><b><%= noti.getUser() %></b></td>
                            <td class="noti_date"><%= noti.getCreatedAt() %></td>
                        </tr>
                    	<% } %>
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
