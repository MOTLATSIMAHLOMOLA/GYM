<%-- 
    Document   : manage_attendance
    Created on : Apr 19, 2025, 1:12:10 PM
    Author     : USER
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Attendance</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>Mark Attendance</h2>
    <form action="AttendanceServlet" method="post">
        <label>User ID:</label>
        <input type="number" name="user_id" required><br>

        <label>Date:</label>
        <input type="date" name="date" required><br>

        <label>Status:</label>
        <select name="status">
            <option value="Present">Present</option>
            <option value="Absent">Absent</option>
        </select><br>

        <input type="submit" value="Submit Attendance">
    </form>
</body>
</html>

