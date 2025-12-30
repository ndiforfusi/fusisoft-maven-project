package com.mt.controllers;

import com.mt.utils.DatabaseConnection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@Controller
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    private static final String ADMIN_EMAIL = System.getenv("ADMIN_EMAIL");
    private static final String ADMIN_PASSWORD = System.getenv("ADMIN_PASSWORD");

    @GetMapping({ "/login" })
    public String loginPage() {
        return "login"; // /WEB-INF/jsps/login.jsp
    }

    @GetMapping("/services/login")
    public String legacyLogin() {
        return "redirect:/login";
    }

    @PostMapping("/login")
    public String doLogin(@RequestParam String email,
            @RequestParam String password,
            HttpSession session) {

        email = trim(email);
        password = trim(password);

        if (email == null || password == null) {
            return "redirect:/login?error=true";
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            if (isAdminValid(email, password, conn)) {
                session.setAttribute("user", email);
                session.setAttribute("admin", true);
                return "redirect:/dashboard";
            }
        } catch (Exception e) {
            logger.error("Login failed due to server error.", e);
            return "redirect:/error";
        }

        return "redirect:/login?error=true";
    }

    // Minimal dashboard route so you don't get 404 after login
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session) {
        Object admin = session.getAttribute("admin");
        if (!(admin instanceof Boolean) || !((Boolean) admin)) {
            return "redirect:/login";
        }
        return "dashboard"; // /WEB-INF/jsps/dashboard.jsp
    }

    private boolean isAdminValid(String email, String password, Connection conn) throws Exception {
        // If you store admin credentials in DB, update table/column names accordingly.
        // Current query assumes: table contact(email,password)
        String sql = "SELECT password FROM contact WHERE email = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String stored = rs.getString("password");
                    return stored != null && stored.equals(password);
                }
            }
        }

        // Fallback to env admin credentials
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
