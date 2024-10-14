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
				position: relative;
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

			/* Admin Login Icon */
			.admin-login {
				position: absolute;
				top: 10px;
				right: 20px;
			}

			.admin-login img {
				width: 30px;
				cursor: pointer;
			}

			.services-section {
				padding: 50px 20px;
				background-color: #fff;
				text-align: center;
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

			.logo-container {
				text-align: center;
				margin: 50px 0;
			}

			.logo-container img {
				width: 300px;
				height: auto;
			}
		</style>
	</head>

	<body>
		<!-- Header Section -->
		<header>
			<img src="images/symbol_logo.jpg" alt="Fusisoft Logo">
			<h1>Fusisoft Technologies</h1>
			<h2>Your Partner in IT Consulting & Engineering</h2>

			<!-- Admin Login Icon -->
			<div class="admin-login">
				<a href="jsps/login.jsp">
					<img src="images/admin-icon.png" alt="Admin Login">
				</a>
			</div>
		</header>

		<!-- Services Section -->
		<section class="services-section">
			<h2>Our Services</h2>
			<div class="service">
				<img src="images/devops.jpg" alt="DevOps Consulting">
				<h3>DevOps Consulting</h3>
				<p>Accelerate your software development lifecycle with our DevOps expertise. We help you automate,
					scale,
					and optimize your development processes.</p>
				<a href="jsps/devops-consulting.jsp">Learn More</a>
			</div>
			<div class="service">
				<img src="images/sre.jpg" alt="SRE">
				<h3>Site Reliability Engineering (SRE)</h3>
				<p>Ensure high availability and top-notch performance of your services through our proven SRE
					methodologies, built for resilience and efficiency.</p>
				<a href="jsps/sre.jsp">Learn More</a>
			</div>
			<div class="service">
				<img src="images/devsecops.jpg" alt="DevSecOps Integration">
				<h3>DevSecOps Integration</h3>
				<p>Embed security within your development pipeline, ensuring every application and system is protected
					with
					advanced security protocols from the start.</p>
				<a href="jsps/devsecops.jsp">Learn More</a>
			</div>
			<div class="service">
				<img src="images/iac.jpg" alt="Infrastructure as Code">
				<h3>Infrastructure as Code (IaC)</h3>
				<p>Automate your infrastructure setup with our IaC solutions, leveraging tools like Terraform and AWS
					CloudFormation to manage your cloud environments.</p>
				<a href="jsps/iac.jsp">Learn More</a>
			</div>
			<div class="service">
				<img src="images/cybersecurity.jpg" alt="Cybersecurity Solutions">
				<h3>Cybersecurity Solutions</h3>
				<p>Protect your business with our comprehensive cybersecurity services, from vulnerability assessments
					to
					full threat monitoring and incident response.</p>
				<a href="jsps/cybersecurity.jsp">Learn More</a>
			</div>
		</section>

		<!-- Contact Information Section -->
		<div class="contact-info">
			<p><strong>Have a Project?</strong> Contact Us Below:</p>
			<p><a href="jsps/contact.jsp">Submit Your Project Details</a></p>
		</div>

		<!-- Logo Section -->
		<div class="logo-container">
			<img src="images/Logo-principal.jpg" alt="Fusisoft Logo">
		</div>

		<!-- Footer Section -->
		<footer>
			<p>Fusisoft Technologies - Innovating IT Solutions for the Future</p>
			<small>&copy; 2024 <a href="http://fusisoft.com" target="_blank">Fusisoft Technologies</a></small>
		</footer>
	</body>

	</html>