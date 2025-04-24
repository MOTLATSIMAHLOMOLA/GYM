<%-- 
    Document   : add_trainer
    Created on : Apr 19, 2025, 12:49:18 PM
    Author     : USER
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Trainer</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>Add New Trainer</h2>
    <form action="AddTrainerServlet" method="post">
        <label>Name:</label>
        <input type="text" name="name" required><br>

        <label>Email:</label>
        <input type="email" name="email" required><br>

        <label>Phone:</label>
        <input type="text" name="phone" required><br>

        <label>Specialization:</label>
        <input type="text" name="specialization" required><br>

        <label>Shift:</label>
        <input type="text" name="shift" required><br>

        <input type="submit" value="Add Trainer">
    </form>
</body>
</html>
