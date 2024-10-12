<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Fusisoft Technologies - Experts in IT Consulting & Engineering</title>
		<link href="images/symbol_logo.jpg" rel="icon">
		<style>
			body {
				font-family: Arial, sans-serif;
				margin: 0;
				padding: 0;
				background-color: #f4f4f4;
			}

			header {
				text-align: center;
				padding: 20px;
				background-color: #003366;
				color: white;
			}

			header img {
				width: 80px;
				height: auto;
			}

			header h1 {
				margin: 10px 0;
				font-size: 2em;
			}

			header h2 {
				font-size: 1.2em;
				margin: 5px 0;
			}

			.services-section {
				padding: 50px 20px;
				background-color: #fff;
				text-align: center;
			}

			.services-section h2 {
				color: #003366;
				font-size: 2em;
				margin-bottom: 40px;
			}

			.service {
				display: inline-block;
				width: 250px;
				margin: 20px;
				padding: 20px;
				border: 1px solid #ddd;
				border-radius: 8px;
				background-color: #f9f9f9;
			}

			.service img {
				width: 100%;
				height: auto;
				border-radius: 8px;
			}

			.service h3 {
				color: #003366;
				font-size: 1.5em;
			}

			.service a {
				text-decoration: none;
				color: #003366;
				font-weight: bold;
			}

			.service a:hover {
				text-decoration: underline;
			}

			.contact-info {
				text-align: center;
				margin: 50px 0;
			}

			.contact-info p {
				font-size: 1.2em;
			}

			.contact-info a {
				color: #003366;
				font-weight: bold;
				text-decoration: none;
			}

			.contact-info a:hover {
				text-decoration: underline;
			}

			footer {
				padding: 20px;
				background-color: #003366;
				color: white;
				text-align: center;
			}

			footer a {
				color: #ffcc00;
			}

			footer small {
				display: block;
				margin-top: 10px;
			}
		</style>
	</head>

	<body>
		<!-- Header Section -->
		<header>
			<img src="images/symbol_logo.jpg" alt="Fusisoft Logo">
			<h1>Fusisoft Technologies</h1>
			<h2>Your Partner in IT Consulting & Engineering</h2>
		</header>

		<!-- Services Section -->
		<section class="services-section">
			<h2>Our Services</h2>

			<!-- Service 1: DevOps Consulting -->
			<div class="service">
				<img src="images/devops.jpg" alt="DevOps Consulting">
				<h3>DevOps Consulting</h3>
				<a href="devops-consulting.jsp">Learn More</a>
			</div>

			<!-- Service 2: SRE -->
			<div class="service">
				<img src="images/sre.jpg" alt="Site Reliability Engineering">
				<h3>Site Reliability Engineering (SRE)</h3>
				<a href="sre.jsp">Learn More</a>
			</div>

			<!-- Service 3: DevSecOps -->
			<div class="service">
				<img src="images/devsecops.jpg" alt="DevSecOps Integration">
				<h3>DevSecOps Integration</h3>
				<a href="devsecops.jsp">Learn More</a>
			</div>

			<!-- Service 4: Infrastructure as Code -->
			<div class="service">
				<img src="images/iac.jpg" alt="Infrastructure as Code">
				<h3>Infrastructure as Code (IaC)</h3>
				<a href="iac.jsp">Learn More</a>
			</div>

			<!-- Service 5: Cybersecurity -->
			<div class="service">
				<img src="images/cybersecurity.jpg" alt="Cybersecurity Solutions">
				<h3>Cybersecurity Solutions</h3>
				<a href="cybersecurity.jsp">Learn More</a>
			</div>
		</section>

		<!-- Contact Information Section -->
		<div class="contact-info">
			<p><strong>Have a Project?</strong> Contact Us Below:</p>
			<p><a href="contact.jsp">Submit Your Project Details</a></p>
		</div>

		<!-- Footer Section -->
		<footer>
			<p>Fusisoft Technologies - Innovating IT Solutions for the Future</p>
			<small>&copy; 2024 <a href="http://fusisoft.com" target="_blank">Fusisoft Technologies</a></small>
		</footer>

	</body>

	</html>