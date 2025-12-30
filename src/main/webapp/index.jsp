<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Chuyển hướng ngay lập tức đến Servlet trang chủ
    response.sendRedirect(request.getContextPath() + "/home");
%>
