<%@ page contentType="text/html; charset=UTF-8" %>
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>활동내역 글쓰기</title>
    <link rel="stylesheet" href="/Cloud_Web/styles/community_styles.css"> <!-- CSS 파일 링크 -->
</head>

<body>
    <%@ include file = "/Cloud_Web/default.jsp" %>
    <%@ page import="java.util.Date"%>
    <%@ page import="java.util.ArrayList"%>
    <%!
    public class Activity {
    	int activityNo;
    	String activityTitle;
   	String activityContent;
    	String user;
    	String createdAt;

    	public Activity(int no, String title, String content, String user, String createdAt) {
        	this.activityNo = no;
        	this.activityTitle = title;
        	this.activityContent = content;
        	this.user = user;
        	this.createdAt = createdAt;
    	}
	
    	public int getActivityNo() {
       		return this.activityNo;
    	}	

    	public String getActivityTitle() {
    	    	return this.activityTitle;
    	}	

    	public String getActivityContent() {
        	return this.activityContent;
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
	ArrayList<Activity> activities = new ArrayList<>();
   	activities.add(new Activity(1,"대회 참여 1등 수상!!", "공지 내용입니다.", "운영자", "2024-11-18"));
        activities.add(new Activity(2,"11월 2주차 발표", "나무의 근황입니다.", "운영자", "2024-11-18"));
        activities.add(new Activity(3,"11월 2주차 발표 수상 내역", "벌레에 관한 이야기.", "운영자", "2024-11-18"));
        activities.add(new Activity(4,"[24년도 3분기 순위 발표]", "컴퓨터 소프트웨어 학과 근황.", "운영자", "2024-11-18"));
        activities.add(new Activity(5,"16주차 스터디 내용", "잘자라는 메시지.", "운영자", "2024-11-18"));
    %>
    <main>
        <h3>활동내역</h3>
        <article>
            <div>
                <table>
                    <caption>활동내역 게시글 리스트</caption>
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
			<% for (Activity activity : activities) { %>
                        <tr class="ub-content">
                            <td class="activity_num"><%= activity.getActivityNo() %></td>
                            <td class="activity_title">
                                <a href="javascript:;" onclick=""><%= activity.getActivityTitle() %></a>
                            </td>
                            <td class="activity_writer"><b><%= activity.getUser() %></b></td>
                            <td class="activity_date"><%= activity.getCreatedAt() %></td>
                        </tr>
                    	<% } %>
                    </tbody>
                </table>
            </div>
            <div class="bottom_elements">
                <div class="list_bottom_btnbox">
                    <a href="activity-write.jsp"><button>글쓰기</button></a>
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
