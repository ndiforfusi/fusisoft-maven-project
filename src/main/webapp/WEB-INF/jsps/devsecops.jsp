<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>DevSecOps Integration — Fusisoft Technologies</title>
</head>
<body>
  <div class="container">
    <%@ include file="fragments/header.jspf" %>

    <header class="hero">
      <h1>DevSecOps Integration</h1>
      <p>Embedding security into every stage of development—secure from day one.</p>
      <div class="cta">
        <c:url var="contactUrl" value="/contact"/>
        <a class="btn btn-primary" href="${contactUrl}">Talk to Us</a>
        <a class="btn btn-ghost" href="#details">Learn More</a>
      </div>
    </header>

    <main class="grid" id="details">
      <section class="card">
        <h2>What we deliver</h2>
        <p>We focus on measurable outcomes with implementation-ready deliverables.</p>

        <div class="features" role="list">
          <div class="feature" role="listitem"><strong>Security Testing</strong><span>SAST/DAST, dependency scanning, and policy gates.</span></div>
 <div class="feature" role="listitem"><strong>Secrets & IAM</strong><span>Least privilege, secrets management, and key rotation.</span></div>
 <div class="feature" role="listitem"><strong>Compliance as Code</strong><span>Auditable controls through automation and templates.</span></div>
 <div class="feature" role="listitem"><strong>Container/Cloud Security</strong><span>Hardening, runtime controls, and posture management.</span></div>
        </div>
      </section>

      <aside class="card">
        <h2>Engagement options</h2>
        <p>Choose what fits your timeline and goals.</p>

        <div class="feature">
          <strong>Assessment</strong>
          <span>Current state review + prioritized roadmap.</span>
        </div>

        <div class="feature" style="margin-top:12px;">
          <strong>Implementation</strong>
          <span>Hands-on delivery with your team.</span>
        </div>

        <div class="feature" style="margin-top:12px;">
          <strong>Enablement</strong>
          <span>Training, runbooks, and handover.</span>
        </div>

        <div class="cta">
          <c:url var="contactUrl" value="/contact"/>
          <a class="btn btn-primary" href="${contactUrl}">Request a Consultation</a>
        </div>
      </aside>
    </main>

    <%@ include file="fragments/footer.jspf" %>
  </div>
</body>
</html>
