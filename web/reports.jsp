<%-- 
    Document   : reports
    Created on : Apr 19, 2025, 1:38:23 PM
    Author     : USER
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reports</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>Reports: User Payments</h2>
    <table border="1">
        <tr>
            <th>User ID</th>
            <th>Amount</th>
            <th>Date</th>
        </tr>

        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gymdb", "root", "yourpassword");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM payments");

                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("user_id") %></td>
            <td><%= rs.getDouble("amount") %></td>
            <td><%= rs.getString("date") %></td>
        </tr>
        <%
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch(Exception e) {
                out.println("Error loading report.");
            }
        %>
    </table>
</body>
</html>

