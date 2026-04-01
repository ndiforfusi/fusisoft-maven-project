<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Submission Error — Fusisoft Technologies</title>
</head>
<body>
  <div class="container">
    <%@ include file="fragments/header.jspf" %>

    <c:url var="contactUrl" value="/contact" />
    <c:url var="homeUrl" value="/" />

    <section class="card glass status-card" data-reveal role="alert" aria-live="assertive">
      <div class="status-icon error"><i class="fa-solid fa-triangle-exclamation"></i></div>
      <h2>Oops! Something went wrong.</h2>
      <p style="color:rgba(255,255,255,.82); line-height:1.6;">
        We couldn’t process your submission. Please try again later. If the issue persists, contact our team and we’ll
        help you.
      </p>

      <div class="cta" style="justify-content:center;">
        <a class="btn btn-primary" href="${contactUrl}">Back to Contact Form</a>
        <a class="btn btn-ghost" href="${homeUrl}">Go to Home</a>
      </div>
      <div class="help">Tip: If you refreshed during submission, try submitting again only once.</div>
    </section>

    <%@ include file="fragments/footer.jspf" %>
  </div>
</body>
</html>
