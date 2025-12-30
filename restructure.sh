#!/usr/bin/env bash
set -euo pipefail

echo "==> Creating UI folders"
mkdir -p src/main/webapp/styles
mkdir -p src/main/webapp/js
mkdir -p src/main/webapp/WEB-INF/jsps/fragments
mkdir -p src/main/java/com/mt/controllers

echo "==> Writing styles/main.css"
cat > src/main/webapp/styles/main.css <<'CSS'
:root{
  --bg:#0b1220;
  --bg2:#070b14;
  --card:rgba(255,255,255,.06);
  --border:rgba(255,255,255,.12);
  --text:rgba(255,255,255,.92);
  --muted:rgba(255,255,255,.70);
  --brand:#4f8cff;
  --brand2:#2f6dff;
  --danger:#ff4d4f;
  --success:#2dd4bf;
  --warning:#fbbf24;
  --shadow:0 18px 60px rgba(0,0,0,.35);
  --radius:18px;
  --radius-sm:14px;
  --container:1180px;
  --gap:18px;
  --font:ui-sans-serif,system-ui,-apple-system,Segoe UI,Roboto,Arial,"Apple Color Emoji","Segoe UI Emoji";
}

*{box-sizing:border-box;}
html,body{height:100%;}
body{
  margin:0;
  font-family:var(--font);
  color:var(--text);
  background:
    radial-gradient(1200px 700px at 20% 10%, rgba(79,140,255,.25), transparent 55%),
    radial-gradient(900px 600px at 80% 30%, rgba(47,109,255,.18), transparent 55%),
    linear-gradient(180deg, var(--bg2), var(--bg));
  min-height:100vh;
}
a{color:inherit;text-decoration:none;}
a:hover{text-decoration:underline;filter:brightness(1.08);}

.container{
  width:min(var(--container),100%);
  margin:0 auto;
  padding:24px 18px 56px;
}

.topbar{
  display:flex;
  align-items:center;
  justify-content:space-between;
  gap:12px;
  padding:12px 0 18px;
}

.brand{
  display:flex;
  align-items:center;
  gap:12px;
  font-weight:900;
  letter-spacing:.2px;
}

.brand-mark{
  width:42px;height:42px;
  border-radius:14px;
  background:linear-gradient(135deg,var(--brand),var(--brand2));
  box-shadow:0 14px 30px rgba(47,109,255,.25);
  display:grid;
  place-items:center;
  color:white;
  font-weight:900;
}

.brand small{
  display:block;
  color:var(--muted);
  font-weight:650;
  margin-top:2px;
}

.nav{
  display:flex;
  gap:10px;
  flex-wrap:wrap;
  justify-content:flex-end;
}
.nav a{
  padding:10px 12px;
  border-radius:12px;
  border:1px solid rgba(255,255,255,.12);
  background:rgba(255,255,255,.05);
  color:rgba(255,255,255,.88);
}
.nav a[aria-current="page"]{
  border-color:rgba(79,140,255,.45);
  box-shadow:0 0 0 3px rgba(79,140,255,.15);
}

.hero, .card{
  border:1px solid var(--border);
  background:var(--card);
  border-radius:var(--radius);
  box-shadow:var(--shadow);
  backdrop-filter:blur(10px);
}

.hero{padding:26px;position:relative;overflow:hidden;}
.hero h1{
  margin:0;
  font-size:clamp(28px,3.6vw,44px);
  line-height:1.08;
  letter-spacing:.2px;
}
.hero p{
  margin:12px 0 0;
  color:var(--muted);
  max-width:78ch;
  font-size:15px;
  line-height:1.6;
}

.grid{
  margin-top:18px;
  display:grid;
  grid-template-columns:1.2fr .8fr;
  gap:var(--gap);
  align-items:start;
}
@media(max-width:920px){
  .grid{grid-template-columns:1fr;}
}

.card{padding:18px;}
.card h2{margin:0 0 8px;font-size:18px;}
.card p{margin:0 0 12px;color:var(--muted);line-height:1.6;font-size:14px;}

.features{
  display:grid;
  grid-template-columns:1fr 1fr;
  gap:12px;
  margin-top:10px;
}
@media(max-width:640px){
  .features{grid-template-columns:1fr;}
}
.feature{
  border:1px solid rgba(255,255,255,.12);
  background:rgba(255,255,255,.05);
  border-radius:14px;
  padding:12px;
}
.feature strong{display:block;margin-bottom:6px;}
.feature span{display:block;color:var(--muted);font-size:13px;line-height:1.45;}

.cta{
  margin-top:18px;
  display:flex;
  gap:12px;
  flex-wrap:wrap;
  align-items:center;
}

.btn{
  appearance:none;
  border:0;
  cursor:pointer;
  border-radius:12px;
  padding:12px 14px;
  font-weight:850;
  text-decoration:none;
  display:inline-flex;
  align-items:center;
  justify-content:center;
  min-width:180px;
  user-select:none;
  transition:transform .05s ease, filter .15s ease;
}
.btn:active{transform:translateY(1px);}
.btn-primary{
  color:white;
  background:linear-gradient(135deg,var(--brand),var(--brand2));
  box-shadow:0 14px 30px rgba(47,109,255,.25);
}
.btn-primary:hover{filter:brightness(1.05);}
.btn-ghost{
  color:rgba(255,255,255,.88);
  background:rgba(255,255,255,.06);
  border:1px solid rgba(255,255,255,.14);
}
.btn-ghost:hover{filter:brightness(1.08);}

.form{display:grid;gap:12px;margin-top:8px;}
.label{font-weight:750;font-size:14px;}
.input,.textarea{
  width:100%;
  padding:10px 12px;
  border-radius:12px;
  border:1px solid rgba(255,255,255,.16);
  background:rgba(0,0,0,.20);
  color:var(--text);
  outline:none;
}
.input:focus,.textarea:focus{
  border-color:rgba(79,140,255,.55);
  box-shadow:0 0 0 3px rgba(79,140,255,.15);
}
.help{font-size:12px;color:var(--muted);margin-top:-6px;}

.alert{
  border-radius:14px;
  padding:12px;
  border:1px solid rgba(255,255,255,.14);
  background:rgba(255,255,255,.05);
  font-size:13px;
}
.alert-danger{border-color:rgba(255,77,79,.35);background:rgba(255,77,79,.12);}
.alert-success{border-color:rgba(45,212,191,.35);background:rgba(45,212,191,.12);}

.kpi{
  display:flex;
  gap:10px;
  flex-wrap:wrap;
  margin-top:12px;
}
.kpi .pill{
  padding:8px 10px;
  border-radius:999px;
  border:1px solid rgba(255,255,255,.12);
  background:rgba(255,255,255,.05);
  color:rgba(255,255,255,.86);
  font-size:12px;
  font-weight:700;
}

.table{
  width:100%;
  border-collapse:collapse;
  overflow:hidden;
  border-radius:14px;
  border:1px solid rgba(255,255,255,.12);
}
.table th,.table td{
  padding:12px;
  border-bottom:1px solid rgba(255,255,255,.10);
  font-size:13px;
}
.table th{
  text-align:left;
  color:rgba(255,255,255,.86);
  background:rgba(255,255,255,.05);
}
.table td{color:rgba(255,255,255,.82);}

.footer{
  margin-top:18px;
  color:var(--muted);
  font-size:13px;
  text-align:center;
}
CSS

echo "==> Writing js/main.js"
cat > src/main/webapp/js/main.js <<'JS'
(function () {
  // Highlight nav link based on current path
  const path = window.location.pathname;
  document.querySelectorAll(".nav a").forEach(a => {
    const href = a.getAttribute("href");
    if (!href) return;
    if (path === href || (href !== "/" && path.endsWith(href))) {
      a.setAttribute("aria-current", "page");
    }
  });

  // Smooth scroll for internal anchors
  document.querySelectorAll('a[href^="#"]').forEach(a => {
    a.addEventListener("click", (e) => {
      const id = a.getAttribute("href");
      const el = document.querySelector(id);
      if (!el) return;
      e.preventDefault();
      el.scrollIntoView({behavior: "smooth", block: "start"});
      history.replaceState(null, "", id);
    });
  });
})();
JS

echo "==> Writing JSP fragments (header/footer)"
cat > src/main/webapp/WEB-INF/jsps/fragments/header.jspf <<'JSP'
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="cssMain" value="/styles/main.css"/>
<c:url var="jsMain" value="/js/main.js"/>
<link rel="stylesheet" href="${cssMain}"/>
<script defer src="${jsMain}"></script>

<c:url var="homeUrl" value="/"/>
<c:url var="contactUrl" value="/contact"/>
<c:url var="devopsUrl" value="/devops"/>
<c:url var="sreUrl" value="/sre"/>
<c:url var="devsecopsUrl" value="/devsecops"/>
<c:url var="iacUrl" value="/iac"/>
<c:url var="cyberUrl" value="/cybersecurity"/>
<c:url var="loginUrl" value="/login"/>
<c:url var="dashboardUrl" value="/dashboard"/>

<div class="topbar">
  <a class="brand" href="${homeUrl}">
    <span class="brand-mark" aria-hidden="true">F</span>
    <span>
      Fusisoft Technologies
      <small>IT Consulting & Engineering</small>
    </span>
  </a>

  <nav class="nav" aria-label="Primary navigation">
    <a href="${homeUrl}">Home</a>
    <a href="${devopsUrl}">DevOps</a>
    <a href="${sreUrl}">SRE</a>
    <a href="${devsecopsUrl}">DevSecOps</a>
    <a href="${iacUrl}">IaC</a>
    <a href="${cyberUrl}">Cybersecurity</a>
    <a href="${contactUrl}">Contact</a>
    <a href="${loginUrl}">Admin</a>
  </nav>
</div>
JSP

cat > src/main/webapp/WEB-INF/jsps/fragments/footer.jspf <<'JSP'
<div class="footer">
  <div>Fusisoft Technologies — Innovating IT Solutions for the Future</div>
  <div style="margin-top:8px;">&copy; 2026 Fusisoft Technologies</div>
</div>
JSP

echo "==> Writing Controllers for service pages (if not present)"
cat > src/main/java/com/mt/controllers/ServicesController.java <<'JAVA'
package com.mt.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Simple page routing controller:
 * view names map to /WEB-INF/jsps/<view>.jsp (via InternalResourceViewResolver)
 */
@Controller
public class ServicesController {

    @GetMapping("/devops")
    public String devops() { return "devops-consulting"; }

    @GetMapping("/sre")
    public String sre() { return "sre"; }

    @GetMapping("/devsecops")
    public String devsecops() { return "devsecops"; }

    @GetMapping("/iac")
    public String iac() { return "iac"; }

    @GetMapping("/cybersecurity")
    public String cybersecurity() { return "cybersecurity"; } // create JSP if needed
}
JAVA

echo "==> Updating JSPs (home/contact/service pages/login/dashboard/success pages)"

# HOME
cat > src/main/webapp/WEB-INF/jsps/home.jsp <<'JSP'
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
JSP

# CONTACT
cat > src/main/webapp/WEB-INF/jsps/contact.jsp <<'JSP'
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Contact — Fusisoft Technologies</title>
</head>
<body>
  <div class="container">
    <%@ include file="fragments/header.jspf" %>

    <header class="hero">
      <h1>Contact Us</h1>
      <p>Tell us about your project. We’ll respond with next steps and a clear plan.</p>
    </header>

    <main class="grid">
      <section class="card">
        <h2>Project Details</h2>

        <c:url var="submitUrl" value="/contact"/>
        <form class="form" action="${submitUrl}" method="post">
          <label class="label" for="name">Name</label>
          <input class="input" id="name" name="name" type="text" required/>

          <label class="label" for="phone">Phone</label>
          <input class="input" id="phone" name="phone" type="tel" required/>

          <label class="label" for="email">Email</label>
          <input class="input" id="email" name="email" type="email" required/>

          <label class="label" for="message">Project Details</label>
          <textarea class="textarea" id="message" name="message" rows="5" required></textarea>

          <div class="help">We’ll never share your details. This is strictly for project coordination.</div>

          <button class="btn btn-primary" type="submit">Submit</button>
        </form>
      </section>

      <aside class="card">
        <h2>What happens next?</h2>
        <p>After you submit, we’ll review your request and reach out with options.</p>

        <div class="features">
          <div class="feature">
            <strong>1) Quick review</strong>
            <span>We confirm scope and timeline.</span>
          </div>
          <div class="feature">
            <strong>2) Proposal</strong>
            <span>We share approach and deliverables.</span>
          </div>
          <div class="feature">
            <strong>3) Implementation</strong>
            <span>We deliver with your team.</span>
          </div>
          <div class="feature">
            <strong>4) Handover</strong>
            <span>Runbooks and operational readiness.</span>
          </div>
        </div>
      </aside>
    </main>

    <%@ include file="fragments/footer.jspf" %>
  </div>
</body>
</html>
JSP

# SUCCESS (contactSuccess.jsp)
cat > src/main/webapp/WEB-INF/jsps/successContact.jsp <<'JSP'
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Success — Fusisoft Technologies</title>
</head>
<body>
  <div class="container">
    <%@ include file="fragments/header.jspf" %>

    <div class="card" style="text-align:center; padding:26px;">
      <div class="alert alert-success" style="display:inline-block; text-align:left;">
        <strong>Submitted successfully.</strong><br/>
        We’ll review your request and get back to you shortly.
      </div>

      <h2 style="margin-top:16px;">Thank you<c:if test="${not empty sessionScope.contactName}">, ${sessionScope.contactName}</c:if>!</h2>
      <p style="color:rgba(255,255,255,.82); line-height:1.6;">
        Your project details have been received. If urgent, include timelines and constraints in your message.
      </p>

      <div class="cta" style="justify-content:center;">
        <c:url var="homeUrl" value="/"/>
        <a class="btn btn-primary" href="${homeUrl}">Back to Home</a>
        <c:url var="contactUrl" value="/contact"/>
        <a class="btn btn-ghost" href="${contactUrl}">Submit Another</a>
      </div>
    </div>

    <%@ include file="fragments/footer.jspf" %>
  </div>
</body>
</html>
JSP

# CONTACT CONFIRMATION (keep as separate page if you still use it)
cat > src/main/webapp/WEB-INF/jsps/contactConfirmation.jsp <<'JSP'
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Contact Submitted — Fusisoft Technologies</title>
</head>
<body>
  <div class="container">
    <%@ include file="fragments/header.jspf" %>

    <div class="card" style="padding:22px;">
      <h2>Thank You!</h2>
      <p style="color:rgba(255,255,255,.82); line-height:1.6;">
        Dear <strong><c:out value="${sessionScope.contactName}" default="Customer"/></strong>,
        thank you for reaching out. We have received your request and will respond shortly.
      </p>

      <div class="cta">
        <c:url var="homeUrl" value="/"/>
        <a class="btn btn-primary" href="${homeUrl}">Return Home</a>
        <c:url var="contactUrl" value="/contact"/>
        <a class="btn btn-ghost" href="${contactUrl}">Submit Another Request</a>
      </div>
    </div>

    <%@ include file="fragments/footer.jspf" %>
  </div>
</body>
</html>
JSP

# SERVICE PAGES
write_service_page() {
  local view="$1"
  local title="$2"
  local subtitle="$3"
  local bullets="$4"

  cat > "src/main/webapp/WEB-INF/jsps/${view}.jsp" <<JSP
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>${title} — Fusisoft Technologies</title>
</head>
<body>
  <div class="container">
    <%@ include file="fragments/header.jspf" %>

    <header class="hero">
      <h1>${title}</h1>
      <p>${subtitle}</p>
      <div class="cta">
        <c:url var="contactUrl" value="/contact"/>
        <a class="btn btn-primary" href="\${contactUrl}">Talk to Us</a>
        <a class="btn btn-ghost" href="#details">Learn More</a>
      </div>
    </header>

    <main class="grid" id="details">
      <section class="card">
        <h2>What we deliver</h2>
        <p>We focus on measurable outcomes with implementation-ready deliverables.</p>

        <div class="features" role="list">
          ${bullets}
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
          <a class="btn btn-primary" href="\${contactUrl}">Request a Consultation</a>
        </div>
      </aside>
    </main>

    <%@ include file="fragments/footer.jspf" %>
  </div>
</body>
</html>
JSP
}

write_service_page "devops-consulting" "DevOps Consulting" \
"Optimizing development pipelines for faster, reliable deployments—with automation and observability built in." \
'<div class="feature" role="listitem"><strong>CI/CD Pipelines</strong><span>Automated builds, tests, quality gates, and safe releases.</span></div>
 <div class="feature" role="listitem"><strong>Containers & Kubernetes</strong><span>Packaging, orchestration strategy, and production readiness.</span></div>
 <div class="feature" role="listitem"><strong>Infrastructure Automation</strong><span>Terraform/CloudFormation + reusable modules and patterns.</span></div>
 <div class="feature" role="listitem"><strong>Observability</strong><span>Logs, metrics, tracing, alerting, and incident workflows.</span></div>'

write_service_page "sre" "Site Reliability Engineering (SRE)" \
"Building reliable, scalable systems using SLOs, error budgets, and automation." \
'<div class="feature" role="listitem"><strong>Incident Response</strong><span>Runbooks, on-call practices, and reduced MTTR.</span></div>
 <div class="feature" role="listitem"><strong>Monitoring & Alerting</strong><span>Signal-based alerting and actionable dashboards.</span></div>
 <div class="feature" role="listitem"><strong>SLOs & Error Budgets</strong><span>Reliability targets aligned with business goals.</span></div>
 <div class="feature" role="listitem"><strong>Capacity & Performance</strong><span>Load testing, tuning, and resilience patterns.</span></div>'

write_service_page "devsecops" "DevSecOps Integration" \
"Embedding security into every stage of development—secure from day one." \
'<div class="feature" role="listitem"><strong>Security Testing</strong><span>SAST/DAST, dependency scanning, and policy gates.</span></div>
 <div class="feature" role="listitem"><strong>Secrets & IAM</strong><span>Least privilege, secrets management, and key rotation.</span></div>
 <div class="feature" role="listitem"><strong>Compliance as Code</strong><span>Auditable controls through automation and templates.</span></div>
 <div class="feature" role="listitem"><strong>Container/Cloud Security</strong><span>Hardening, runtime controls, and posture management.</span></div>'

write_service_page "iac" "Infrastructure as Code (IaC)" \
"Automating cloud infrastructure with code—repeatable, scalable, and safe." \
'<div class="feature" role="listitem"><strong>Terraform / CloudFormation</strong><span>Reusable modules, environments, and best practices.</span></div>
 <div class="feature" role="listitem"><strong>Drift & Governance</strong><span>Detect drift, enforce standards, and reduce manual changes.</span></div>
 <div class="feature" role="listitem"><strong>DR Automation</strong><span>Backups, replication, and recovery workflows.</span></div>
 <div class="feature" role="listitem"><strong>CI/CD for Infrastructure</strong><span>Plan/apply workflows with approvals and safety checks.</span></div>'

echo "==> login.jsp"
cat > src/main/webapp/WEB-INF/jsps/login.jsp <<'JSP'
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin Login — Fusisoft Technologies</title>
</head>
<body>
  <div class="container">
    <%@ include file="fragments/header.jspf" %>

    <div class="card" style="max-width:520px; margin:0 auto;">
      <h2>Admin Login</h2>
      <p style="color:rgba(255,255,255,.78); margin-top:-2px;">
        Sign in to view admin dashboard.
      </p>

      <c:if test="${param.error eq 'true'}">
        <div class="alert alert-danger">
          Invalid credentials. Please try again.
        </div>
      </c:if>

      <c:url var="loginAction" value="/login"/>
      <form class="form" action="${loginAction}" method="post">
        <label class="label" for="email">Email</label>
        <input class="input" type="email" id="email" name="email" required/>

        <label class="label" for="password">Password</label>
        <input class="input" type="password" id="password" name="password" required/>

        <button class="btn btn-primary" type="submit">Login</button>

        <div class="help">Tip: Set ADMIN_EMAIL and ADMIN_PASSWORD environment variables if needed.</div>
      </form>
    </div>

    <%@ include file="fragments/footer.jspf" %>
  </div>
</body>
</html>
JSP

echo "==> dashboard.jsp"
cat > src/main/webapp/WEB-INF/jsps/dashboard.jsp <<'JSP'
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty sessionScope.user}">
  <c:redirect url="/login"/>
</c:if>

<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin Dashboard — Fusisoft Technologies</title>
</head>
<body>
  <div class="container">
    <%@ include file="fragments/header.jspf" %>

    <header class="hero">
      <h1>Admin Dashboard</h1>
      <p>Welcome, <strong><c:out value="${sessionScope.user}"/></strong>. View submissions and manage requests.</p>
      <div class="cta">
        <c:url var="logoutUrl" value="/logout"/>
        <a class="btn btn-ghost" href="${logoutUrl}">Logout</a>
      </div>
    </header>

    <div class="card">
      <h2>Submissions</h2>
      <p>This table is a placeholder. Next step is to query your DB and render rows.</p>

      <table class="table" aria-label="Submitted contact requests">
        <thead>
          <tr>
            <th>Date</th>
            <th>Name</th>
            <th>Email</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>—</td>
            <td>—</td>
            <td>—</td>
            <td>—</td>
          </tr>
        </tbody>
      </table>
    </div>

    <%@ include file="fragments/footer.jspf" %>
  </div>
</body>
</html>
JSP

echo ""
echo "✅ Enhancement complete."
echo "Next: ensure mt-servlet.xml serves /styles/** and /js/** and view resolver points to /WEB-INF/jsps/"
echo "Then run: mvn clean package"

