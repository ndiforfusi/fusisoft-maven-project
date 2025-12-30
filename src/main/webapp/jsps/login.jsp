<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!doctype html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <title>Admin Login - Fusisoft Technologies</title>

            <style>
                :root {
                    --bg: #0b1220;
                    --card: rgba(255, 255, 255, .06);
                    --border: rgba(255, 255, 255, .14);
                    --text: rgba(255, 255, 255, .92);
                    --muted: rgba(255, 255, 255, .70);
                    --brand: #4f8cff;
                    --brand2: #2f6dff;
                    --danger: #ff5c5c;
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
                    width: min(420px, 100%);
                    background: var(--card);
                    border: 1px solid var(--border);
                    border-radius: var(--radius);
                    box-shadow: var(--shadow);
                    backdrop-filter: blur(10px);
                    padding: 22px;
                }

                h1 {
                    margin: 0 0 6px;
                    font-size: 22px;
                    text-align: center;
                }

                .subtitle {
                    text-align: center;
                    color: var(--muted);
                    font-size: 14px;
                    margin-bottom: 16px;
                }

                .alert {
                    margin-bottom: 14px;
                    padding: 10px 12px;
                    border-radius: 12px;
                    background: rgba(255, 92, 92, .12);
                    border: 1px solid rgba(255, 92, 92, .35);
                    color: rgba(255, 255, 255, .9);
                    font-size: 13px;
                }

                form {
                    display: grid;
                    gap: 12px;
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

                .btn {
                    margin-top: 6px;
                    appearance: none;
                    border: 0;
                    cursor: pointer;
                    border-radius: 12px;
                    padding: 12px 14px;
                    font-weight: 800;
                    background: linear-gradient(135deg, var(--brand), var(--brand2));
                    color: white;
                    box-shadow: 0 14px 30px rgba(47, 109, 255, .25);
                }

                .btn:hover {
                    filter: brightness(1.05);
                }

                .foot {
                    margin-top: 14px;
                    text-align: center;
                    font-size: 12px;
                    color: var(--muted);
                }
            </style>
        </head>

        <body>

            <c:url var="loginAction" value="/login" />
            <c:url var="homeUrl" value="/services/home" />

            <section class="card" role="main">
                <h1>Admin Login</h1>
                <p class="subtitle">Authorized access only</p>

                <%-- Show error if redirected with ?error=true --%>
                    <c:if test="${param.error == 'true'}">
                        <div class="alert" role="alert">
                            Invalid email or password. Please try again.
                        </div>
                    </c:if>

                    <form action="${loginAction}" method="post" autocomplete="on">
                        <div>
                            <label for="email">Email</label>
                            <input id="email" name="email" type="email" required autocomplete="username"
                                placeholder="admin@fusisoft.com" />
                        </div>

                        <div>
                            <label for="password">Password</label>
                            <input id="password" name="password" type="password" required
                                autocomplete="current-password" placeholder="••••••••" />
                        </div>

                        <button type="submit" class="btn">Login</button>
                    </form>

                    <div class="foot">
                        <a href="${homeUrl}" style="color:inherit; text-decoration:none;">← Back to Home</a>
                    </div>
            </section>

        </body>

        </html>