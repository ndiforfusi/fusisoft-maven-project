package com.mt.services;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if ("fusisoft@gmail.com".equals(email) && "admin123".equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", email);
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("login.jsp?error=Invalid credentials");
        }
    }
}
