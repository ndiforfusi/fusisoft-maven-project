<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!doctype html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>DevSecOps Integration - Fusisoft Technologies</title>

            <%-- Make CSS link context-safe --%>
                <c:url var="mainCss" value="/styles/main.css" />
                <link rel="stylesheet" href="${mainCss}" />

                <style>
                    :root {
                        --bg: #0b1220;
                        --card: rgba(255, 255, 255, .06);
                        --border: rgba(255, 255, 255, .14);
                        --text: rgba(255, 255, 255, .92);
                        --muted: rgba(255, 255, 255, .70);
                        --brand: #4f8cff;
                        --brand2: #2f6dff;
                        --shadow: 0 18px 60px rgba(0, 0, 0, .35);
                        --radius: 16px;
                    }

                    * {
                        box-sizing: border-box;
                    }

                    body {
                        margin: 0;
                        font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Arial;
                        color: var(--text);
                        background:
                            radial-gradient(1200px 700px at 20% 10%, rgba(79, 140, 255, .25), transparent 55%),
                            radial-gradient(900px 600px at 80% 30%, rgba(47, 109, 255, .18), transparent 55%),
                            linear-gradient(180deg, #070b14, var(--bg));
                        min-height: 100vh;
                    }

                    .container {
                        width: min(1100px, 100%);
                        margin: 0 auto;
                        padding: 26px 18px 48px;
                    }

                    .topbar {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        gap: 12px;
                        padding: 14px 0 22px;
                    }

                    .brand {
                        font-weight: 800;
                        letter-spacing: .2px;
                        text-decoration: none;
                        color: var(--text);
                        display: flex;
                        align-items: center;
                        gap: 10px;
                    }

                    .logo {
                        width: 38px;
                        height: 38px;
                        border-radius: 12px;
                        background: linear-gradient(135deg, var(--brand), var(--brand2));
                        box-shadow: 0 14px 30px rgba(47, 109, 255, .25);
                        display: grid;
                        place-items: center;
                        font-weight: 900;
                        color: white;
                    }

                    .nav {
                        display: flex;
                        gap: 10px;
                        flex-wrap: wrap;
                        justify-content: flex-end;
                    }

                    .nav a {
                        color: rgba(255, 255, 255, .85);
                        text-decoration: none;
                        padding: 10px 12px;
                        border-radius: 12px;
                        border: 1px solid rgba(255, 255, 255, .12);
                        background: rgba(255, 255, 255, .05);
                    }

                    .nav a:hover {
                        filter: brightness(1.08);
                    }

                    .hero {
                        border: 1px solid var(--border);
                        background: var(--card);
                        border-radius: var(--radius);
                        box-shadow: var(--shadow);
                        padding: 22px;
                        backdrop-filter: blur(10px);
                    }

                    .hero h1 {
                        margin: 0;
                        font-size: clamp(26px, 3.2vw, 40px);
                        line-height: 1.1;
                        letter-spacing: .2px;
                    }

                    .hero p {
                        margin: 10px 0 0;
                        color: var(--muted);
                        max-width: 72ch;
                        line-height: 1.55;
                        font-size: 15px;
                    }

                    .cta {
                        margin-top: 16px;
                        display: flex;
                        gap: 12px;
                        flex-wrap: wrap;
                        align-items: center;
                    }

                    .btn {
                        appearance: none;
                        border: 0;
                        cursor: pointer;
                        border-radius: 12px;
                        padding: 12px 14px;
                        font-weight: 800;
                        text-decoration: none;
                        display: inline-flex;
                        align-items: center;
                        justify-content: center;
                        min-width: 180px;
                        transition: transform .05s ease, filter .15s ease;
                        user-select: none;
                    }

                    .btn:active {
                        transform: translateY(1px);
                    }

                    .btn-primary {
                        color: white;
                        background: linear-gradient(135deg, var(--brand), var(--brand2));
                        box-shadow: 0 14px 30px rgba(47, 109, 255, .25);
                    }

                    .btn-primary:hover {
                        filter: brightness(1.05);
                    }

                    .btn-ghost {
                        color: rgba(255, 255, 255, .88);
                        background: rgba(255, 255, 255, .06);
                        border: 1px solid rgba(255, 255, 255, .14);
                    }

                    .btn-ghost:hover {
                        filter: brightness(1.08);
                    }

                    .grid {
                        margin-top: 18px;
                        display: grid;
                        grid-template-columns: 1.2fr .8fr;
                        gap: 18px;
                        align-items: start;
                    }

                    @media (max-width: 920px) {
                        .grid {
                            grid-template-columns: 1fr;
                        }
                    }

                    .card {
                        border: 1px solid var(--border);
                        background: var(--card);
                        border-radius: var(--radius);
                        box-shadow: var(--shadow);
                        padding: 18px 18px 16px;
                        backdrop-filter: blur(10px);
                    }

                    .card h2 {
                        margin: 0 0 8px;
                        font-size: 18px;
                    }

                    .card p {
                        margin: 0 0 12px;
                        color: var(--muted);
                        line-height: 1.6;
                        font-size: 14px;
                    }

                    .features {
                        display: grid;
                        grid-template-columns: 1fr 1fr;
                        gap: 12px;
                        margin-top: 10px;
                    }

                    @media (max-width: 640px) {
                        .features {
                            grid-template-columns: 1fr;
                        }
                    }

                    .feature {
                        border: 1px solid rgba(255, 255, 255, .12);
                        background: rgba(255, 255, 255, .05);
                        border-radius: 14px;
                        padding: 12px;
                    }

                    .feature strong {
                        display: block;
                        margin-bottom: 6px;
                    }

                    .feature span {
                        color: var(--muted);
                        font-size: 13px;
                        line-height: 1.45;
                        display: block;
                    }

                    .footer {
                        margin-top: 18px;
                        color: var(--muted);
                        font-size: 13px;
                        text-align: center;
                    }
                </style>
        </head>

        <body>

            <c:url var="homeUrl" value="/services/home" />
            <c:url var="contactUrl" value="/services/contact" />

            <div class="container">

                <div class="topbar">
                    <a class="brand" href="${homeUrl}">
                        <span class="logo" aria-hidden="true">F</span>
                        <span>Fusisoft Technologies</span>
                    </a>

                    <nav class="nav" aria-label="Primary navigation">
                        <a href="${homeUrl}">Home</a>
                        <a href="${contactUrl}">Contact</a>
                    </nav>
                </div>

                <header class="hero" aria-labelledby="pageTitle">
                    <h1 id="pageTitle">DevSecOps Integration</h1>
                    <p>Embedding security into every stage of development—so delivery stays fast, compliant, and
                        resilient.</p>

                    <div class="cta">
                        <a class="btn btn-primary" href="${contactUrl}">Reach Out to Our Experts</a>
                        <a class="btn btn-ghost" href="#why">Why DevSecOps?</a>
                    </div>
                </header>

                <main class="grid">
                    <section class="card" id="why">
                        <h2>Why DevSecOps?</h2>
                        <p>
                            Fusisoft helps organizations adopt DevSecOps by integrating security protocols into every
                            phase of the
                            development lifecycle—ensuring your applications are secure from day one.
                        </p>

                        <div class="features" role="list">
                            <div class="feature" role="listitem">
                                <strong>Continuous Security Testing</strong>
                                <span>Shift-left testing integrated into CI/CD to catch issues earlier.</span>
                            </div>
                            <div class="feature" role="listitem">
                                <strong>Automated Vulnerability Scanning</strong>
                                <span>SAST/DAST, dependency, and container image scanning with actionable
                                    reports.</span>
                            </div>
                            <div class="feature" role="listitem">
                                <strong>Compliance as Code</strong>
                                <span>Policy-as-code, guardrails, and audit-ready evidence automation.</span>
                            </div>
                            <div class="feature" role="listitem">
                                <strong>Container & Cloud Security</strong>
                                <span>Secure baselines, least privilege, and runtime protections across
                                    environments.</span>
                            </div>
                        </div>
                    </section>

                    <aside class="card">
                        <h2>What you get</h2>
                        <p>
                            A practical roadmap + hands-on implementation to improve security without slowing delivery.
                        </p>

                        <div class="feature">
                            <strong>Security pipeline blueprint</strong>
                            <span>Tools, stages, controls, and ownership aligned to your SDLC.</span>
                        </div>

                        <div class="feature" style="margin-top:12px;">
                            <strong>Quick wins + long-term maturity</strong>
                            <span>Immediate guardrails now, measurable improvements over time.</span>
                        </div>

                        <div class="cta" style="margin-top:14px;">
                            <a class="btn btn-primary" href="${contactUrl}">Request a Consultation</a>
                        </div>
                    </aside>
                </main>

                <footer class="footer">
                    Stay ahead of security risks by partnering with us for DevSecOps solutions.
                </footer>

            </div>

        </body>

        </html>