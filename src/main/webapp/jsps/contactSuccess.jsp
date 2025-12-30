<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!doctype html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <title>Contact Success</title>

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
                    width: min(720px, 100%);
                    background: var(--card);
                    border: 1px solid var(--border);
                    border-radius: var(--radius);
                    box-shadow: var(--shadow);
                    overflow: hidden;
                    backdrop-filter: blur(10px);
                    text-align: center;
                }

                .header {
                    padding: 22px 22px 14px;
                    border-bottom: 1px solid rgba(255, 255, 255, .10);
                    display: grid;
                    gap: 10px;
                    justify-items: center;
                }

                .icon {
                    width: 52px;
                    height: 52px;
                    display: grid;
                    place-items: center;
                    border-radius: 16px;
                    background: linear-gradient(135deg, var(--brand), var(--brand2));
                    box-shadow: 0 14px 30px rgba(47, 109, 255, .25);
                    font-size: 26px;
                }

                h1 {
                    margin: 0;
                    font-size: 22px;
                    letter-spacing: .2px;
                }

                .subtitle {
                    margin: 0;
                    color: var(--muted);
                    font-size: 14px;
                    line-height: 1.5;
                }

                .content {
                    padding: 18px 22px 22px;
                    color: rgba(255, 255, 255, .86);
                    font-size: 15px;
                    line-height: 1.65;
                }

                .actions {
                    margin-top: 16px;
                    display: flex;
                    gap: 12px;
                    flex-wrap: wrap;
                    justify-content: center;
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
                    min-width: 160px;
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

            <c:url var="homeUrl" value="/services/home" />
            <c:url var="contactUrl" value="/jsps/contact.jsp" />

            <section class="card" role="status" aria-live="polite">
                <div class="header">
                    <div class="icon" aria-hidden="true">✓</div>
                    <h1>Thank you!</h1>
                    <p class="subtitle">Your contact details have been submitted successfully.</p>
                </div>

                <div class="content">
                    <p>We will get in touch soon.</p>

                    <div class="actions">
                        <a class="btn btn-primary" href="${homeUrl}">Back to Home</a>
                        <a class="btn btn-ghost" href="${contactUrl}">Send another message</a>
                    </div>

                    <div class="foot">
                        If you don’t hear back, please check your spam folder or resend your request.
                    </div>
                </div>
            </section>

        </body>

        </html>