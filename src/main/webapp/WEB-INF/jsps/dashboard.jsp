<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty sessionScope.user}">
  <c:redirect url="/login"/>
</c:if>

<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin Dashboard — Fusisoft Technologies</title>
</head>
<body>
  <div class="container">
    <%@ include file="fragments/header.jspf" %>

    <header class="hero glass" data-reveal>
      <h1>Admin Dashboard</h1>
      <p>Welcome, <strong><c:out value="${sessionScope.user}"/></strong>. View submissions and manage requests.</p>
      <div class="cta">
        <c:url var="logoutUrl" value="/logout"/>
        <a class="btn btn-ghost" href="${logoutUrl}">Logout</a>
      </div>
    </header>

    <div class="card glass" data-reveal>
      <div class="card-header">
        <h2>Submissions</h2>
        <span class="pill"><i class="fa-solid fa-table"></i> Live Intake</span>
      </div>
      <p>This table is a placeholder. Next step is to query your DB and render rows.</p>

      <table class="table" aria-label="Submitted contact requests">
        <thead>
          <tr>
            <th>Date</th>
            <th>Name</th>
            <th>Email</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>—</td>
            <td>—</td>
            <td>—</td>
            <td>—</td>
          </tr>
        </tbody>
      </table>
    </div>

    <%@ include file="fragments/footer.jspf" %>
  </div>
</body>
</html>
