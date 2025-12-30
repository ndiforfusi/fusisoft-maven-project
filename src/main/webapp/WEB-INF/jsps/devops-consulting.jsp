<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!doctype html>
    <html lang="en">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>DevOps Consulting — Fusisoft Technologies</title>
    </head>

    <body>
      <div class="container">
        <%@ include file="fragments/header.jspf" %>

          <c:url var="heroImg" value="/images/devops.jpg" />
          <header class="hero glass">
            <div class="hero-bg" style="background-image:url('${heroImg}');"></div>
            <h1>DevOps Consulting</h1>
            <p>Optimize delivery with CI/CD automation, deployment safety, and observability.</p>
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
              <p>Implementation-ready pipelines, automation, and operational excellence.</p>

              <div class="services">
                <div class="service-card">
                  <div class="service-content">
                    <div class="service-pill">CI/CD</div>
                    <div class="service-title">Pipelines</div>
                    <div class="service-desc">Build, test, scan, and deploy with confidence.</div>
                  </div>
                </div>

                <div class="service-card">
                  <div class="service-content">
                    <div class="service-pill">Containers</div>
                    <div class="service-title">Kubernetes</div>
                    <div class="service-desc">Packaging, orchestration, scaling and resilience.</div>
                  </div>
                </div>

                <div class="service-card">
                  <div class="service-content">
                    <div class="service-pill">Automation</div>
                    <div class="service-title">Infrastructure</div>
                    <div class="service-desc">Repeatable environments with governance and versioning.</div>
                  </div>
                </div>

                <div class="service-card">
                  <div class="service-content">
                    <div class="service-pill">Visibility</div>
                    <div class="service-title">Observability</div>
                    <div class="service-desc">Dashboards, alerts, tracing, and incident readiness.</div>
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