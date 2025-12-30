<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!doctype html>
		<html lang="en">

		<head>
			<meta charset="UTF-8" />
			<meta http-equiv="X-UA-Compatible" content="IE=edge" />
			<meta name="viewport" content="width=device-width, initial-scale=1.0" />
			<title>Fusisoft Technologies - Experts in IT Consulting & Engineering</title>

			<%-- Context-safe assets --%>
				<c:url var="favicon" value="/images/symbol_logo.jpg" />
				<link rel="icon" href="${favicon}" />

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
						--radius: 18px;
					}

					* {
						box-sizing: border-box;
					}

					html,
					body {
						height: 100%;
					}

					body {
						margin: 0;
						font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Arial;
						color: var(--text);
						background:
							radial-gradient(1200px 700px at 20% 10%, rgba(79, 140, 255, .25), transparent 55%),
							radial-gradient(900px 600px at 80% 30%, rgba(47, 109, 255, .18), transparent 55%),
							linear-gradient(180deg, #070b14, var(--bg));
					}

					a {
						color: inherit;
					}

					.container {
						width: min(1180px, 100%);
						margin: 0 auto;
						padding: 24px 18px 56px;
					}

					/* Top bar */
					.topbar {
						display: flex;
						justify-content: space-between;
						align-items: center;
						gap: 12px;
						padding: 12px 0 18px;
					}

					.brand {
						display: flex;
						align-items: center;
						gap: 12px;
						text-decoration: none;
						color: var(--text);
						font-weight: 900;
						letter-spacing: .2px;
					}

					.brand .mark {
						width: 42px;
						height: 42px;
						border-radius: 14px;
						display: grid;
						place-items: center;
						background: linear-gradient(135deg, var(--brand), var(--brand2));
						box-shadow: 0 14px 30px rgba(47, 109, 255, .25);
						color: white;
						font-weight: 900;
					}

					.brand .name {
						display: flex;
						flex-direction: column;
						line-height: 1.1;
					}

					.brand .name small {
						color: var(--muted);
						font-weight: 600;
					}

					.nav {
						display: flex;
						gap: 10px;
						flex-wrap: wrap;
						justify-content: flex-end;
					}

					.nav a {
						text-decoration: none;
						padding: 10px 12px;
						border-radius: 12px;
						border: 1px solid rgba(255, 255, 255, .12);
						background: rgba(255, 255, 255, .05);
						color: rgba(255, 255, 255, .88);
					}

					.nav a:hover {
						filter: brightness(1.08);
					}

					/* Hero */
					.hero {
						border: 1px solid var(--border);
						background: var(--card);
						border-radius: var(--radius);
						box-shadow: var(--shadow);
						backdrop-filter: blur(10px);
						padding: 26px;
						overflow: hidden;
						position: relative;
					}

					.hero h1 {
						margin: 0;
						font-size: clamp(28px, 3.6vw, 44px);
						line-height: 1.08;
						letter-spacing: .2px;
					}

					.hero p {
						margin: 12px 0 0;
						color: var(--muted);
						max-width: 76ch;
						font-size: 15px;
						line-height: 1.6;
					}

					.hero .cta {
						margin-top: 18px;
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

					/* Sections */
					.section-title {
						margin: 26px 0 14px;
						font-size: 18px;
						color: rgba(255, 255, 255, .88);
						letter-spacing: .2px;
					}

					/* Services grid */
					.grid {
						display: grid;
						grid-template-columns: repeat(12, 1fr);
						gap: 14px;
						align-items: stretch;
					}

					.service {
						grid-column: span 4;
						border: 1px solid var(--border);
						background: var(--card);
						border-radius: var(--radius);
						box-shadow: var(--shadow);
						overflow: hidden;
						backdrop-filter: blur(10px);
						display: flex;
						flex-direction: column;
						min-height: 100%;
					}

					@media (max-width: 980px) {
						.service {
							grid-column: span 6;
						}
					}

					@media (max-width: 640px) {
						.service {
							grid-column: span 12;
						}
					}

					.service img {
						width: 100%;
						height: 160px;
						object-fit: cover;
						display: block;
						filter: saturate(1.05);
					}

					.service .body {
						padding: 14px 14px 16px;
						display: flex;
						flex-direction: column;
						gap: 10px;
						flex: 1;
					}

					.service h3 {
						margin: 0;
						font-size: 16px;
						letter-spacing: .2px;
					}

					.service p {
						margin: 0;
						color: var(--muted);
						font-size: 13.5px;
						line-height: 1.55;
						flex: 1;
					}

					.service a {
						text-decoration: none;
						font-weight: 800;
						color: rgba(255, 255, 255, .92);
						border: 1px solid rgba(255, 255, 255, .14);
						background: rgba(255, 255, 255, .06);
						padding: 10px 12px;
						border-radius: 12px;
						display: inline-flex;
						align-items: center;
						justify-content: center;
						width: fit-content;
					}

					.service a:hover {
						filter: brightness(1.08);
					}

					/* Split section */
					.split {
						margin-top: 18px;
						display: grid;
						grid-template-columns: 1.1fr .9fr;
						gap: 14px;
						align-items: start;
					}

					@media (max-width: 920px) {
						.split {
							grid-template-columns: 1fr;
						}
					}

					.card {
						border: 1px solid var(--border);
						background: var(--card);
						border-radius: var(--radius);
						box-shadow: var(--shadow);
						backdrop-filter: blur(10px);
						padding: 16px;
					}

					.card h3 {
						margin: 0 0 8px;
						font-size: 16px;
					}

					.card p {
						margin: 0 0 12px;
						color: var(--muted);
						font-size: 14px;
						line-height: 1.6;
					}

					/* Admin login */
					.form {
						display: grid;
						gap: 10px;
						margin-top: 10px;
					}

					label {
						font-size: 12px;
						color: var(--muted);
						margin-bottom: 4px;
						display: block;
					}

					input {
						width: 100%;
						padding: 12px;
						border-radius: 12px;
						border: 1px solid rgba(255, 255, 255, .18);
						background: rgba(255, 255, 255, .06);
						color: var(--text);
						outline: none;
					}

					input:focus {
						border-color: rgba(79, 140, 255, .85);
						box-shadow: 0 0 0 4px rgba(79, 140, 255, .18);
					}

					/* Footer */
					footer {
						margin-top: 18px;
						text-align: center;
						color: var(--muted);
						font-size: 13px;
						padding: 18px 0 0;
					}

					footer a {
						color: rgba(255, 255, 255, .90);
					}
				</style>
		</head>

		<body>

			<%-- Context-safe links --%>
				<c:url var="devopsUrl" value="/jsps/devops-consulting.jsp" />
				<c:url var="sreUrl" value="/jsps/sre.jsp" />
				<c:url var="devsecopsUrl" value="/jsps/devsecops.jsp" />
				<c:url var="iacUrl" value="/jsps/iac.jsp" />
				<c:url var="cyberUrl" value="/jsps/cybersecurity.jsp" />

				<%-- Prefer controller route for contact --%>
					<c:url var="contactUrl" value="/services/contact" />
					<c:url var="homeUrl" value="/services/home" />

					<%-- Images --%>
						<c:url var="symbolLogo" value="/images/symbol_logo.jpg" />
						<c:url var="logoPrincipal" value="/images/Logo-principal.jpg" />
						<c:url var="imgDevops" value="/images/devops.jpg" />
						<c:url var="imgSre" value="/images/sre.jpg" />
						<c:url var="imgDevsecops" value="/images/devsecops.jpg" />
						<c:url var="imgIac" value="/images/iac.jpg" />
						<c:url var="imgCyber" value="/images/cybersecurity.jpg" />

						<%-- Admin login endpoint (align with your servlet mapping) --%>
							<c:url var="adminLoginUrl" value="/login" />

							<div class="container">

								<!-- Top Bar -->
								<div class="topbar">
									<a class="brand" href="${homeUrl}">
										<span class="mark" aria-hidden="true">F</span>
										<span class="name">
											Fusisoft Technologies
											<small>IT Consulting & Engineering</small>
										</span>
									</a>

									<nav class="nav" aria-label="Primary navigation">
										<a href="#services">Services</a>
										<a href="${contactUrl}">Contact</a>
										<a href="#admin">Admin</a>
									</nav>
								</div>

								<!-- Hero -->
								<header class="hero">
									<h1>Experts in IT Consulting & Engineering</h1>
									<p>
										We help organizations deliver faster with DevOps, SRE, DevSecOps, Infrastructure
										as Code, and Cybersecurity—
										built for reliability, security, and scale.
									</p>

									<div class="cta">
										<a class="btn btn-primary" href="${contactUrl}">Submit Your Project Details</a>
										<a class="btn btn-ghost" href="#services">Explore Services</a>
									</div>
								</header>

								<!-- Services -->
								<h2 class="section-title" id="services">Our Services</h2>

								<section class="grid" aria-label="Service offerings">

									<article class="service">
										<img src="${imgDevops}" alt="DevOps Consulting" />
										<div class="body">
											<h3>DevOps Consulting</h3>
											<p>Automate, scale, and optimize delivery pipelines—CI/CD, automation, and
												cloud-native practices.</p>
											<a href="${devopsUrl}">Learn More</a>
										</div>
									</article>

									<article class="service">
										<img src="${imgSre}" alt="Site Reliability Engineering" />
										<div class="body">
											<h3>Site Reliability Engineering (SRE)</h3>
											<p>Improve availability and performance using SLOs, error budgets,
												observability, and reliability patterns.</p>
											<a href="${sreUrl}">Learn More</a>
										</div>
									</article>

									<article class="service">
										<img src="${imgDevsecops}" alt="DevSecOps Integration" />
										<div class="body">
											<h3>DevSecOps Integration</h3>
											<p>Embed security into every stage of delivery—scanning, policy-as-code, and
												secure cloud practices.</p>
											<a href="${devsecopsUrl}">Learn More</a>
										</div>
									</article>

									<article class="service">
										<img src="${imgIac}" alt="Infrastructure as Code" />
										<div class="body">
											<h3>Infrastructure as Code (IaC)</h3>
											<p>Build repeatable cloud environments with Terraform and
												CloudFormation—fast, consistent, auditable.</p>
											<a href="${iacUrl}">Learn More</a>
										</div>
									</article>

									<article class="service">
										<img src="${imgCyber}" alt="Cybersecurity Solutions" />
										<div class="body">
											<h3>Cybersecurity Solutions</h3>
											<p>Protect your business with assessments, hardening, monitoring, and
												incident response readiness.</p>
											<a href="${cyberUrl}">Learn More</a>
										</div>
									</article>

								</section>

								<!-- Contact + Admin -->
								<section class="split" aria-label="Contact and admin access">

									<div class="card">
										<h3>Have a Project?</h3>
										<p>Tell us what you’re building and your timeline. We’ll respond within 1–2
											business days.</p>
										<a class="btn btn-primary" href="${contactUrl}">Contact Us</a>
									</div>

									<div class="card" id="admin">
										<h3>Admin Login</h3>
										<p>Authorized staff only.</p>

										<%-- NOTE: Your earlier LoginController servlet expects parameters: email &
											password. If your current servlet expects username & password, rename the
											input "email" back to "username" . --%>

											<form class="form" action="${adminLoginUrl}" method="post">
												<div>
													<label for="email">Email</label>
													<input id="email" name="email" type="email" autocomplete="username"
														required placeholder="admin@fusisoft.com" />
												</div>

												<div>
													<label for="password">Password</label>
													<input id="password" name="password" type="password"
														autocomplete="current-password" required
														placeholder="••••••••" />
												</div>

												<button class="btn btn-primary" type="submit">Login</button>
											</form>
									</div>

								</section>

								<!-- Logo -->
								<div class="card" style="margin-top:14px; text-align:center;">
									<img src="${logoPrincipal}" alt="Fusisoft Logo"
										style="width:min(320px, 90%); height:auto;" />
								</div>

								<!-- Footer -->
								<footer>
									<p>Fusisoft Technologies — Innovating IT Solutions for the Future</p>
									<small>&copy; 2024 <a href="http://fusisoft.com" target="_blank"
											rel="noopener">Fusisoft Technologies</a></small>
								</footer>

							</div>

		</body>

		</html>