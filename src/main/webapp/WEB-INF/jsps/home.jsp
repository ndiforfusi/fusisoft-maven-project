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
          <header class="hero glass" data-reveal>
            <div class="hero-bg" style="background-image:url('${heroImg}');"></div>

            <div class="hero-badge"><i class="fa-solid fa-wand-magic-sparkles"></i> Magical engineering, measurable outcomes</div>
            <h1>Build. Secure. Scale.<br />Operate with confidence.</h1>
            <p>
              Fusisoft Technologies delivers modern IT engineering that accelerates delivery, increases reliability,
              and embeds security into every phase—without sacrificing quality.
            </p>
            <ul class="hero-highlights">
              <li><i class="fa-solid fa-bolt"></i> Release with confidence through automation + governance.</li>
              <li><i class="fa-solid fa-eye"></i> Full-stack visibility from pipeline to production.</li>
              <li><i class="fa-solid fa-shield-heart"></i> Security baked in, not bolted on.</li>
            </ul>

            <div class="cta">
              <c:url var="contactUrl" value="/contact" />
              <a class="btn btn-primary" href="${contactUrl}">
                <i class="fa-solid fa-rocket"></i> Start a Project
              </a>

              <c:url var="cyberUrl" value="/cybersecurity" />
              <a class="btn btn-ghost" href="${cyberUrl}">
                <i class="fa-solid fa-shield-halved"></i> Security First
              </a>
            </div>
          </header>

          <main class="grid">
            <section class="card glass" data-reveal>
              <h2><i class="fa-solid fa-layer-group"></i> Our Core Services</h2>
              <p>Explore the services we offer with a premium design system and consistent experience.</p>

              <div class="services">
                <c:url var="devopsUrl" value="/devops" />
                <c:url var="devopsImg" value="/images/devops.jpg" />
                <div class="service-card" data-reveal>
                  <div class="service-cover" style="background-image:url('${devopsImg}');"></div>
                  <div class="service-content">
                    <div class="service-pill"><i class="fa-solid fa-infinity"></i>&nbsp; Delivery • Automation</div>
                    <div class="service-title">DevOps Consulting</div>
                    <div class="service-desc">CI/CD pipelines, automation, containerization, and faster releases.</div>
                    <a class="service-link" href="${devopsUrl}">
                      Learn more <i class="fa-solid fa-arrow-right"></i>
                    </a>
                  </div>
                </div>

                <c:url var="sreUrl" value="/sre" />
                <c:url var="sreImg" value="/images/sre.jpg" />
                <div class="service-card" data-reveal>
                  <div class="service-cover" style="background-image:url('${sreImg}');"></div>
                  <div class="service-content">
                    <div class="service-pill"><i class="fa-solid fa-heart-pulse"></i>&nbsp; Reliability</div>
                    <div class="service-title">SRE</div>
                    <div class="service-desc">SLOs, observability, incident response, resilience engineering.</div>
                    <a class="service-link" href="${sreUrl}">
                      Learn more <i class="fa-solid fa-arrow-right"></i>
                    </a>
                  </div>
                </div>

                <c:url var="devsecopsUrl" value="/devsecops" />
                <c:url var="devsecopsImg" value="/images/devsecops.jpg" />
                <div class="service-card" data-reveal>
                  <div class="service-cover" style="background-image:url('${devsecopsImg}');"></div>
                  <div class="service-content">
                    <div class="service-pill"><i class="fa-solid fa-shield-halved"></i>&nbsp; Security • Compliance
                    </div>
                    <div class="service-title">DevSecOps</div>
                    <div class="service-desc">Shift-left security and compliance as code across your pipeline.</div>
                    <a class="service-link" href="${devsecopsUrl}">
                      Learn more <i class="fa-solid fa-arrow-right"></i>
                    </a>
                  </div>
                </div>

                <c:url var="iacUrl" value="/iac" />
                <c:url var="iacImg" value="/images/iac.jpg" />
                <div class="service-card" data-reveal>
                  <div class="service-cover" style="background-image:url('${iacImg}');"></div>
                  <div class="service-content">
                    <div class="service-pill"><i class="fa-solid fa-code"></i>&nbsp; Terraform • Automation</div>
                    <div class="service-title">Infrastructure as Code</div>
                    <div class="service-desc">Repeatable environments, drift control, and governed automation.</div>
                    <a class="service-link" href="${iacUrl}">
                      Learn more <i class="fa-solid fa-arrow-right"></i>
                    </a>
                  </div>
                </div>

                <c:url var="cyberUrl2" value="/cybersecurity" />
                <c:url var="cyberImg" value="/images/cybersecurity.jpg" />
                <div class="service-card" style="grid-column:1 / -1;" data-reveal>
                  <div class="service-cover" style="background-image:url('${cyberImg}');"></div>
                  <div class="service-content">
                    <div class="service-pill"><i class="fa-solid fa-user-shield"></i>&nbsp; Threat • Defense</div>
                    <div class="service-title">Cybersecurity</div>
                    <div class="service-desc">Hardening, IAM, scanning, threat detection, and incident readiness.</div>
                    <a class="service-link" href="${cyberUrl2}">
                      Learn more <i class="fa-solid fa-arrow-right"></i>
                    </a>
                  </div>
                </div>
              </div>
            </section>

            <aside class="card glass" data-reveal>
              <h2><i class="fa-solid fa-star"></i> Why Fusisoft?</h2>
              <p>Modern engineering, measurable outcomes, and operational excellence.</p>

              <div class="alert"><strong><i class="fa-solid fa-bolt"></i> Faster delivery</strong><br />Reduce manual
                work and speed up releases.</div>
              <div class="alert" style="margin-top:12px;"><strong><i class="fa-solid fa-chart-line"></i> Reliable
                  operations</strong><br />SLOs + observability that reduces downtime.</div>
              <div class="alert" style="margin-top:12px;"><strong><i class="fa-solid fa-lock"></i> Security
                  built-in</strong><br />Shift-left controls and hardened runtime.</div>

              <div class="cta" style="margin-top:14px;">
                <c:url var="contactUrl" value="/contact" />
                <a class="btn btn-primary" href="${contactUrl}">
                  <i class="fa-solid fa-envelope"></i> Contact Us
                </a>
              </div>
            </aside>
          </main>

          <section class="card glass" data-reveal style="margin-top:18px;">
            <div class="card-header">
              <h2><i class="fa-solid fa-stars"></i> The Fusisoft Magic</h2>
              <span class="pill"><i class="fa-solid fa-sparkles"></i> Crafted Experiences</span>
            </div>
            <p>We blend strategy, automation, and empathy to create experiences that feel effortless for your teams.</p>
            <div class="stat-grid">
              <div class="stat">
                <strong>2-4x</strong>
                Release velocity with automated pipelines and quality gates.
              </div>
              <div class="stat">
                <strong>99.95%</strong>
                Availability targets supported by SRE workflows and runbooks.
              </div>
              <div class="stat">
                <strong>Zero-Trust</strong>
                Security posture guided by continuous verification.
              </div>
            </div>
          </section>

          <%@ include file="fragments/footer.jspf" %>
      </div>
    </body>

    </html>
