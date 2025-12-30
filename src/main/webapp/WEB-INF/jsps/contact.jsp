<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!doctype html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <title>Contact Us - Fusisoft Technologies</title>

            <style>
                :root {
                    --bg: #0b1220;
                    --card: rgba(255, 255, 255, .06);
                    --card-border: rgba(255, 255, 255, .14);
                    --text: rgba(255, 255, 255, .92);
                    --muted: rgba(255, 255, 255, .70);
                    --brand: #4f8cff;
                    --brand-2: #2f6dff;
                    --danger: #ff5c5c;
                    --shadow: 0 18px 60px rgba(0, 0, 0, .35);
                    --radius: 16px;
                }

                * {
                    box-sizing: border-box;
                }

                body {
                    margin: 0;
                    font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Arial, "Apple Color Emoji", "Segoe UI Emoji";
                    color: var(--text);
                    min-height: 100vh;
                    display: grid;
                    place-items: center;
                    padding: 24px;
                    background:
                        radial-gradient(1200px 700px at 20% 10%, rgba(79, 140, 255, .25), transparent 55%),
                        radial-gradient(900px 600px at 80% 30%, rgba(47, 109, 255, .18), transparent 55%),
                        linear-gradient(180deg, #070b14, var(--bg));
                }

                .wrap {
                    width: min(920px, 100%);
                    display: grid;
                    grid-template-columns: 1.1fr .9fr;
                    gap: 18px;
                    align-items: start;
                }

                @media (max-width: 880px) {
                    .wrap {
                        grid-template-columns: 1fr;
                    }
                }

                .card {
                    background: var(--card);
                    border: 1px solid var(--card-border);
                    border-radius: var(--radius);
                    box-shadow: var(--shadow);
                    overflow: hidden;
                    backdrop-filter: blur(10px);
                }

                .header {
                    padding: 22px 22px 14px;
                    border-bottom: 1px solid rgba(255, 255, 255, .10);
                }

                .title {
                    margin: 0;
                    font-size: 22px;
                    letter-spacing: .2px;
                }

                .subtitle {
                    margin: 6px 0 0;
                    color: var(--muted);
                    line-height: 1.45;
                    font-size: 14px;
                }

                .content {
                    padding: 18px 22px 22px;
                }

                .grid {
                    display: grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 14px;
                }

                @media (max-width: 640px) {
                    .grid {
                        grid-template-columns: 1fr;
                    }
                }

                label {
                    display: block;
                    font-size: 13px;
                    color: var(--muted);
                    margin: 0 0 6px;
                }

                input,
                textarea {
                    width: 100%;
                    padding: 12px 12px;
                    border-radius: 12px;
                    border: 1px solid rgba(255, 255, 255, .18);
                    background: rgba(255, 255, 255, .06);
                    color: var(--text);
                    outline: none;
                    transition: border-color .15s ease, box-shadow .15s ease, transform .05s ease;
                }

                input::placeholder,
                textarea::placeholder {
                    color: rgba(255, 255, 255, .45);
                }

                input:focus,
                textarea:focus {
                    border-color: rgba(79, 140, 255, .85);
                    box-shadow: 0 0 0 4px rgba(79, 140, 255, .20);
                }

                textarea {
                    resize: vertical;
                    min-height: 130px;
                }

                .actions {
                    display: flex;
                    gap: 12px;
                    align-items: center;
                    margin-top: 14px;
                }

                .btn {
                    appearance: none;
                    border: 0;
                    cursor: pointer;
                    padding: 12px 14px;
                    border-radius: 12px;
                    font-weight: 600;
                    transition: transform .05s ease, filter .15s ease;
                    user-select: none;
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    min-width: 140px;
                }

                .btn:active {
                    transform: translateY(1px);
                }

                .btn-primary {
                    background: linear-gradient(135deg, var(--brand), var(--brand-2));
                    color: white;
                    box-shadow: 0 14px 30px rgba(47, 109, 255, .25);
                }

                .btn-primary:hover {
                    filter: brightness(1.05);
                }

                .hint {
                    font-size: 12px;
                    color: var(--muted);
                    margin: 0;
                }

                .side {
                    padding: 22px;
                }

                .side h3 {
                    margin: 0 0 8px;
                    font-size: 16px;
                }

                .side p {
                    margin: 0 0 12px;
                    color: var(--muted);
                    line-height: 1.5;
                    font-size: 14px;
                }

                .pill {
                    display: inline-flex;
                    align-items: center;
                    gap: 8px;
                    padding: 10px 12px;
                    border-radius: 999px;
                    border: 1px solid rgba(255, 255, 255, .14);
                    background: rgba(255, 255, 255, .05);
                    color: rgba(255, 255, 255, .85);
                    font-size: 13px;
                    margin-top: 6px;
                }

                .status {
                    margin-top: 10px;
                    padding: 10px 12px;
                    border-radius: 12px;
                    border: 1px solid rgba(255, 255, 255, .14);
                    background: rgba(255, 255, 255, .05);
                    color: var(--muted);
                    font-size: 13px;
                }

                .error {
                    border-color: rgba(255, 92, 92, .35);
                    background: rgba(255, 92, 92, .08);
                    color: rgba(255, 255, 255, .88);
                }
            </style>
        </head>

        <body>

            <c:url var="contactAction" value="/services/contact" />

            <div class="wrap">

                <!-- Main Form Card -->
                <section class="card" aria-labelledby="contactTitle">
                    <div class="header">
                        <h1 class="title" id="contactTitle">Contact Us</h1>
                        <p class="subtitle">Tell us about your project. We’ll reply within 1–2 business days.</p>
                    </div>

                    <div class="content">
                        <%-- Optional: show an error state if redirected with ?error=true --%>
                            <c:if test="${param.error == 'true'}">
                                <div class="status error" role="alert">
                                    Login failed or submission error. Please try again.
                                </div>
                            </c:if>

                            <form action="${contactAction}" method="post" novalidate>
                                <div class="grid">
                                    <div>
                                        <label for="name">Full name</label>
                                        <input type="text" id="name" name="name" required minlength="2"
                                            autocomplete="name" placeholder="e.g., John Doe" />
                                    </div>

                                    <div>
                                        <label for="phone">Contact phone</label>
                                        <input type="tel" id="phone" name="phone" required autocomplete="tel"
                                            placeholder="e.g., +1 (555) 123-4567" />
                                    </div>
                                </div>

                                <div style="margin-top:14px;">
                                    <label for="email">Email address</label>
                                    <input type="email" id="email" name="email" required autocomplete="email"
                                        placeholder="e.g., you@company.com" />
                                </div>

                                <div style="margin-top:14px;">
                                    <label for="message">Project details</label>
                                    <textarea id="message" name="message" required minlength="10"
                                        placeholder="Share your goals, timeline, and any useful details..."></textarea>
                                </div>

                                <div class="actions">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    <p class="hint">By submitting, you agree to be contacted about your request.</p>
                                </div>
                            </form>
                    </div>
                </section>

                <!-- Side Info Card -->
                <aside class="card side">
                    <h3>Fusisoft Technologies</h3>
                    <p>
                        Web apps, DevOps, cloud solutions, and consulting—built for reliability and scale.
                    </p>

                    <div class="pill">✅ Fast response</div><br />
                    <div class="pill">🔒 Your info stays private</div><br />
                    <div class="pill">☁️ Cloud & DevOps expertise</div>

                    <div class="status" style="margin-top:14px;">
                        Tip: Include your preferred contact time and any links (docs, GitHub, etc.).
                    </div>
                </aside>

            </div>

        </body>

        </html>