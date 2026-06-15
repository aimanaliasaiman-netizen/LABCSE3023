<%-- 
    Document   : registerSubject
    Created on : 3 Jun 2026, 4:50:42 am
    Author     : aiman
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.StudentBean"%>
<%
    HttpSession sess = request.getSession(false);
    if (sess == null || sess.getAttribute("loggedUser") == null) {
        response.sendRedirect("../login.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Register Subject</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5" style="max-width: 500px;">
        <div class="card shadow border-0 rounded-3 p-4">
            <h2 class="text-center mb-4 text-dark">Register New Subject</h2>
            <form action="SubjectServlet" method="POST">
                <input type="hidden" name="action" value="insert">
                
                <div class="mb-3">
                    <label class="form-label">Subject Code:</label>
                    <input type="text" name="subjectCode" class="form-dash form-control" required>
                </div>
                
                <div class="mb-4">
                    <label class="form-label">Subject Name:</label>
                    <input type="text" name="subjectName" class="form-control" required>
                </div>
                
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-success">Add Subject</button>
                    <a href="viewSubjects.jsp" class="btn btn-secondary">Back to List</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>