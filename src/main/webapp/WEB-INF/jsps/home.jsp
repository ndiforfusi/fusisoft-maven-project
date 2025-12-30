<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Fusisoft Technologies — IT Consulting & Engineering</title>
  <c:url var="favicon" value="/images/symbol_logo.jpg"/>
  <link rel="icon" href="${favicon}"/>
</head>
<body>
  <div class="container">
    <%@ include file="fragments/header.jspf" %>

    <header class="hero" aria-labelledby="pageTitle">
      <h1 id="pageTitle">Build faster. Operate safer. Scale confidently.</h1>
      <p>
        Fusisoft helps teams deliver reliable software through DevOps, SRE, DevSecOps, Infrastructure as Code,
        and cybersecurity solutions—built for real-world delivery and measurable outcomes.
      </p>

      <div class="kpi" aria-label="Highlights">
        <span class="pill">Automation-first delivery</span>
        <span class="pill">Security by design</span>
        <span class="pill">Cloud-native + IaC</span>
        <span class="pill">Observability & SLOs</span>
      </div>

      <div class="cta">
        <c:url var="contactUrl" value="/contact"/>
        <a class="btn btn-primary" href="${contactUrl}">Start a Project</a>
        <a class="btn btn-ghost" href="#services">Explore Services</a>
      </div>
    </header>

    <main class="grid" id="services">
      <section class="card">
        <h2>Our Services</h2>
        <p>Choose a focus area below. Each service is designed to improve speed, reliability, and security.</p>

        <div class="features" role="list">
          <c:url var="devopsUrl" value="/devops"/>
          <div class="feature" role="listitem">
            <strong><a href="${devopsUrl}">DevOps Consulting</a></strong>
            <span>CI/CD pipelines, platform automation, release safety, and delivery acceleration.</span>
          </div>

          <c:url var="sreUrl" value="/sre"/>
          <div class="feature" role="listitem">
            <strong><a href="${sreUrl}">Site Reliability Engineering</a></strong>
            <span>Monitoring, incident response, error budgets, SLOs, and reliability engineering.</span>
          </div>

          <c:url var="devsecopsUrl" value="/devsecops"/>
          <div class="feature" role="listitem">
            <strong><a href="${devsecopsUrl}">DevSecOps Integration</a></strong>
            <span>Security testing and compliance embedded into each stage of the SDLC.</span>
          </div>

          <c:url var="iacUrl" value="/iac"/>
          <div class="feature" role="listitem">
            <strong><a href="${iacUrl}">Infrastructure as Code</a></strong>
            <span>Terraform, CloudFormation, Ansible—repeatable environments and DR automation.</span>
          </div>

          <c:url var="cyberUrl" value="/cybersecurity"/>
          <div class="feature" role="listitem">
            <strong><a href="${cyberUrl}">Cybersecurity Solutions</a></strong>
            <span>Vulnerability reduction, IAM hardening, monitoring, and incident readiness.</span>
          </div>

          <div class="feature" role="listitem">
            <strong>Architecture & Advisory</strong>
            <span>Cloud strategy, landing zones, operational readiness, and cost optimization.</span>
          </div>
        </div>
      </section>

      <aside class="card">
        <h2>How we work</h2>
        <p>We deliver with your team, using practical patterns that can be operated long-term.</p>

        <div class="feature">
          <strong>Discover → Design → Deliver</strong>
          <span>Assess current state, design improvements, implement with measurable results.</span>
        </div>

        <div class="feature" style="margin-top:12px;">
          <strong>Secure & observable by default</strong>
          <span>Least privilege, logging, monitoring, and safe deployments baked in.</span>
        </div>

        <div class="cta">
          <c:url var="contactUrl" value="/contact"/>
          <a class="btn btn-primary" href="${contactUrl}">Talk to an Expert</a>
        </div>
      </aside>
    </main>

    <%@ include file="fragments/footer.jspf" %>
  </div>
</body>
</html>
