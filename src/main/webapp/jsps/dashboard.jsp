<%@ page import="javax.servlet.http.HttpSession" %>
    <% HttpSession session=request.getSession(false); if (session==null || session.getAttribute("user")==null) {
        response.sendRedirect("login.jsp"); return; } %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Admin Dashboard</title>
        </head>

        <body>
            <h2>Welcome, <%= session.getAttribute("user") %>!</h2>
            <p>Here you can view submitted contact requests.</p>
        </body>

        </html>