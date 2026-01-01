package com.student.servlet;

import com.student.util.DBConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet to handle student registration.
 * Endpoint: /register
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String yearStr = request.getParameter("year");

        // 1. Basic Validation
        if (name == null || name.isEmpty() || email == null || email.isEmpty() || yearStr == null || yearStr.isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        try {
            int year = Integer.parseInt(yearStr);
            
            // 2. Database Operation
            try (Connection conn = DBConnection.getConnection()) {
                String sql = "INSERT INTO students (name, email, year) VALUES (?, ?, ?)";
                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    pstmt.setString(1, name);
                    pstmt.setString(2, email);
                    pstmt.setInt(3, year);
                    
                    pstmt.executeUpdate();
                    
                    // Success: Redirect to all students view
                    response.sendRedirect("show_all");
                }
            } catch (SQLException e) {
                // Handle duplicate email or other DB errors
                if ("23000".equals(e.getSQLState())) {
                    request.setAttribute("error", "Email already registered.");
                } else {
                    request.setAttribute("error", "Database error: " + e.getMessage());
                }
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Year must be a valid number.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
