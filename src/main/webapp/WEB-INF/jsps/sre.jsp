<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!doctype html>
    <html lang="en">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Site Reliability Engineering — Fusisoft Technologies</title>
    </head>

    <body>
      <div class="container">
        <%@ include file="fragments/header.jspf" %>

          <c:url var="heroImg" value="/images/sre.jpg" />
          <header class="hero glass">
            <div class="hero-bg" style="background-image:url('${heroImg}');"></div>
            <h1>Site Reliability Engineering (SRE)</h1>
            <p>Reliability systems: SLOs, incident response, monitoring, and resilience improvements.</p>
            <div class="cta">
              <c:url var="contactUrl" value="/contact" />
              <a class="btn btn-primary" href="${contactUrl}">Request a Consultation</a>
              <c:url var="homeUrl" value="/" />
              <a class="btn btn-ghost" href="${homeUrl}">Back to Home</a>
            </div>
          </header>

          <main class="grid">
            <section class="card glass">
              <h2>What we deliver</h2>
              <p>Operational patterns that reduce downtime and improve customer experience.</p>

              <div class="services">
                <div class="service-card">
                  <div class="service-content">
                    <div class="service-pill">SLO</div>
                    <div class="service-title">Reliability Targets</div>
                    <div class="service-desc">Align reliability with business value.</div>
                  </div>
                </div>

                <div class="service-card">
                  <div class="service-content">
                    <div class="service-pill">On-call</div>
                    <div class="service-title">Incident Response</div>
                    <div class="service-desc">Reduce MTTR with runbooks and automation.</div>
                  </div>
                </div>

                <div class="service-card">
                  <div class="service-content">
                    <div class="service-pill">Signals</div>
                    <div class="service-title">Monitoring</div>
                    <div class="service-desc">Alerting that is actionable and low-noise.</div>
                  </div>
                </div>

                <div class="service-card">
                  <div class="service-content">
                    <div class="service-pill">Resilience</div>
                    <div class="service-title">Performance</div>
                    <div class="service-desc">Capacity planning, load testing, tuning.</div>
                  </div>
                </div>
              </div>
            </section>

            <aside class="card glass">
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
