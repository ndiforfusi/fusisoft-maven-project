<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <c:if test="${empty sessionScope.user}">
            <c:redirect url="login.jsp" />
        </c:if>

        <!doctype html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <title>Admin Dashboard</title>

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
                    width: min(900px, 100%);
                    background: var(--card);
                    border: 1px solid var(--border);
                    border-radius: var(--radius);
                    box-shadow: var(--shadow);
                    backdrop-filter: blur(10px);
                    padding: 22px;
                }

                .header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    gap: 12px;
                    border-bottom: 1px solid rgba(255, 255, 255, .10);
                    padding-bottom: 14px;
                    margin-bottom: 16px;
                }

                h1 {
                    margin: 0;
                    font-size: 22px;
                }

                .user {
                    color: var(--muted);
                    font-size: 14px;
                }

                .content {
                    font-size: 15px;
                    line-height: 1.6;
                    color: rgba(255, 255, 255, .86);
                }

                .actions {
                    margin-top: 18px;
                    display: flex;
                    gap: 12px;
                    flex-wrap: wrap;
                }

                .btn {
                    appearance: none;
                    border: 0;
                    cursor: pointer;
                    border-radius: 12px;
                    padding: 12px 14px;
                    font-weight: 700;
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
            </style>
        </head>

        <body>

            <c:url var="logoutUrl" value="/logout" />
            <c:url var="contactsUrl" value="/admin/contacts" />

            <section class="card" role="main">
                <div class="header">
                    <div>
                        <h1>Admin Dashboard</h1>
                        <div class="user">
                            Welcome, <strong>
                                <c:out value="${sessionScope.user}" />
                            </strong>
                        </div>
                    </div>

                    <a class="btn btn-ghost" href="${logoutUrl}">Logout</a>
                </div>

                <div class="content">
                    <p>
                        Here you can view and manage submitted contact requests,
                        monitor activity, and perform administrative actions.
                    </p>

                    <div class="actions">
                        <a class="btn btn-primary" href="${contactsUrl}">
                            View Contact Requests
                        </a>
                    </div>
                </div>
            </section>

        </body>

        </html>