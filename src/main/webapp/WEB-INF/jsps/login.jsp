<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin Login — Fusisoft Technologies</title>
</head>
<body>
  <div class="container">
    <%@ include file="fragments/header.jspf" %>

    <div class="card glass" style="max-width:520px; margin:0 auto;" data-reveal>
      <div class="card-header">
        <h2>Admin Login</h2>
        <span class="pill"><i class="fa-solid fa-lock"></i> Secure Access</span>
      </div>
      <p style="color:rgba(255,255,255,.78); margin-top:-2px;">
        Sign in to view admin dashboard.
      </p>

      <c:if test="${param.error eq 'true'}">
        <div class="alert alert-danger">
          Invalid credentials. Please try again.
        </div>
      </c:if>

      <c:url var="loginAction" value="/login"/>
      <form class="form" action="${loginAction}" method="post">
        <label class="label" for="email">Email</label>
        <input class="input" type="email" id="email" name="email" required/>

        <label class="label" for="password">Password</label>
        <input class="input" type="password" id="password" name="password" required/>

        <button class="btn btn-primary" type="submit">Login</button>

        <div class="help">Tip: Set ADMIN_EMAIL and ADMIN_PASSWORD environment variables if needed.</div>
      </form>
    </div>

    <%@ include file="fragments/footer.jspf" %>
  </div>
</body>
</html>
