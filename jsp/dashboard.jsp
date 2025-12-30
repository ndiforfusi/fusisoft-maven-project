<% HttpSession session=request.getSession(false); if (session==null || session.getAttribute("user")==null) {
    response.sendRedirect("login.jsp"); return; } %>

    <%@ page import="java.sql.*, java.util.*" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Dashboard - Fusisoft Technologies</title>
            </head>

            <body>
                <h2>Submitted Contact Forms</h2>
                <table border="1">
                    <tr>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Project Details</th>
                    </tr>
                    <% // Fetch submitted forms from the database Connection
                        conn=DriverManager.getConnection("jdbc:postgresql://<your-rds-endpoint>:5432/contact",
                        "username", "password");
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM contact_forms");

                        while (rs.next()) {
                        String name = rs.getString("name");
                        String phone = rs.getString("phone");
                        String email = rs.getString("email");
                        String project = rs.getString("project");

                        out.println("<tr>");
                            out.println("<td>" + name + "</td>");
                            out.println("<td>" + phone + "</td>");
                            out.println("<td>" + email + "</td>");
                            out.println("<td>" + project + "</td>");
                            out.println("</tr>");
                        }

                        conn.close();
                        %>
                </table>
                <br>
                <a href="home.jsp">Back to Home</a>
            </body>

            </html>