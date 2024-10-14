package com.mt.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mt.utils.DatabaseConnection;

public class LoginController extends HttpServlet {

    private static final String DEFAULT_PASSWORD = "Sch00l@12";
    private static final String ADMIN_EMAIL = "fusisoft@gmail.com";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = DatabaseConnection.getConnection()) {
            if (isAdminValid(email, password, conn)) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", true);
                response.sendRedirect("jsps/dashboard.jsp");
            } else {
                response.sendRedirect("jsps/login.jsp?error=true");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("jsps/error.jsp");
        }
    }

    private boolean isAdminValid(String email, String password, Connection conn) throws SQLException {
        String query = "SELECT password FROM contact WHERE email = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String storedPassword = rs.getString("password");
                return storedPassword.equals(password);
            } else if (ADMIN_EMAIL.equals(email) && DEFAULT_PASSWORD.equals(password)) {
                return true;
            }
        }
        return false;
    }

    // Handle password reset request
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String newPassword = request.getParameter("newPassword");

        try (Connection conn = DatabaseConnection.getConnection()) {
            if (resetPassword(ADMIN_EMAIL, newPassword, conn)) {
                response.sendRedirect("jsps/login.jsp?resetSuccess=true");
            } else {
                response.sendRedirect("jsps/error.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("jsps/error.jsp");
        }
    }

    private boolean resetPassword(String email, String newPassword, Connection conn) throws SQLException {
        String updateQuery = "UPDATE contact SET password = ? WHERE email = ?";
        try (PreparedStatement stmt = conn.prepareStatement(updateQuery)) {
            stmt.setString(1, newPassword);
            stmt.setString(2, email);
            return stmt.executeUpdate() > 0;
        }
    }
}


