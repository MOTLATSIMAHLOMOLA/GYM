<%-- 
    Document   : index
    Created on : Apr 19, 2025, 11:50:25 AM
    Author     : USER
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if user is already logged in
    if(session.getAttribute("admin") != null) {
        response.sendRedirect("dashboard.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gym Management System</title>
    <link rel="stylesheet" href="css/style.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="welcome-section">
            <div class="welcome-content">
                <h1>Gym Management System</h1>
    
                <div class="features">
                    <div class="feature">
                        <i class="fas fa-dumbbell"></i>
                        <h3>Package Management</h3>
                        <p>Create and manage different gym packages</p>
                    </div>
                    <div class="feature">
                        <i class="fas fa-users"></i>
                        <h3>Member Management</h3>
                        <p>Manage gym members efficiently</p>
                    </div>
                    <div class="feature">
                        <i class="fas fa-user-tie"></i>
                        <h3>Trainer Management</h3>
                        <p>Assign trainers and manage schedules</p>
                    </div>
                    <div class="feature">
                        <i class="fas fa-money-bill-wave"></i>
                        <h3>Payment Processing</h3>
                        <p>Handle recurring payments seamlessly</p>
                    </div>
                    <div class="feature">
                        <i class="fas fa-chart-line"></i>
                        <h3>Reports</h3>
                        <p>Generate insightful reports</p>
                    </div>
                    <div class="feature">
                        <i class="fas fa-calendar-check"></i>
                        <h3>Attendance Tracking</h3>
                        <p>Track attendance of members</p>
                    </div>
                </div>
                <a href="login.jsp" class="btn btn-primary">Admin Login</a>
            </div>
        </div>
    </div>
    
    <footer>
        <p>&copy; <%= new java.util.Date().getYear() + 1900 %> Gym Management System. All rights reserved.</p>
    </footer>
</body>
</html>
