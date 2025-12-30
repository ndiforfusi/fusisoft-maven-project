<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!doctype html>
    <html lang="en">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Fusisoft Technologies — IT Consulting & Engineering</title>
    </head>

    <body>
      <div class="container">
        <%@ include file="fragments/header.jspf" %>

          <c:url var="heroImg" value="/images/devops.jpg" />
          <header class="hero glass">
            <div class="hero-bg" style="background-image:url('${heroImg}');"></div>

            <h1>Modern IT engineering that delivers real outcomes.</h1>
            <p>
              We help organizations ship faster, operate reliably, and stay secure—through DevOps, SRE, DevSecOps,
              Infrastructure as Code, and Cybersecurity solutions.
            </p>

            <div class="cta">
              <c:url var="contactUrl" value="/contact" />
              <a class="btn btn-primary" href="${contactUrl}">Start a Project</a>
              <c:url var="devopsUrl" value="/devops" />
              <a class="btn btn-ghost" href="${devopsUrl}">Explore DevOps</a>
            </div>
          </header>

          <main class="grid" style="margin-top:18px;">
            <section class="card">
              <h2>Our Core Services</h2>
              <p>Premium service pages with your imagery and a consistent brand design system.</p>

              <div class="services">
                <c:url var="devopsUrl" value="/devops" />
                <c:url var="devopsImg" value="/images/devops.jpg" />
                <div class="service-card">
                  <div class="service-cover" style="background-image:url('${devopsImg}');"></div>
                  <div class="service-content">
                    <div class="service-pill">Delivery • Automation</div>
                    <div class="service-title">DevOps Consulting</div>
                    <div class="service-desc">CI/CD pipelines, cloud automation, and deployment acceleration.</div>
                    <a class="service-link" href="${devopsUrl}">Learn more →</a>
                  </div>
                </div>

                <c:url var="sreUrl" value="/sre" />
                <c:url var="sreImg" value="/images/sre.jpg" />
                <div class="service-card">
                  <div class="service-cover" style="background-image:url('${sreImg}');"></div>
                  <div class="service-content">
                    <div class="service-pill">Reliability • Observability</div>
                    <div class="service-title">Site Reliability Engineering</div>
                    <div class="service-desc">SLOs, monitoring, incident response, and resilient systems.</div>
                    <a class="service-link" href="${sreUrl}">Learn more →</a>
                  </div>
                </div>

                <c:url var="devsecopsUrl" value="/devsecops" />
                <c:url var="devsecopsImg" value="/images/devsecops.jpg" />
                <div class="service-card">
                  <div class="service-cover" style="background-image:url('${devsecopsImg}');"></div>
                  <div class="service-content">
                    <div class="service-pill">Security • Compliance</div>
                    <div class="service-title">DevSecOps Integration</div>
                    <div class="service-desc">Security embedded into the pipeline—secure by design.</div>
                    <a class="service-link" href="${devsecopsUrl}">Learn more →</a>
                  </div>
                </div>

                <c:url var="iacUrl" value="/iac" />
                <c:url var="iacImg" value="/images/iac.jpg" />
                <div class="service-card">
                  <div class="service-cover" style="background-image:url('${iacImg}');"></div>
                  <div class="service-content">
                    <div class="service-pill">Terraform • Automation</div>
                    <div class="service-title">Infrastructure as Code</div>
                    <div class="service-desc">Repeatable environments with IaC and governance.</div>
                    <a class="service-link" href="${iacUrl}">Learn more →</a>
                  </div>
                </div>

                <c:url var="cyberUrl" value="/cybersecurity" />
                <c:url var="cyberImg" value="/images/cybersecurity.jpg" />
                <div class="service-card" style="grid-column:1 / -1;">
                  <div class="service-cover" style="background-image:url('${cyberImg}');"></div>
                  <div class="service-content">
                    <div class="service-pill">Threat • Defense</div>
                    <div class="service-title">Cybersecurity Solutions</div>
                    <div class="service-desc">Vulnerability reduction, IAM hardening, and incident readiness.</div>
                    <a class="service-link" href="${cyberUrl}">Learn more →</a>
                  </div>
                </div>

              </div>
            </section>

            <aside class="card">
              <h2>Why Fusisoft?</h2>
              <p>We build systems that can be run and supported confidently long-term.</p>

              <div class="alert">
                <strong>Fast delivery</strong><br />
                Automation-first approach to reduce manual work and human error.
              </div>

              <div class="alert" style="margin-top:12px;">
                <strong>Reliable operations</strong><br />
                Observability, SLOs, and incident patterns that reduce downtime.
              </div>

              <div class="alert" style="margin-top:12px;">
                <strong>Security built-in</strong><br />
                Shift-left security and compliance as code.
              </div>

              <div class="cta" style="margin-top:14px;">
                <c:url var="contactUrl" value="/contact" />
                <a class="btn btn-primary" href="${contactUrl}">Contact Us</a>
              </div>
            </aside>
          </main>

          <%@ include file="fragments/footer.jspf" %>
      </div>
    </body>

    </html>