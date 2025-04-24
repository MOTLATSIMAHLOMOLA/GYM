<%-- 
    Document   : login
    Created on : Apr 19, 2025, 12:07:17 PM
    Author     : USER
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
  
    <link rel="stylesheet" href="css/style.css">
    <style>
        .login-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username">
            </div>
            
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" >
            </div>
            
            <button type="submit" class="btn btn-primary">Login</button>
            
            <% 
                String error = request.getParameter("error");
                if (error != null) {
            %>
                <div class="error-message">
                    Invalid credentials. Please try again.
                </div>
            <% } %>
        </form>
    </div>
</body>
</html>
