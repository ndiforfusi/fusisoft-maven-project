<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Employee Form</title>
    </head>

    <body>
        <h2>Enter Employee Details</h2>
        <form action="saveEmployeeDetails" method="POST">
            First Name: <input type="text" name="firstName"><br><br>
            Last Name: <input type="text" name="lastName"><br><br>
            Website: <input type="text" name="website"><br><br>
            Date of Birth: <input type="date" name="dob"><br><br>
            Hobbies: <input type="text" name="hobbies"><br><br>
            Birthplace: <input type="text" name="birthPlace"><br><br>
            Favorite Places: <input type="text" name="favoritePlaces"><br><br>
            <input type="submit" value="Submit">
        </form>
    </body>

    </html>