<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!doctype html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <title>Submission Error</title>
        </head>

        <body>
            <div class="container">
                <%@ include file="fragments/header.jspf" %>

                <div class="card glass status-card" role="alert" aria-live="assertive">
                    <div class="status-icon error" aria-hidden="true">
                        <i class="fa-solid fa-triangle-exclamation"></i>
                    </div>
                    <h2>Oops! Something went wrong.</h2>
                    <p>We couldn’t process your submission. Please try again later.</p>

                    <div class="status-actions">
                        <c:url var="contactUrl" value="/contact" />
                        <a class="btn btn-primary" href="${contactUrl}">Back to Contact Form</a>
                        <c:url var="homeUrl" value="/" />
                        <a class="btn btn-ghost" href="${homeUrl}">Go to Home</a>
                    </div>

                    <div class="help">
                        Tip: If you refreshed during submission, try submitting again only once.
                    </div>
                </div>

                <%@ include file="fragments/footer.jspf" %>
            </div>
        </body>

        </html>
