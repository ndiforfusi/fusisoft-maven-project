<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>DevOps Consulting — Fusisoft Technologies</title>
</head>
<body>
  <div class="container">
    <%@ include file="fragments/header.jspf" %>

    <header class="hero">
      <h1>DevOps Consulting</h1>
      <p>Optimizing development pipelines for faster, reliable deployments—with automation and observability built in.</p>
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
          <div class="feature" role="listitem"><strong>CI/CD Pipelines</strong><span>Automated builds, tests, quality gates, and safe releases.</span></div>
 <div class="feature" role="listitem"><strong>Containers & Kubernetes</strong><span>Packaging, orchestration strategy, and production readiness.</span></div>
 <div class="feature" role="listitem"><strong>Infrastructure Automation</strong><span>Terraform/CloudFormation + reusable modules and patterns.</span></div>
 <div class="feature" role="listitem"><strong>Observability</strong><span>Logs, metrics, tracing, alerting, and incident workflows.</span></div>
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
