/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet(name = "AddUserServlet", urlPatterns = {"/AddUserServlet"})
public class AddUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Get parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String membership_package = request.getParameter("membership_package");
        String shift = request.getParameter("shift");
        String join_date = request.getParameter("join_date");
        
        // Basic validation
        if (name == null || name.trim().isEmpty() || 
            email == null || email.trim().isEmpty() ||
            phone == null || phone.trim().isEmpty()) {
            response.sendRedirect("error.jsp?message=Missing required fields");
            return;
        }

        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3307/gymdb?useSSL=false", "root", "khopolo");
            
            // Check if email already exists
            ps = conn.prepareStatement("SELECT id FROM users WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                response.sendRedirect("error.jsp?message=Email already exists");
                return;
            }
            
            // Insert new user
            ps = conn.prepareStatement(
                "INSERT INTO users (name, email, phone, membership_package, shift, join_date) " +
                "VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, membership_package);
            ps.setString(5, shift);
            ps.setDate(6, Date.valueOf(join_date));

            int rowsAffected = ps.executeUpdate();
            
            if (rowsAffected > 0) {
                response.sendRedirect("success.jsp?message=Member added successfully");
            } else {
                response.sendRedirect("error.jsp?message=Failed to add member");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=Database error: " + e.getMessage());
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}