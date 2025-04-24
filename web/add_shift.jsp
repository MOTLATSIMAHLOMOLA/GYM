<%-- 
    Document   : add_shift
    Created on : Apr 19, 2025, 1:06:03 PM
    Author     : USER
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Shift</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>Add New Shift</h2>
    <form action="AddShiftServlet" method="post">
        <label>Shift Name:</label>
        <input type="text" name="name" required><br>

        <label>Start Time:</label>
        <input type="time" name="start_time" required><br>

        <label>End Time:</label>
        <input type="time" name="end_time" required><br>

        <input type="submit" value="Add Shift">
    </form>
</body>
</html>
