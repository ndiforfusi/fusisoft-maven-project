<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!doctype html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <title>Contact Submitted - Fusisoft Technologies</title>

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
                    min-height: 100vh;
                    display: grid;
                    place-items: center;
                    padding: 24px;
                    font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Arial;
                    color: var(--text);
                    background:
                        radial-gradient(1200px 700px at 20% 10%, rgba(79, 140, 255, .25), transparent 55%),
                        radial-gradient(900px 600px at 80% 30%, rgba(47, 109, 255, .18), transparent 55%),
                        linear-gradient(180deg, #070b14, var(--bg));
                }

                .card {
                    width: min(740px, 100%);
                    background: var(--card);
                    border: 1px solid var(--border);
                    border-radius: var(--radius);
                    box-shadow: var(--shadow);
                    overflow: hidden;
                    backdrop-filter: blur(10px);
                }

                .header {
                    padding: 22px 22px 14px;
                    border-bottom: 1px solid rgba(255, 255, 255, .10);
                    display: flex;
                    gap: 12px;
                    align-items: center;
                }

                .badge {
                    width: 44px;
                    height: 44px;
                    display: grid;
                    place-items: center;
                    border-radius: 14px;
                    background: linear-gradient(135deg, var(--brand), var(--brand2));
                    box-shadow: 0 14px 30px rgba(47, 109, 255, .25);
                    font-size: 22px;
                }

                h1 {
                    margin: 0;
                    font-size: 20px;
                    letter-spacing: .2px;
                }

                .subtitle {
                    margin: 4px 0 0;
                    color: var(--muted);
                    font-size: 14px;
                    line-height: 1.45;
                }

                .content {
                    padding: 18px 22px 22px;
                    line-height: 1.6;
                    color: rgba(255, 255, 255, .86);
                    font-size: 15px;
                }

                .actions {
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
                    padding: 12px 14px;
                    border-radius: 12px;
                    font-weight: 700;
                    user-select: none;
                    text-decoration: none;
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    min-width: 150px;
                    transition: transform .05s ease, filter .15s ease;
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

                .foot {
                    margin-top: 14px;
                    color: var(--muted);
                    font-size: 12px;
                }
            </style>
        </head>

        <body>

            <c:set var="displayName" value="${not empty sessionScope.contactName ? sessionScope.contactName
              : (not empty sessionScope.name ? sessionScope.name : 'Friend')}" />

            <c:url var="homeUrl" value="/services/home" />
            <c:url var="contactUrl" value="/jsps/contact.jsp" />

            <section class="card" aria-labelledby="title">
                <div class="header">
                    <div class="badge" aria-hidden="true">✓</div>
                    <div>
                        <h1 id="title">Thank you! We’ve received your message.</h1>
                        <p class="subtitle">Our team will review your request and get back to you soon.</p>
                    </div>
                </div>

                <div class="content">
                    <p>Dear <strong>
                            <c:out value="${displayName}" />
                        </strong>,</p>

                    <p>
                        Thank you for reaching out to Fusisoft Technologies. We have received your project details
                        and will respond within 1–2 business days.
                    </p>

                    <p>
                        Best regards,<br />
                        <strong>Fusisoft Technologies Team</strong>
                    </p>

                    <div class="actions">
                        <a class="btn btn-primary" href="${homeUrl}">Back to Home</a>
                        <a class="btn btn-ghost" href="${contactUrl}">Submit another request</a>
                    </div>

                    <div class="foot">
                        If you don’t hear back, please check your spam folder or resend your message.
                    </div>
                </div>
            </section>

        </body>

        </html>