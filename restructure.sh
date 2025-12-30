#!/usr/bin/env bash
set -euo pipefail

echo "==> Creating directories"
mkdir -p src/main/webapp/images
mkdir -p src/main/webapp/styles
mkdir -p src/main/webapp/js
mkdir -p src/main/webapp/WEB-INF/jsps/fragments

echo "==> Copying provided images into webapp/images/"
cp -f /mnt/data/devops.jpg         src/main/webapp/images/devops.jpg
cp -f /mnt/data/sre.jpg            src/main/webapp/images/sre.jpg
cp -f /mnt/data/devsecops.jpg      src/main/webapp/images/devsecops.jpg
cp -f /mnt/data/iac.jpg            src/main/webapp/images/iac.jpg
cp -f /mnt/data/cybersecurity.jpg  src/main/webapp/images/cybersecurity.jpg
cp -f /mnt/data/asasoft_logo.png   src/main/webapp/images/asasoft_logo.png
cp -f /mnt/data/Logo-principal.jpg src/main/webapp/images/Logo-principal.jpg

# -------------------------
# Modern CSS (premium look)
# -------------------------
echo "==> Writing styles/main.css"
cat > src/main/webapp/styles/main.css <<'CSS'
:root{
  --bg0:#060915;
  --bg1:#0b1228;
  --card:rgba(255,255,255,.06);
  --card2:rgba(255,255,255,.08);
  --border:rgba(255,255,255,.12);
  --text:rgba(255,255,255,.92);
  --muted:rgba(255,255,255,.70);
  --brand:#4f8cff;
  --brand2:#2f6dff;
  --good:#2dd4bf;
  --bad:#ff4d4f;
  --shadow:0 24px 80px rgba(0,0,0,.35);
  --radius:20px;
  --radius2:16px;
  --container:1200px;
  --font:ui-sans-serif,system-ui,-apple-system,Segoe UI,Roboto,Arial,"Apple Color Emoji","Segoe UI Emoji";
}

*{box-sizing:border-box}
html,body{height:100%}
body{
  margin:0;
  font-family:var(--font);
  color:var(--text);
  background:
    radial-gradient(1200px 700px at 20% 10%, rgba(79,140,255,.22), transparent 55%),
    radial-gradient(900px 600px at 80% 30%, rgba(47,109,255,.16), transparent 55%),
    linear-gradient(180deg, var(--bg0), var(--bg1));
  min-height:100vh;
}
a{color:inherit;text-decoration:none}
a:hover{filter:brightness(1.08);text-decoration:none}

.container{width:min(var(--container),100%);margin:0 auto;padding:22px 16px 56px}

.topbar{
  display:flex;align-items:center;justify-content:space-between;gap:12px;
  padding:10px 0 18px;
}
.brand{
  display:flex;align-items:center;gap:12px;font-weight:900;letter-spacing:.2px;
}
.brand img{
  width:44px;height:44px;border-radius:14px;object-fit:cover;
  box-shadow:0 14px 34px rgba(47,109,255,.22);
  border:1px solid rgba(255,255,255,.12);
  background:rgba(255,255,255,.05);
}
.brand small{display:block;color:var(--muted);font-weight:650;margin-top:2px}

.nav{display:flex;gap:10px;flex-wrap:wrap;justify-content:flex-end}
.nav a{
  padding:10px 12px;border-radius:12px;
  border:1px solid rgba(255,255,255,.12);
  background:rgba(255,255,255,.05);
  color:rgba(255,255,255,.88);
  transition:transform .06s ease, filter .15s ease, border-color .15s ease;
}
.nav a:hover{transform:translateY(-1px)}
.nav a[aria-current="page"]{
  border-color:rgba(79,140,255,.55);
  box-shadow:0 0 0 3px rgba(79,140,255,.16);
}

.glass{
  border:1px solid var(--border);
  background:var(--card);
  border-radius:var(--radius);
  box-shadow:var(--shadow);
  backdrop-filter:blur(12px);
}

.hero{
  position:relative;
  overflow:hidden;
  padding:28px;
}
.hero h1{
  margin:0;
  font-size:clamp(30px,4vw,48px);
  line-height:1.06;
  letter-spacing:.2px;
}
.hero p{
  margin:12px 0 0;
  color:var(--muted);
  max-width:85ch;
  font-size:15px;
  line-height:1.65;
}
.hero .cta{
  margin-top:16px;
  display:flex;gap:12px;flex-wrap:wrap;align-items:center;
}
.hero-bg{
  position:absolute;inset:0;
  background-size:cover;
  background-position:center;
  opacity:.22;
  filter:saturate(1.1) contrast(1.05);
  transform:scale(1.03);
}
.hero::after{
  content:"";
  position:absolute;inset:0;
  background:linear-gradient(90deg, rgba(6,9,21,.95), rgba(6,9,21,.66), rgba(6,9,21,.90));
}
.hero > *{position:relative;z-index:2}

.btn{
  appearance:none;border:0;cursor:pointer;border-radius:14px;
  padding:12px 14px;font-weight:900;text-decoration:none;
  display:inline-flex;align-items:center;justify-content:center;
  min-width:180px;user-select:none;
  transition:transform .06s ease, filter .15s ease;
}
.btn:active{transform:translateY(1px)}
.btn-primary{
  color:#fff;
  background:linear-gradient(135deg,var(--brand),var(--brand2));
  box-shadow:0 16px 36px rgba(47,109,255,.24);
}
.btn-primary:hover{filter:brightness(1.05)}
.btn-ghost{
  color:rgba(255,255,255,.88);
  background:rgba(255,255,255,.06);
  border:1px solid rgba(255,255,255,.14);
}
.btn-ghost:hover{filter:brightness(1.08)}

.grid{
  margin-top:18px;
  display:grid;grid-template-columns:1.25fr .75fr;
  gap:18px;align-items:start;
}
@media(max-width:940px){.grid{grid-template-columns:1fr}}

.card{
  border:1px solid var(--border);
  background:var(--card);
  border-radius:var(--radius);
  box-shadow:var(--shadow);
  backdrop-filter:blur(12px);
  padding:18px;
}

.card h2{margin:0 0 10px;font-size:18px}
.card p{margin:0 0 12px;color:var(--muted);line-height:1.6;font-size:14px}

.services{
  margin-top:8px;
  display:grid;
  grid-template-columns:1fr 1fr;
  gap:14px;
}
@media(max-width:680px){.services{grid-template-columns:1fr}}

.service-card{
  position:relative;
  overflow:hidden;
  border-radius:18px;
  border:1px solid rgba(255,255,255,.12);
  background:rgba(255,255,255,.05);
  min-height:190px;
  padding:14px;
  box-shadow:0 14px 40px rgba(0,0,0,.25);
  transition:transform .12s ease, filter .15s ease, border-color .15s ease;
}
.service-card:hover{transform:translateY(-2px);border-color:rgba(79,140,255,.40);filter:brightness(1.03)}
.service-cover{
  position:absolute;inset:0;
  background-size:cover;background-position:center;
  opacity:.34;
  transform:scale(1.05);
}
.service-card::after{
  content:"";
  position:absolute;inset:0;
  background:linear-gradient(180deg, rgba(6,9,21,.25), rgba(6,9,21,.85));
}
.service-content{position:relative;z-index:2}
.service-title{font-weight:950;font-size:18px;margin:0}
.service-desc{margin:8px 0 10px;color:rgba(255,255,255,.76);font-size:13.5px;line-height:1.5}
.service-link{
  display:inline-flex;gap:8px;align-items:center;
  font-weight:900;
  padding:10px 12px;border-radius:12px;
  background:rgba(255,255,255,.06);
  border:1px solid rgba(255,255,255,.14);
}
.service-link:hover{filter:brightness(1.08)}
.service-pill{
  display:inline-flex;
  font-size:11px;font-weight:900;letter-spacing:.2px;
  padding:6px 10px;border-radius:999px;
  border:1px solid rgba(255,255,255,.14);
  background:rgba(255,255,255,.06);
  color:rgba(255,255,255,.82);
  margin-bottom:8px;
}

.form{display:grid;gap:12px;margin-top:8px}
.label{font-weight:850;font-size:14px}
.input,.textarea{
  width:100%;padding:10px 12px;border-radius:14px;
  border:1px solid rgba(255,255,255,.16);
  background:rgba(0,0,0,.22);
  color:var(--text);outline:none;
}
.input:focus,.textarea:focus{
  border-color:rgba(79,140,255,.55);
  box-shadow:0 0 0 3px rgba(79,140,255,.16);
}
.help{font-size:12px;color:var(--muted);margin-top:-6px}

.alert{
  border-radius:16px;padding:12px;
  border:1px solid rgba(255,255,255,.14);
  background:rgba(255,255,255,.05);
  font-size:13px;
}
.alert-danger{border-color:rgba(255,77,79,.35);background:rgba(255,77,79,.12)}
.alert-success{border-color:rgba(45,212,191,.35);background:rgba(45,212,191,.12)}

.footer{
  margin-top:18px;
  color:var(--muted);
  font-size:13px;
  display:flex;gap:14px;flex-wrap:wrap;
  align-items:center;justify-content:space-between;
  padding:14px 16px;
}
.footer .logos{display:flex;gap:10px;align-items:center}
.footer img{height:26px;width:auto;opacity:.95}
.footer a{color:rgba(255,255,255,.80)}
CSS

# -------------------------
# JS (active nav highlight)
# -------------------------
echo "==> Writing js/main.js"
cat > src/main/webapp/js/main.js <<'JS'
(function () {
  const path = window.location.pathname;
  document.querySelectorAll(".nav a").forEach(a => {
    const href = a.getAttribute("href");
    if (!href) return;
    if (path === href || (href !== "/" && path.endsWith(href))) {
      a.setAttribute("aria-current", "page");
    }
  });
})();
JS

# -------------------------
# Header/Footer fragments
# -------------------------
echo "==> Writing fragments/header.jspf"
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

<c:url var="logoMain" value="/images/Logo-principal.jpg"/>

<div class="topbar">
  <a class="brand" href="${homeUrl}">
    <img src="${logoMain}" alt="Fusisoft Logo"/>
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

echo "==> Writing fragments/footer.jspf"
cat > src/main/webapp/WEB-INF/jsps/fragments/footer.jspf <<'JSP'
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="logoMain" value="/images/Logo-principal.jpg"/>
<c:url var="logoAlt" value="/images/asasoft_logo.png"/>

<div class="footer glass">
  <div>
    <div><strong>Fusisoft Technologies</strong> — Innovating IT Solutions for the Future</div>
    <div style="margin-top:6px;">&copy; 2026 Fusisoft Technologies</div>
  </div>

  <div class="logos">
    <img src="${logoMain}" alt="Fusisoft"/>
    <img src="${logoAlt}" alt="Fusisoft Alternate"/>
  </div>
</div>
JSP

# -------------------------
# Rewrite JSP pages to USE images
# -------------------------
echo "==> Writing enhanced /WEB-INF/jsps/home.jsp"
cat > src/main/webapp/WEB-INF/jsps/home.jsp <<'JSP'
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Fusisoft Technologies — IT Consulting & Engineering</title>
</head>
<body>
<div class="container">
  <%@ include file="fragments/header.jspf" %>

  <c:url var="heroImg" value="/images/devops.jpg"/>
  <header class="hero glass">
    <div class="hero-bg" style="background-image:url('${heroImg}');"></div>

    <h1>Modern IT engineering that delivers real outcomes.</h1>
    <p>
      We help organizations ship faster, operate reliably, and stay secure—through DevOps, SRE, DevSecOps,
      Infrastructure as Code, and Cybersecurity solutions.
    </p>

    <div class="cta">
      <c:url var="contactUrl" value="/contact"/>
      <a class="btn btn-primary" href="${contactUrl}">Start a Project</a>
      <c:url var="devopsUrl" value="/devops"/>
      <a class="btn btn-ghost" href="${devopsUrl}">Explore DevOps</a>
    </div>
  </header>

  <main class="grid" style="margin-top:18px;">
    <section class="card">
      <h2>Our Core Services</h2>
      <p>Each service page uses your custom imagery for a premium brand feel.</p>

      <div class="services">
        <c:url var="devopsUrl" value="/devops"/>
        <c:url var="devopsImg" value="/images/devops.jpg"/>
        <div class="service-card">
          <div class="service-cover" style="background-image:url('${devopsImg}');"></div>
          <div class="service-content">
            <div class="service-pill">Delivery • Automation</div>
            <div class="service-title">DevOps Consulting</div>
            <div class="service-desc">CI/CD pipelines, cloud automation, and deployment acceleration.</div>
            <a class="service-link" href="${devopsUrl}">Learn more →</a>
          </div>
        </div>

        <c:url var="sreUrl" value="/sre"/>
        <c:url var="sreImg" value="/images/sre.jpg"/>
        <div class="service-card">
          <div class="service-cover" style="background-image:url('${sreImg}');"></div>
          <div class="service-content">
            <div class="service-pill">Reliability • Observability</div>
            <div class="service-title">Site Reliability Engineering</div>
            <div class="service-desc">SLOs, monitoring, incident response, and resilient systems.</div>
            <a class="service-link" href="${sreUrl}">Learn more →</a>
          </div>
        </div>

        <c:url var="devsecopsUrl" value="/devsecops"/>
        <c:url var="devsecopsImg" value="/images/devsecops.jpg"/>
        <div class="service-card">
          <div class="service-cover" style="background-image:url('${devsecopsImg}');"></div>
          <div class="service-content">
            <div class="service-pill">Security • Compliance</div>
            <div class="service-title">DevSecOps Integration</div>
            <div class="service-desc">Security embedded into the pipeline—secure by design.</div>
            <a class="service-link" href="${devsecopsUrl}">Learn more →</a>
          </div>
        </div>

        <c:url var="iacUrl" value="/iac"/>
        <c:url var="iacImg" value="/images/iac.jpg"/>
        <div class="service-card">
          <div class="service-cover" style="background-image:url('${iacImg}');"></div>
          <div class="service-content">
            <div class="service-pill">Terraform • Automation</div>
            <div class="service-title">Infrastructure as Code</div>
            <div class="service-desc">Repeatable environments with IaC and governance.</div>
            <a class="service-link" href="${iacUrl}">Learn more →</a>
          </div>
        </div>

        <c:url var="cyberUrl" value="/cybersecurity"/>
        <c:url var="cyberImg" value="/images/cybersecurity.jpg"/>
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
        <strong>Fast delivery</strong><br/>
        Automation-first approach to reduce manual work and human error.
      </div>

      <div class="alert" style="margin-top:12px;">
        <strong>Reliable operations</strong><br/>
        Observability, SLOs, and incident patterns that reduce downtime.
      </div>

      <div class="alert" style="margin-top:12px;">
        <strong>Security built-in</strong><br/>
        Shift-left security and compliance as code.
      </div>

      <div class="cta" style="margin-top:14px;">
        <c:url var="contactUrl" value="/contact"/>
        <a class="btn btn-primary" href="${contactUrl}">Contact Us</a>
      </div>
    </aside>
  </main>

  <%@ include file="fragments/footer.jspf" %>
</div>
</body>
</html>
JSP

# Helper: write a service page with unique hero image
write_service_page () {
  local file="$1"
  local title="$2"
  local subtitle="$3"
  local img="$4"
  shift 4
  local blocks="$*"

  cat > "src/main/webapp/WEB-INF/jsps/${file}.jsp" <<JSP
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

  <c:url var="heroImg" value="/images/${img}"/>
  <header class="hero glass">
    <div class="hero-bg" style="background-image:url('\${heroImg}');"></div>
    <h1>${title}</h1>
    <p>${subtitle}</p>
    <div class="cta">
      <c:url var="contactUrl" value="/contact"/>
      <a class="btn btn-primary" href="\${contactUrl}">Request a Consultation</a>
      <c:url var="homeUrl" value="/"/>
      <a class="btn btn-ghost" href="\${homeUrl}">Back to Home</a>
    </div>
  </header>

  <main class="grid">
    <section class="card">
      <h2>What we deliver</h2>
      <p>Practical outcomes, implementation-ready deliverables, and operational success.</p>

      <div class="services">
        ${blocks}
      </div>
    </section>

    <aside class="card">
      <h2>Engagement options</h2>
      <p>Pick a model that fits your timeline and goals.</p>

      <div class="alert"><strong>Assessment</strong><br/>Current state + prioritized roadmap.</div>
      <div class="alert" style="margin-top:12px;"><strong>Implementation</strong><br/>Hands-on delivery with your team.</div>
      <div class="alert" style="margin-top:12px;"><strong>Enablement</strong><br/>Training, runbooks, and support handover.</div>

      <div class="cta" style="margin-top:14px;">
        <c:url var="contactUrl" value="/contact"/>
        <a class="btn btn-primary" href="\${contactUrl}">Start Here</a>
      </div>
    </aside>
  </main>

  <%@ include file="fragments/footer.jspf" %>
</div>
</body>
</html>
JSP
}

# Service blocks (image is already hero; these are content cards)
write_service_page "devops-consulting" "DevOps Consulting" \
"Optimize delivery with CI/CD automation, deployment safety, and observability." \
"devops.jpg" \
'<div class="service-card"><div class="service-content"><div class="service-pill">CI/CD</div><div class="service-title">Pipelines</div><div class="service-desc">Build, test, scan, and deploy with confidence.</div></div></div>
 <div class="service-card"><div class="service-content"><div class="service-pill">Containers</div><div class="service-title">Kubernetes</div><div class="service-desc">Packaging, orchestration, scaling and resilience.</div></div></div>
 <div class="service-card"><div class="service-content"><div class="service-pill">Automation</div><div class="service-title">Infrastructure</div><div class="service-desc">Repeatable environments with governance and versioning.</div></div></div>
 <div class="service-card"><div class="service-content"><div class="service-pill">Visibility</div><div class="service-title">Observability</div><div class="service-desc">Dashboards, alerts, tracing, and incident readiness.</div></div></div>'

write_service_page "sre" "Site Reliability Engineering (SRE)" \
"Reliability systems: SLOs, incident response, monitoring, and resilience improvements." \
"sre.jpg" \
'<div class="service-card"><div class="service-content"><div class="service-pill">SLO</div><div class="service-title">Reliability Targets</div><div class="service-desc">Align reliability with business value.</div></div></div>
 <div class="service-card"><div class="service-content"><div class="service-pill">On-call</div><div class="service-title">Incident Response</div><div class="service-desc">Reduce MTTR with runbooks and automation.</div></div></div>
 <div class="service-card"><div class="service-content"><div class="service-pill">Signals</div><div class="service-title">Monitoring</div><div class="service-desc">Alerting that is actionable and low-noise.</div></div></div>
 <div class="service-card"><div class="service-content"><div class="service-pill">Resilience</div><div class="service-title">Performance</div><div class="service-desc">Capacity planning, load testing, tuning.</div></div></div>'

write_service_page "devsecops" "DevSecOps Integration" \
"Embed security into CI/CD: shift-left testing, least privilege, and secure runtime controls." \
"devsecops.jpg" \
'<div class="service-card"><div class="service-content"><div class="service-pill">Testing</div><div class="service-title">Security Gates</div><div class="service-desc">SAST/DAST + dependency scanning in pipelines.</div></div></div>
 <div class="service-card"><div class="service-content"><div class="service-pill">IAM</div><div class="service-title">Least Privilege</div><div class="service-desc">Role-based access, MFA enforcement, reviews.</div></div></div>
 <div class="service-card"><div class="service-content"><div class="service-pill">Compliance</div><div class="service-title">As Code</div><div class="service-desc">Auditable controls through automation.</div></div></div>
 <div class="service-card"><div class="service-content"><div class="service-pill">Cloud</div><div class="service-title">Runtime Security</div><div class="service-desc">Hardening, policy enforcement, secure baselines.</div></div></div>'

write_service_page "iac" "Infrastructure as Code (IaC)" \
"Automate cloud infrastructure with code using Terraform, CloudFormation, and Ansible." \
"iac.jpg" \
'<div class="service-card"><div class="service-content"><div class="service-pill">Terraform</div><div class="service-title">Modules</div><div class="service-desc">Reusable patterns for multiple environments.</div></div></div>
 <div class="service-card"><div class="service-content"><div class="service-pill">Governance</div><div class="service-title">Drift Control</div><div class="service-desc">Prevent manual changes and configuration drift.</div></div></div>
 <div class="service-card"><div class="service-content"><div class="service-pill">Recovery</div><div class="service-title">DR Automation</div><div class="service-desc">Backups, restore plans, and failover workflows.</div></div></div>
 <div class="service-card"><div class="service-content"><div class="service-pill">CI</div><div class="service-title">Infra Pipelines</div><div class="service-desc">Plan/apply workflows with approvals and checks.</div></div></div>'

write_service_page "cybersecurity" "Cybersecurity Solutions" \
"Reduce risk with visibility, hardening, vulnerability management, and incident readiness." \
"cybersecurity.jpg" \
'<div class="service-card"><div class="service-content"><div class="service-pill">Threat</div><div class="service-title">Detection</div><div class="service-desc">Logging, alerting, and response workflows.</div></div></div>
 <div class="service-card"><div class="service-content"><div class="service-pill">Identity</div><div class="service-title">IAM Hardening</div><div class="service-desc">Least privilege, MFA, and access governance.</div></div></div>
 <div class="service-card"><div class="service-content"><div class="service-pill">Vuln</div><div class="service-title">Remediation</div><div class="service-desc">Scanning + patching strategy with tracking.</div></div></div>
 <div class="service-card"><div class="service-content"><div class="service-pill">Architecture</div><div class="service-title">Security Design</div><div class="service-desc">Segmentation, encryption, secure baselines.</div></div></div>'

# Keep your existing login/contact/error pages if you already updated them earlier.
# But ensure these exist in /WEB-INF/jsps/ (recommended).
echo "==> Ensuring error.jsp exists"
if [ ! -f src/main/webapp/WEB-INF/jsps/error.jsp ]; then
  cat > src/main/webapp/WEB-INF/jsps/error.jsp <<'JSP'
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en"><head><meta charset="UTF-8"/><meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Error</title></head><body><div class="container"><div class="card">Error.</div></div></body></html>
JSP
fi

echo ""
echo "✅ Modern UI enhancement complete."
echo "Next:"
echo "  mvn clean package"
echo "  Deploy WAR to Tomcat and open: /"

