<%-- 
    Document   : error
    Created on : 2 Jun 2026, 3:22:15 pm
    Author     : aiman
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Error page</title>
</head>
<body>
    <center>
        <h1 style="color: tomato;">Application Error</h1>
        <h2><%= exception.getMessage() %><br/> </h2>
    </center>
</body>
</html>