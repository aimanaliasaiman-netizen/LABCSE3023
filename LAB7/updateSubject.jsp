<%-- 
    Document   : updateSubject
    Created on : 3 Jun 2026, 4:52:26 am
    Author     : aiman
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.SubjectBean"%>
<%
    HttpSession sess = request.getSession(false);
    if (sess == null || sess.getAttribute("loggedUser") == null) {
        response.sendRedirect("../login.html");
        return;
    }
    SubjectBean sub = (SubjectBean) request.getAttribute("subjectToEdit");
    if(sub == null) {
        response.sendRedirect("viewSubjects.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Subject</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5" style="max-width: 500px;">
        <div class="card shadow border-0 rounded-3 p-4">
            <h2 class="text-center mb-4 text-dark">Update Subject Details</h2>
            <form action="SubjectServlet" method="POST">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= sub.getId() %>">
                
                <div class="mb-3">
                    <label class="form-label">Subject Code:</label>
                    <input type="text" name="subjectCode" value="<%= sub.getSubjectCode() %>" class="form-control" required>
                </div>
                
                <div class="mb-4">
                    <label class="form-label">Subject Name:</label>
                    <input type="text" name="subjectName" value="<%= sub.getSubjectName() %>" class="form-control" required>
                </div>
                
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-warning text-dark fw-bold">Save Changes</button>
                    <a href="viewSubjects.jsp" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>