<%--
  Created by IntelliJ IDEA.
  User: Manase
  Date: 28 Jun 2019
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<link href="registration form.css" rel="stylesheet">

<div class="testbox">
    <h1>Registration</h1>
    <body>

    </body>
    <form action="Registration.jsp" method="post">

        <hr>
        <div class="accounttype">
            <input type="radio" value="None" id="radioOne" name="account" checked/>
            <label for="radioOne" class="radio" chec>Personal</label>
            <input type="radio" value="None" id="radioTwo" name="account"/>
            <label for="radioTwo" class="radio">Company</label>
        </div>

        <hr>
        <label id="icon" for="name"><i class="icon-envelope "></i></label>
        <input type="text" name="email" id="name" placeholder="Email" required/>
        <label id="icon" for="name"><i class="icon-user"></i></label>
        <input type="text" name="username" id="name" placeholder="Name" required/>
        <label id="icon" for="name"><i class="icon-shield"></i></label>

        <input type="password" name="password" id="name" placeholder="Password" required/>
        <div class="gender">
            <input type="radio" value="None" id="male" name="gender" checked/>
            <label for="male" class="radio" chec>Male</label>
            <input type="radio" value="None" id="female" name="gender"/>
            <label for="female" class="radio">Female</label>
        </div>

        <p>By clicking Register, you agree on our <a href="#">terms and condition</a>.</p>
        <button class="button" class="button">Register</button>
    </form>
</div>