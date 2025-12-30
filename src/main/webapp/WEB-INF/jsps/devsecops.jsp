<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!doctype html>
    <html lang="en">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>DevSecOps Integration — Fusisoft Technologies</title>
    </head>

    <body>
      <div class="container">
        <%@ include file="fragments/header.jspf" %>

          <c:url var="heroImg" value="/images/devsecops.jpg" />
          <header class="hero glass">
            <div class="hero-bg" style="background-image:url('${heroImg}');"></div>
            <h1>DevSecOps Integration</h1>
            <p>Embed security into CI/CD: shift-left testing, least privilege, and secure runtime controls.</p>
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
              <p>Security built into your delivery process—secure by default.</p>

              <div class="services">
                <div class="service-card">
                  <div class="service-content">
                    <div class="service-pill">Testing</div>
                    <div class="service-title">Security Gates</div>
                    <div class="service-desc">SAST/DAST + dependency scanning in pipelines.</div>
                  </div>
                </div>

                <div class="service-card">
                  <div class="service-content">
                    <div class="service-pill">IAM</div>
                    <div class="service-title">Least Privilege</div>
                    <div class="service-desc">Role-based access, MFA enforcement, reviews.</div>
                  </div>
                </div>

                <div class="service-card">
                  <div class="service-content">
                    <div class="service-pill">Compliance</div>
                    <div class="service-title">As Code</div>
                    <div class="service-desc">Auditable controls through automation.</div>
                  </div>
                </div>

                <div class="service-card">
                  <div class="service-content">
                    <div class="service-pill">Cloud</div>
                    <div class="service-title">Runtime Security</div>
                    <div class="service-desc">Hardening, policy enforcement, secure baselines.</div>
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