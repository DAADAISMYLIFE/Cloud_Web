<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    if (session != null) {
        session.invalidate(); // 세션 무효화
    }
%>
<script>
    alert('로그아웃 되었습니다.');
    location.href = '/Cloud_Web/index.jsp'; 
</script>
