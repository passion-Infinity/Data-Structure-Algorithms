<%-- 
    Document   : admin_register
    Created on : Oct 7, 2020, 12:56:40 PM
    Author     : User
--%>

<%@page import="danhnlc.dtos.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            if (session.getAttribute("LOGIN_USER") == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        
        <%
            UserError error = (UserError) request.getAttribute("ERROR");
            if (error == null) {
                error = new UserError("", "", "", "", "");
            }
        %>
        <div class="container">
            <h1>Register Page</h1>
            <form action="MainController" method="POST">
                <label>Username: </label>
                <input type="text" name="txtUsername" value="" size="30"/>
                <%= error.getUsernameError()%><br/><br/>
                <label>Fullanme: </label>
                <input type="text" name="txtFullname" value="" size="30" />
                <%= error.getFullnameError()%><br/><br/>
                <label>Password: </label>
                <input type="password" name="txtPassword" value="" size="30"/>
                <%= error.getPasswordError()%><br/><br/>
                <label>Confirm:</label>
                <input type="password" name="txtConfirm" value="" size="30"/>
                <%= error.getConfirmError()%><br/><br/>
                <select name="txtRole">
                    <option>admin</option>
                    <option>user</option>
                </select><br/><br/>
                <input type="submit" name="btnAction" value="Register" />
                <input type="reset" value="Reset" />
            </form>
        </div>
    </body>
</html>
