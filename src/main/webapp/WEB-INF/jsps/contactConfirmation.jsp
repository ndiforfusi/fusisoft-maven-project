<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Contact Submitted — Fusisoft Technologies</title>
</head>
<body>
  <div class="container">
    <%@ include file="fragments/header.jspf" %>

    <div class="card glass status-card">
      <div class="status-icon success" aria-hidden="true">
        <i class="fa-solid fa-check"></i>
      </div>
      <h2>Thank You!</h2>
      <p>
        Dear <strong><c:out value="${sessionScope.contactName}" default="Customer"/></strong>,
        thank you for reaching out. We have received your request and will respond shortly.
      </p>

      <div class="status-actions">
        <c:url var="homeUrl" value="/"/>
        <a class="btn btn-primary" href="${homeUrl}">Return Home</a>
        <c:url var="contactUrl" value="/contact"/>
        <a class="btn btn-ghost" href="${contactUrl}">Submit Another Request</a>
      </div>
    </div>

    <%@ include file="fragments/footer.jspf" %>
  </div>
</body>
</html>
