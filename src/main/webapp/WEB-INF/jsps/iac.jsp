<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!doctype html>
    <html lang="en">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Infrastructure as Code — Fusisoft Technologies</title>
    </head>

    <body>
      <div class="container">
        <%@ include file="fragments/header.jspf" %>

          <c:url var="heroImg" value="/images/iac.jpg" />
          <header class="hero glass">
            <div class="hero-bg" style="background-image:url('${heroImg}');"></div>
            <h1>Infrastructure as Code (IaC)</h1>
            <p>Automate cloud infrastructure with code using Terraform, CloudFormation, and Ansible.</p>
            <div class="cta">
              <c:url var="contactUrl" value="/contact" />
              <a class="btn btn-primary" href="${contactUrl}">Request a Consultation</a>
              <c:url var="homeUrl" value="/" />
              <a class="btn btn-ghost" href="${homeUrl}">Back to Home</a>
            </div>
          </header>

          <main class="grid">
            <section class="card">
              <h2>What we deliver</h2>
              <p>Repeatable environments, drift control, and automation-first governance.</p>

              <div class="services">
                <div class="service-card">
                  <div class="service-content">
                    <div class="service-pill">Terraform</div>
                    <div class="service-title">Modules</div>
                    <div class="service-desc">Reusable patterns for multiple environments.</div>
                  </div>
                </div>

                <div class="service-card">
                  <div class="service-content">
                    <div class="service-pill">Governance</div>
                    <div class="service-title">Drift Control</div>
                    <div class="service-desc">Prevent manual changes and configuration drift.</div>
                  </div>
                </div>

                <div class="service-card">
                  <div class="service-content">
                    <div class="service-pill">Recovery</div>
                    <div class="service-title">DR Automation</div>
                    <div class="service-desc">Backups, restore plans, and failover workflows.</div>
                  </div>
                </div>

                <div class="service-card">
                  <div class="service-content">
                    <div class="service-pill">CI</div>
                    <div class="service-title">Infra Pipelines</div>
                    <div class="service-desc">Plan/apply workflows with approvals and checks.</div>
                  </div>
                </div>
              </div>
            </section>

            <aside class="card">
              <h2>Engagement options</h2>
              <p>Pick a model that fits your timeline and goals.</p>

              <div class="alert"><strong>Assessment</strong><br />Current state + prioritized roadmap.</div>
              <div class="alert" style="margin-top:12px;"><strong>Implementation</strong><br />Hands-on delivery with
                your team.</div>
              <div class="alert" style="margin-top:12px;"><strong>Enablement</strong><br />Training, runbooks, and
                support handover.</div>

              <div class="cta" style="margin-top:14px;">
                <c:url var="contactUrl" value="/contact" />
                <a class="btn btn-primary" href="${contactUrl}">Start Here</a>
              </div>
            </aside>
          </main>

          <%@ include file="fragments/footer.jspf" %>
      </div>
    </body>

    </html>