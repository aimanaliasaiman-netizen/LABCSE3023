<%-- 
    Document   : index
    Created on : 2 Jun 2026, 4:03:47 pm
    Author     : aiman
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Car Shop Platform Engine</title>
</head>
<body class="container mt-5">
    <div class="jumbotron text-center">
        <h1 class="display-4">Car Shop Management Core</h1>
        <div class="d-flex justify-content-center gap-3">
            <a class="btn btn-primary btn-lg mx-2" href="${pageContext.request.contextPath}/list" role="button">View Car Catalog</a>
            <a class="btn btn-success btn-lg mx-2" href="${pageContext.request.contextPath}/new" role="button">Add New Vehicle</a>
        </div>
    </div>
</body>
</html>