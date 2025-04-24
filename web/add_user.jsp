<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, java.sql.*" %>
<%
    List<String> packages = new ArrayList<>();
    List<String> shifts = new ArrayList<>();
    
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3307/gymdb?useSSL=false", "root", "khopolo");
        
        // Get packages using prepared statement
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT name FROM packages");
        while (rs.next()) {
            packages.add(rs.getString("name"));
        }
        rs.close();
        
        // Get shifts
        rs = stmt.executeQuery("SELECT shift_name FROM shifts");
        while (rs.next()) {
            shifts.add(rs.getString("shift_name"));
        }
        
    } catch (Exception e) {
        e.printStackTrace();
        // Log error but don't show to user
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add User</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .error { color: red; }
        form { max-width: 500px; margin: 20px auto; }
        label { display: block; margin-top: 10px; }
        input, select { width: 100%; padding: 8px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add New Gym Member</h2>
        
        <% if (request.getParameter("error") != null) { %>
            <div class="error">
                <%= request.getParameter("error") %>
            </div>
        <% } %>
        
        <form action="AddUserServlet" method="post" onsubmit="return validateForm()">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="phone">Phone:</label>
                <input type="tel" id="phone" name="phone" 
                       pattern="[0-9]{8,15}" 
                       title="Enter 8-15 digits" 
                       required>
                <small>Format: 8-15 digits only (e.g., 50123456)</small>

            <label for="membership_package">Membership Package:</label>
            <select id="membership_package" name="membership_package" required>
                <% for (String pkg : packages) { %>
                    <option value="<%= pkg %>"><%= pkg %></option>
                <% } %>
            </select>

            <label for="shift">Shift:</label>
            <select id="shift" name="shift" required>
                <% for (String shift : shifts) { %>
                    <option value="<%= shift %>"><%= shift %></option>
                <% } %>
            </select>

            <label for="join_date">Join Date:</label>
            <input type="date" id="join_date" name="join_date" required>

            <input type="submit" value="Add User">
        </form>
    </div>

    
</body>
</html>