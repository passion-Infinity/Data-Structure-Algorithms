<%-- 
    Document   : login.jsp
    Created on : Oct 7, 2020, 12:43:27 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <div class="container">
            <h1 class="title">Login Page</h1><br/>
            <form action="MainController" method="POST">
                <label>Username</label>
                <input type="text" name="txtUsername" value="" size="30"/><br/><br/>
                <label>Password</label>
                <input type="password" name="txtPassword" value="" size="30"/><br/><br/>
                <input type="submit" name="btnAction" value="Login" />
                <input type="reset" value="Reset" />
            </form>
            <br/>
            <a href="MainController?btnAction=User_register">Click here to sign up!</a>
        </div>
    </body>
</html>
