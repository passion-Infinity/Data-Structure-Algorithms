<%-- 
    Document   : index
    Created on : Oct 12, 2020, 12:25:46 PM
    Author     : User
--%>

<%@page import="danhnlc.dtos.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="common/head-page.jsp" %>
        <title>Home - Page</title>
    </head>
    <body style="background-image: url(img/hero-bg.jpg); background-repeat: no-repeat;">
        
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            User user = (User) session.getAttribute("LOGIN_USER");

            if (user == null) {
                response.sendRedirect("index.jsp");
            } else if (!user.getRoleID().equals("CUS")) {
                response.sendRedirect("index.jsp");
            }
        %>
        
        <h3 style="color: white; font-weight: 800">Hello, ${sessionScope.LOGIN_USER.fullname}</h3>
        <div class="container" style="margin-top: 250px;text-align: center;font-weight: 1000">
            <h2 style="color: white; font-weight: 800">WELCOME TO RESORT</h2>
            <br/>
            <form action="MainController">
                <button class="btn btn-danger btn-group-xlg" style="font-size: 20px; width: 200px; height: 50px"
                        type="submit" name="btnAction" value="Search">
                    BOOK NOW
                </button>
                <br/>
                <br/>
                <button class="btn btn-danger" style="font-size: 20px; width: 200px; height: 50px"
                        type="submit" name="btnAction" value="Logout">
                    LOG OUT
                </button>
            </form>
        </div>
    </body>
</html>
