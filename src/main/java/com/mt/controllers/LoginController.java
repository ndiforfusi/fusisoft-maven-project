package com.mt.services;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if ("fusisoft@gmail.com".equals(email) && "yourPassword".equals(password)) {
            request.getSession().setAttribute("admin", true);
            response.sendRedirect("jsps/dashboard.jsp");
        } else {
            response.sendRedirect("jsps/login.jsp?error=true");
        }
    }
}

