<%-- 
    Document   : CarLIst
    Created on : 2 Jun 2026, 4:03:01 pm
    Author     : aiman
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Car Shop Price Catalog</title>
    
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark">
            <a href="" class="navbar-brand">Car Shop Inventory Management System</a>
            <ul class="navbar-nav">
                <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Show Catalog</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="container">
        <h3 class="text-center">Available Showroom Inventory</h3>
        <hr>
        <div class="text-left mb-3">
            <a href="<%=request.getContextPath()%>/new" class="btn btn-primary">Add New Car</a>
        </div>
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Car ID</th>
                    <th>Brand Name</th>
                    <th>Vehicle Model</th>
                    <th>Cylinders</th>
                    <th>MSRP Base Price (RM)</th>
                    <th>Actions Management</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="car" items="${listCars}">
                    <tr>
                        <td><c:out value="${car.carId}" /></td>
                        <td><c:out value="${car.brand}" /></td>
                        <td><c:out value="${car.model}" /></td>
                        <td><c:out value="${car.cylinder}" /></td>
                        <td>RM <c:out value="${car.price}" /></td>
                        <td>
                            <a href="edit?id=<c:out value='${car.carId}' />" class="btn btn-sm btn-warning">Edit</a>
                            &nbsp;&nbsp;
                            <a href="delete?id=<c:out value='${car.carId}' />" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to drop this vehicle record?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>