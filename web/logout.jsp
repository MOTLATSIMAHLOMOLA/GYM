<%-- 
    Document   : logout
    Created on : Apr 19, 2025, 1:41:22 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
