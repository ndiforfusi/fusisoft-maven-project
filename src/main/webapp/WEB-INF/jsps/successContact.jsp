<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Success — Fusisoft Technologies</title>
</head>
<body>
  <div class="container">
    <%@ include file="fragments/header.jspf" %>

    <div class="card glass status-card">
      <div class="status-icon success" aria-hidden="true">
        <i class="fa-solid fa-check"></i>
      </div>
      <div class="alert alert-success">
        <strong>Submitted successfully.</strong><br/>
        We’ll review your request and get back to you shortly.
      </div>

      <h2>Thank you<c:if test="${not empty sessionScope.contactName}">, ${sessionScope.contactName}</c:if>!</h2>
      <p>
        Your project details have been received. If urgent, include timelines and constraints in your message.
      </p>

      <div class="status-actions">
        <c:url var="homeUrl" value="/"/>
        <a class="btn btn-primary" href="${homeUrl}">Back to Home</a>
        <c:url var="contactUrl" value="/contact"/>
        <a class="btn btn-ghost" href="${contactUrl}">Submit Another</a>
      </div>
    </div>

    <%@ include file="fragments/footer.jspf" %>
  </div>
</body>
</html>
