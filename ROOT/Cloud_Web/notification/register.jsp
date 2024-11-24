<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%
    // 폼 데이터를 가져옴
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    
    out.print(title);
    out.print(content);
%>

