package com.mt.controllers;

import com.mt.utils.DatabaseConnection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    private static final String ADMIN_EMAIL = System.getenv("ADMIN_EMAIL");
    private static final String ADMIN_PASSWORD = System.getenv("ADMIN_PASSWORD");

    private static final String DASHBOARD = "/jsps/dashboard.jsp";
    private static final String LOGIN = "/jsps/login.jsp";
    private static final String ERROR = "/jsps/error.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = trim(request.getParameter("email"));
        String password = trim(request.getParameter("password"));

        // Basic input validation
        if (email == null || password == null) {
            response.sendRedirect(request.getContextPath() + LOGIN + "?error=missing");
            return;
        }

        // Fast-path: env-based admin login (fallback)
        if (isEnvAdminValid(email, password)) {
            createAdminSession(request.getSession(true));
            response.sendRedirect(request.getContextPath() + DASHBOARD);
            return;
        }

        // DB validation
        try (Connection conn = DatabaseConnection.getConnection()) {

            if (isAdminValidFromDb(email, password, conn)) {
                createAdminSession(request.getSession(true));
                response.sendRedirect(request.getContextPath() + DASHBOARD);
            } else {
                response.sendRedirect(request.getContextPath() + LOGIN + "?error=true");
            }

        } catch (SQLException e) {
            logger.error("Database error during login for email={}", email, e);
            response.sendRedirect(request.getContextPath() + ERROR);
        }
    }

    private void createAdminSession(HttpSession session) {
        session.setAttribute("admin", Boolean.TRUE);
        session.setMaxInactiveInterval(20 * 60); // 20 minutes
    }

    /**
     * If you truly intend to authenticate admins, use a dedicated admins table.
     * For now, this keeps your behavior but makes it safe.
     */
    private boolean isAdminValidFromDb(String email, String password, Connection conn) throws SQLException {
        // ⚠️ Recommended: use `admins` table, not `contact`
        final String sql = "SELECT password FROM admins WHERE email = ? LIMIT 1";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);

            try (ResultSet rs = stmt.executeQuery()) {
                if (!rs.next())
                    return false;

                String storedPassword = rs.getString("password");
                if (storedPassword == null)
                    return false;

                // NOTE: This is plain-text comparison. Prefer hashed passwords (see notes
                // below).
                return storedPassword.equals(password);
            }
        }
    }

    private boolean isEnvAdminValid(String email, String password) {
        return ADMIN_EMAIL != null
                && ADMIN_PASSWORD != null
                && ADMIN_EMAIL.equals(email)
                && ADMIN_PASSWORD.equals(password);
    }

    private String trim(String s) {
        if (s == null)
            return null;
        s = s.trim();
        return s.isEmpty() ? null : s;
    }
}



