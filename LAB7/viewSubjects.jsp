<%-- 
    Document   : viewSubject
    Created on : 3 Jun 2026, 4:51:25 am
    Author     : aiman
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.StudentBean"%>
<%@page import="com.lab.bean.SubjectBean"%>
<%@page import="com.lab.dao.SubjectDAO"%>
<%@page import="java.util.List"%>
<%
    HttpSession sess = request.getSession(false);
    if (sess == null || sess.getAttribute("loggedUser") == null) {
        response.sendRedirect("../login.html");
        return;
    }
    StudentBean loggedUser = (StudentBean) sess.getAttribute("loggedUser");
    SubjectDAO dao = new SubjectDAO();
    List<SubjectBean> subjects = dao.getSubjectsByMatric(loggedUser.getMatricNo());
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Registered Subjects</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow border-0 rounded-3 p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2>Subjects Registered for (<%= loggedUser.getMatricNo() %>)</h2>
                <div>
                    <a href="registerSubject.jsp" class="btn btn-primary">Add New Subject</a>
                    <a href="dashboard.jsp" class="btn btn-dark">Dashboard</a>
                </div>
            </div>
            
            <table class="table table-hover table-bordered text-center align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Subject Code</th>
                        <th>Subject Name</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% if(subjects.isEmpty()) { %>
                        <tr>
                            <td colspan="4" class="text-muted py-3">No subjects found.</td>
                        </tr>
                    <% } else { 
                        for(SubjectBean sub : subjects) { %>
                        <tr>
                            <td><%= sub.getId() %></td>
                            <td><%= sub.getSubjectCode() %></td>
                            <td><%= sub.getSubjectName() %></td>
                            <td>
                                <a href="SubjectServlet?action=edit&id=<%= sub.getId() %>" class="btn btn-sm btn-warning me-2">Update</a>
                                <a href="SubjectServlet?action=delete&id=<%= sub.getId() %>" 
                                   onclick="return confirm('Remove this subject assignment?');" 
                                   class="btn btn-sm btn-danger">Delete</a>
                            </td>
                        </tr>
                    <%   }
                       } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>