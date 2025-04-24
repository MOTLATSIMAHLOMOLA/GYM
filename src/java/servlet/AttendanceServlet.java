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

/**
 *
 * @author USER
 */
@WebServlet(name = "AttendanceServlet", urlPatterns = {"/AttendanceServlet"})
public class AttendanceServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        String date = request.getParameter("date");
        String status = request.getParameter("status");
        try (PrintWriter out = response.getWriter()) {
           Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3307/gymdb?useSSL=false", "root", "khopolo");

            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO attendance (user_id, date, status) VALUES (?, ?, ?)");
            ps.setInt(1, user_id);
            ps.setString(2, date);
            ps.setString(3, status);

            ps.executeUpdate();

            ps.close();
            conn.close();

            response.sendRedirect("success.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}

    