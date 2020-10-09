<%-- 
    Document   : user_home
    Created on : Oct 7, 2020, 12:46:38 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
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
        <h1 class="title">Home Page</h1>
        <h2>Welcome, <%= session.getAttribute("LOGIN_USER")%></h2>
        <div class="logout"><a href="MainController?btnAction=Logout">Logout</a></div><br/>
        <div><a href="MainController?btnAction=LoadData">Click here to go to Shopping Page</a></div>
    </body>
</html>
