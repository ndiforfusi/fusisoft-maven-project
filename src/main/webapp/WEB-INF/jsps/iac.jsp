<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Infrastructure as Code (IaC) — Fusisoft Technologies</title>
</head>
<body>
  <div class="container">
    <%@ include file="fragments/header.jspf" %>

    <header class="hero">
      <h1>Infrastructure as Code (IaC)</h1>
      <p>Automating cloud infrastructure with code—repeatable, scalable, and safe.</p>
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
          <div class="feature" role="listitem"><strong>Terraform / CloudFormation</strong><span>Reusable modules, environments, and best practices.</span></div>
 <div class="feature" role="listitem"><strong>Drift & Governance</strong><span>Detect drift, enforce standards, and reduce manual changes.</span></div>
 <div class="feature" role="listitem"><strong>DR Automation</strong><span>Backups, replication, and recovery workflows.</span></div>
 <div class="feature" role="listitem"><strong>CI/CD for Infrastructure</strong><span>Plan/apply workflows with approvals and safety checks.</span></div>
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
