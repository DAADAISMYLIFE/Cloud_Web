<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    //HttpSession session = request.getSession(false); // 현재 세션 가져오기
    if (session == null || session.getAttribute("userName") == null) {
        out.println("<script> alert('로그인 후 이용해 주세요.'); location.href='/Cloud_Web/login/loginPage.jsp'; </script>");
        return; // 이후 코드 실행 방지
    }
%>
