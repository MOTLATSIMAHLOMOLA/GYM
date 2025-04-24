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
import  java.sql.*;
/**
 *
 * @author USER
 */
@WebServlet(name = "AddPackageServlet", urlPatterns = {"/AddPackageServlet"})
public class AddPackageServlet extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
        int duration = Integer.parseInt(request.getParameter("duration"));
        double price = Double.parseDouble(request.getParameter("price"));
        
        try (PrintWriter out = response.getWriter()) {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3307/gymdb?useSSL=false", "root", "khopolo");

            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO packages (name, duration, price) VALUES (?, ?, ?)");
            ps.setString(1, name);
            ps.setInt(2, duration);
            ps.setDouble(3, price);

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

