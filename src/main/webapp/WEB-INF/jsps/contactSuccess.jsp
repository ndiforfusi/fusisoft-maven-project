<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Contact Success — Fusisoft Technologies</title>
</head>
<body>
  <div class="container">
    <%@ include file="fragments/header.jspf" %>

    <c:url var="homeUrl" value="/" />
    <c:url var="contactUrl" value="/contact" />

    <section class="card glass status-card" data-reveal role="status" aria-live="polite">
      <div class="status-icon success"><i class="fa-solid fa-check"></i></div>
      <h2>Thank you!</h2>
      <p style="color:rgba(255,255,255,.82); line-height:1.6;">
        Your contact details have been submitted successfully. We will get in touch soon.
      </p>

      <div class="cta" style="justify-content:center;">
        <a class="btn btn-primary" href="${homeUrl}">Back to Home</a>
        <a class="btn btn-ghost" href="${contactUrl}">Send another message</a>
      </div>
      <div class="help">If you don’t hear back, please check your spam folder or resend your request.</div>
    </section>

    <%@ include file="fragments/footer.jspf" %>
  </div>
</body>
</html>
