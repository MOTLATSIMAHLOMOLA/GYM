<%-- 
    Document   : dashboard
    Created on : Apr 19, 2025, 12:27:50 PM
    Author     : USER
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>Welcome, <%= session.getAttribute("username") %></h2>
    <h3>Gym Management Admin Panel</h3>

    <ul>
        <li><a href="add_user.jsp">Add User</a></li>
        <li><a href="add_trainer.jsp">Add Trainer</a></li>
        <li><a href="add_package.jsp">Add Package</a></li>
        <li><a href="add_shift.jsp">Add Shift</a></li>
        <li><a href="manage_attendance.jsp">Manage Attendance</a></li>
        <li><a href="manage_payment.jsp">Manage Payment</a></li>
        <li><a href="reports.jsp">View Reports</a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </ul>
</body>
</html>

