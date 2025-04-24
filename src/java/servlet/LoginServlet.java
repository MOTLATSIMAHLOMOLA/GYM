/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    
    private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get and trim parameters
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        
        logger.log(Level.INFO, "Login attempt - Username: {0}", username);
        
        // Input validation
        if (username.isEmpty() || password.isEmpty()) {
            logger.log(Level.WARNING, "Empty username or password");
            response.sendRedirect("login.jsp?error=empty");
            return;
        }

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            // Load driver and establish connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3307/gymdb?useSSL=false", "root", "khopolo");
            logger.info("Database connection established");

            // Query with case-sensitive comparison
            String sql = "SELECT * FROM admin WHERE BINARY username = ? AND BINARY password = ?";
            logger.log(Level.INFO, "Executing query: {0}", sql);
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
                // Successful login
                logger.log(Level.INFO, "User found: {0}", rs.getString("username"));
                
                // Create new session (prevent session fixation)
                HttpSession oldSession = request.getSession(false);
                if (oldSession != null) {
                    oldSession.invalidate();
                }
                HttpSession newSession = request.getSession(true);
                
                // Set session attributes
                newSession.setAttribute("admin", true);
                newSession.setAttribute("username", username);
                newSession.setAttribute("admin_id", rs.getInt("id"));
                
                // Session timeout (30 minutes)
                newSession.setMaxInactiveInterval(30 * 60);
                
                logger.info("Session created, redirecting to dashboard");
                response.sendRedirect("dashboard.jsp");
            } else {
                // Failed login
                logger.log(Level.WARNING, "Invalid credentials for user: {0}", username);
                response.sendRedirect("login.jsp?error=invalid");
            }
            
        } catch (ClassNotFoundException e) {
            logger.log(Level.SEVERE, "JDBC Driver not found", e);
            response.sendRedirect("login.jsp?error=system");
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Database error", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                logger.log(Level.WARNING, "Error closing resources", e);
            }
        }
    }
}