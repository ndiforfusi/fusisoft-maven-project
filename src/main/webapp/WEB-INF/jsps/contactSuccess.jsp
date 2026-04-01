<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!doctype html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <title>Contact Success</title>
        </head>

        <body>
            <div class="container">
                <%@ include file="fragments/header.jspf" %>

                <div class="card glass status-card" role="status" aria-live="polite">
                    <div class="status-icon success" aria-hidden="true">
                        <i class="fa-solid fa-check"></i>
                    </div>
                    <h2>Thank you!</h2>
                    <p>Your contact details have been submitted successfully. We will get in touch soon.</p>

                    <div class="status-actions">
                        <c:url var="homeUrl" value="/" />
                        <a class="btn btn-primary" href="${homeUrl}">Back to Home</a>
                        <c:url var="contactUrl" value="/contact" />
                        <a class="btn btn-ghost" href="${contactUrl}">Send another message</a>
                    </div>

                    <div class="help">
                        If you don’t hear back, please check your spam folder or resend your request.
                    </div>
                </div>

                <%@ include file="fragments/footer.jspf" %>
            </div>
        </body>

        </html>
