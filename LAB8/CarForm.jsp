<%-- 
    Document   : CarForm
    Created on : 2 Jun 2026, 4:03:38 pm
    Author     : aiman
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Vehicle Data Input Profile</title>
    
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark">
            <a href="" class="navbar-brand">Car Shop Inventory Management System</a>
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:if test="${car != null}">
                    <form action="update" method="post">
                </c:if>
                <c:if test="${car == null}">
                    <form action="insert" method="post">
                </c:if>

                <h2>
                    <c:if test="${car != null}">Edit Vehicle Entry</c:if>
                    <c:if test="${car == null}">Register New Car</c:if>
                </h2>

                <c:if test="${car != null}">
                    <input type="hidden" name="id" value="<c:out value='${car.carId}' />" />
                </c:if>

                <fieldset class="form-group">
                    <label>Brand Name</label>
                    <input type="text" value="${car.brand}" class="form-control" name="brand" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Vehicle Model</label>
                    <input type="text" value="${car.model}" class="form-control" name="model" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Engine Cylinders</label>
                    <input type="number" value="${car.cylinder}" class="form-control" name="cylinder" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Base Retail Price (RM)</label>
                    <input type="number" step="0.01" value="${car.price}" class="form-control" name="price" required="required">
                </fieldset>

                <button type="submit" class="btn btn-success">Save Vehicle</button>
                <a href="list" class="btn btn-secondary">Cancel</a>
                </form>
            </div>
        </div>
    </div>
</body>
</html>