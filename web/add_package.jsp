<%-- 
    Document   : add_package
    Created on : Apr 19, 2025, 12:56:45 PM
    Author     : USER
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Package</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>Add Membership Package</h2>
    <form action="AddPackageServlet" method="post">
        <label>Package Name:</label>
        <input type="text" name="name" required><br>

        <label>Duration (months):</label>
        <input type="number" name="duration" required><br>

        <label>Price:</label>
        <input type="number" step="0.01" name="price" required><br>

        <input type="submit" value="Add Package">
    </form>
</body>
</html>

