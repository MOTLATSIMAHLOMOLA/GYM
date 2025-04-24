<%-- 
    Document   : manage_payment
    Created on : Apr 19, 2025, 1:22:54 PM
    Author     : USER
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Payment</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>Record Payment</h2>
    <form action="PaymentServlet" method="post">
        <label>User ID:</label>
        <input type="number" name="user_id" required><br>

        <label>Amount:</label>
        <input type="number" step="0.01" name="amount" required><br>

        <label>Date:</label>
        <input type="date" name="date" required><br>

        <input type="submit" value="Record Payment">
    </form>
</body>
</html>
