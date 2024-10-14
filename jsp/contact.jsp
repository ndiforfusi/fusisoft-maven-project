<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Contact Us - Fusisoft Technologies</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                padding: 20px;
            }

            h2 {
                color: #003366;
            }

            form {
                max-width: 500px;
                margin: 0 auto;
            }

            label {
                display: block;
                margin-top: 15px;
                font-weight: bold;
            }

            input,
            textarea {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
            }

            input[type="submit"] {
                background-color: #003366;
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                margin-top: 20px;
            }

            input[type="submit"]:hover {
                background-color: #005599;
            }
        </style>
    </head>

    <body>
        <h2>Contact Us</h2>
        <form action="/contact/submitContact" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required />

            <label for="phone">Contact Phone:</label>
            <input type="tel" id="phone" name="phone" required />

            <label for="email">Email Address:</label>
            <input type="email" id="email" name="email" required />

            <label for="project">Project Details:</label>
            <textarea id="project" name="project" rows="5" required></textarea>

            <input type="submit" value="Submit" />
        </form>
    </body>

    </html>