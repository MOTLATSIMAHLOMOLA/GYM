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
@WebServlet(name = "AddShiftServlet", urlPatterns = {"/AddShiftServlet"})
public class AddShiftServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         String name = request.getParameter("name");
        String start_time = request.getParameter("start_time");
        String end_time = request.getParameter("end_time");
        try (PrintWriter out = response.getWriter()) {
                       Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3307/gymdb?useSSL=false", "root", "khopolo");

            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO shifts (name, start_time, end_time) VALUES (?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, start_time);
            ps.setString(3, end_time);

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

    