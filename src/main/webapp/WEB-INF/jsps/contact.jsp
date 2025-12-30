<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Contact — Fusisoft Technologies</title>
</head>
<body>
  <div class="container">
    <%@ include file="fragments/header.jspf" %>

    <header class="hero">
      <h1>Contact Us</h1>
      <p>Tell us about your project. We’ll respond with next steps and a clear plan.</p>
    </header>

    <main class="grid">
      <section class="card">
        <h2>Project Details</h2>

        <c:url var="submitUrl" value="/contact"/>
        <form class="form" action="${submitUrl}" method="post">
          <label class="label" for="name">Name</label>
          <input class="input" id="name" name="name" type="text" required/>

          <label class="label" for="phone">Phone</label>
          <input class="input" id="phone" name="phone" type="tel" required/>

          <label class="label" for="email">Email</label>
          <input class="input" id="email" name="email" type="email" required/>

          <label class="label" for="message">Project Details</label>
          <textarea class="textarea" id="message" name="message" rows="5" required></textarea>

          <div class="help">We’ll never share your details. This is strictly for project coordination.</div>

          <button class="btn btn-primary" type="submit">Submit</button>
        </form>
      </section>

      <aside class="card">
        <h2>What happens next?</h2>
        <p>After you submit, we’ll review your request and reach out with options.</p>

        <div class="features">
          <div class="feature">
            <strong>1) Quick review</strong>
            <span>We confirm scope and timeline.</span>
          </div>
          <div class="feature">
            <strong>2) Proposal</strong>
            <span>We share approach and deliverables.</span>
          </div>
          <div class="feature">
            <strong>3) Implementation</strong>
            <span>We deliver with your team.</span>
          </div>
          <div class="feature">
            <strong>4) Handover</strong>
            <span>Runbooks and operational readiness.</span>
          </div>
        </div>
      </aside>
    </main>

    <%@ include file="fragments/footer.jspf" %>
  </div>
</body>
</html>
