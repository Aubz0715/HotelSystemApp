<%-- 
    Document   : index
    Created on : 24 Jun 2019, 3:15:46 PM
    Author     : Aubrey
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>KAGISO HOTEL</title>
    <link rel="stylesheet" type="text/css" href="client login.css"/>
</head>
<body>
<div class="container">
    <section id="content">

        <form action="ConnectionDb.jsp" method="POST">
            <h1>WELCOME TO KAGISO HOTEL</h1>
            <h2>CLIENT LOGIN</h2>
            <div>
                <input type="text" placeholder="Username" required="" id="username" name="username"/>
            </div>

            <div>
                <input type="password" placeholder="Password" required="" id="password" name="password"/>
            </div>

            <div>
                <input type="submit" value="Login"/>
                <a href="#">Lost your password?</a>
                <a href="registration form.jsp">Register</a>
            </div>

        </form>

    </section>
</div>
</body>
</html>
