<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (!Boolean.TRUE.equals(session.getAttribute("isAdmin"))) {
        out.println("<script> alert('관리자만 접근가능 한 페이지 입니다.'); location.href='/Cloud_Web/default.jsp'; </script>");
        return; // 이후 코드 실행 방지
    }
%>
