<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <title>Contact Submitted - Fusisoft Technologies</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                padding: 20px;
            }

            h2 {
                color: #003366;
            }
        </style>
    </head>

    <body>
        <h2>Thank You!</h2>
        <p>Dear ${sessionScope.contactName},</p>
        <p>Thank you for reaching out to us. We have received your project details and will get back to you shortly.</p>
        <p>Best regards,<br />Fusisoft Technologies Team</p>
    </body>

    </html>