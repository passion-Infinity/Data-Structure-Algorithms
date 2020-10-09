<%-- 
    Document   : user_register
    Created on : Oct 7, 2020, 12:56:03 PM
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
        <div class="container">
            <h1>Register Page</h1>
            <%
                UserError error = (UserError) request.getAttribute("ERROR");
                if (error == null) {
                    error = new UserError("", "", "", "", "");
                }
            %>
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
                <label>Role</label>
                <select name="txtRole">
                    <option>user</option>
                    <option>user</option>
                </select><br/><br/>
                <input type="submit" name="btnAction" value="Register" />
                <input type="reset" value="Reset" />
            </form>
            <% session.setAttribute("ROLE", "user");%>
        </div>
    </body>
</html>
